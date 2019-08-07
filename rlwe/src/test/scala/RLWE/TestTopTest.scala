
package RLWE

import chisel3.iotesters
import chisel3.iotesters.PeekPokeTester
import chisel3.util._
import scala.util._

class TestTopTest(c: TestTop) extends PeekPokeTester(c)
  with HasNTTParameters {

  // init
  var r = Random
  poke(c.io.vs1Idx, 0)
  poke(c.io.vs2Idx, 0)
  poke(c.io.vdIdx, 0)
  for (i <- 0 until 4) {
    poke(c.io.valid(i), 0)
  }
  poke(c.io.twiddleData, 0)
  poke(c.io.twiddleAddr, 0)
  poke(c.io.twiddleWrite, false)

  // configure csrs
  poke(c.io.csrs.csrBinomialk, log2Ceil(8))
  poke(c.io.csrs.csrModulusq, 12289)
  poke(c.io.csrs.csrBarretu, scala.math.pow(2, 29).toLong / 12289)
  poke(c.io.csrs.csrModulusLen, 14)
  poke(c.io.csrs.csrBound, scala.math.pow(2, 32).toLong / 12289 * 12289)
  poke(c.io.csrs.csrButterflyCtrl.stageCfg, 0)
  poke(c.io.csrs.csrButterflyCtrl.iterCfg, 0)

  // write seed
  for (y <- 0 until 5) {
    for (x <- 0 until 5) {
      poke(c.io.seed.s(y)(x), r.nextLong())
    }
  }
  poke(c.io.seedWrite, 1)
  step(1)
  poke(c.io.seedWrite, 0)


  // waite for the buffer-filling
  step(25 * 32 + 2)

  // test fetchrn
  poke(c.io.valid(0), 1)
  for (i <- 0 until 32) {
    poke(c.io.vdIdx, i)
    step(1)
  }
  poke(c.io.valid(0), 0)
  step(1)

  // test sample
  poke(c.io.valid(1), 1)
  for (i <- 0 until 16) {
    poke(c.io.vs1Idx, 2 * i)
    poke(c.io.vs2Idx, 2 * i + 1)
    poke(c.io.vdIdx, i)
    step(1)
  }
  poke(c.io.valid(1), 0)
  step(2)

  // peek sampled value
  var s = new Array[Int](256)
  for (i <- 0 until 8) {
    poke(c.io.vs1Idx, i)
    step(1)
    for (j <- 0 until 32) {
      s(32*i + j) = peek(c.io.vscr1(j)).toInt
    }
  }

  // write const ram
  var w256 = new Array[Int](256)
  for (i <- 0 until 256) {
    if (i == 0) {
      w256(i) = 1
    } else {
      w256(i) = (w256(i-1) * 9) % 12289
    }
  }

  var dataBuf = Array.ofDim[BigInt](256 / ButterflyNum, ButterflyNum)
  var idx = 0
  var div = 32
  for (i <- 0 until 256 / ButterflyNum) {
    for (j <- 0 until ButterflyNum) {
      if (i == 0) {
        dataBuf(i)(0) = w256(0)
        dataBuf(i)(1) = w256(0)
        dataBuf(i)(2) = w256(0)
        dataBuf(i)(3) = w256(256/4)
        dataBuf(i)(4) = w256(0)
        dataBuf(i)(5) = w256(256/8)
        dataBuf(i)(6) = w256(256*2/8)
        dataBuf(i)(7) = w256(256*3/8)
        dataBuf(i)(8) = w256(0)
        dataBuf(i)(9) = w256(256/16)
        dataBuf(i)(10) = w256(256*2/16)
        dataBuf(i)(11) = w256(256*3/16)
        dataBuf(i)(12) = w256(256*4/16)
        dataBuf(i)(13) = w256(256*5/16)
        dataBuf(i)(14) = w256(256*6/16)
        dataBuf(i)(15) = w256(256*7/16)
      } else {
        dataBuf(i)(j) = w256(256 * idx / div)
        idx = idx + 1
      }
    }
    if (idx == (div / 2)) {
      idx = 0
      div = div * 2
    }
  }

  var a:BigInt = 0
  for (i <- 0 until 256 / ButterflyNum) {
    poke(c.io.twiddleAddr, i)
    a = 0
    for (j <- 0 until ButterflyNum) {
      a = a | ((dataBuf(i)(j) & 0xffff) << (16 * j))
    }
    poke(c.io.twiddleData, a)
    poke(c.io.twiddleWrite, true)
    step(1)
  }
  poke(c.io.twiddleWrite, false)
  step(1)

  // raw ntt
  var len = 256
  def ntt(x: Array[Int]): Array[Int] = {
    var res = new Array[Int](len)
    for (i <- 0 until len) {
      res(i) = 0
    }
    for (i <- 0 until len) {
      for (j <- 0 until len) {
        res(i) += (x(j) * w256((i*j) % len)) % 12289
      }
      res(i) = res(i) % 12289
    }
    res
  }
  def range(a: Int, upBound: Int, downBound: Int) : Int = {
    assert(upBound < 32)
    assert(downBound >= 0)
    return (a >> downBound) & (0xffffffff >>> (31-upBound+downBound))
  }
  def reverse(a: Int, len: Int): Int = {
    var res: Int = 0
    for(i <- 0 until len) {
      res = res | range(a, i, i) << (len-1-i)
    }
    res
  }
  var sInOrder = new Array[Int](256)
  for (i <- 0 until 256) {
    sInOrder(reverse(i, log2Ceil(len))) = s(i)
  }
  val rawRes = ntt(sInOrder)

  // iterative ntt (assume bit reverse)
  for (stage <- 0 until log2Ceil(256)) {
    for (block <- 0 until (1 << stage)) {
      for (iter <- 0 until 256 / (2 << stage)) {
        var aIn = s(block + iter * (2 << stage))
        var bIn = s(block + iter * (2 << stage) + (1 << stage))
        var mul = (bIn * w256(256 * block / (2 << stage))) % 12289
        if (aIn < mul) {
          s(block + iter * (2 << stage) + (1 << stage)) = aIn + 12289 - mul
        } else {
          s(block + iter * (2 << stage) + (1 << stage)) = aIn - mul
        }
        s(block + iter * (2 << stage)) = (aIn + mul) % 12289
      }
    }
//    if (stage > 3) {
//      for (i <- 0 until 256) {
//        printf("stage%d: %d: 0x%x\n", stage, i, s(i))
//      }
//    }
  }

  // test butterfly
  for (stage <- 0 until log2Ceil(256)) {
    if(stage < 6) {
      poke(c.io.valid(3), 0)
      poke(c.io.csrs.csrButterflyCtrl.stageCfg, stage)
      poke(c.io.csrs.csrButterflyCtrl.iterCfg, 0)
      // simulate CSRRW
      step(1)
      poke(c.io.valid(3), 1)
      for (iter <- 0 until 256 / (ButterflyNum*4)) {
        poke(c.io.vs1Idx, iter * 2)
        poke(c.io.vs2Idx, iter * 2 + 1)
        step(2)
      }
      poke(c.io.valid(3), 0)
      step(1)
    }
    else {
      for (iter <- 0 until (1 << (stage - 5))) {
        poke(c.io.valid(3), 0)
        poke(c.io.csrs.csrButterflyCtrl.stageCfg, stage)
        poke(c.io.csrs.csrButterflyCtrl.iterCfg, iter)
        // simulate CSRRW
        step(1)
        poke(c.io.valid(3), 1)
        for (k <- 0 until 256 / ((ButterflyNum*4) << (stage - 5))) {
          poke(c.io.vs1Idx, k * (1 << (stage - 4)) + iter)
          poke(c.io.vs2Idx, k * (1 << (stage - 4)) + iter + (1 << (stage - 5)))
          step(2)
        }
        poke(c.io.valid(3), 0)
        step(1)
      }
    }
  }
  poke(c.io.valid(3), 0)
  step(2)

  // peek ntt value
  var nttRes = new Array[Int](256)
  for (i <- 0 until 8) {
    poke(c.io.vs1Idx, i)
    step(1)
    for (j <- 0 until 32) {
      if(j < 16) {
        nttRes(16 * i + j) = peek(c.io.vscr1(j)).toInt
      } else {
        nttRes(256 / 2 + 16 * i + j - 16) = peek(c.io.vscr1(j)).toInt
      }
    }
  }

  // expect
  for (i <- 0 until 256) {
    printf("%d: 0x%x\t%d: 0x%x\t%d: 0x%x\n", i, s(i), i, rawRes(i), i, nttRes(i))
  }
}

object TestTopTestMain extends App {
  iotesters.Driver.execute(Array(), () => new TestTop) {
    c => new TestTopTest(c)
  }
}
