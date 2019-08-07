
package RLWE

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}
import chisel3.util._


//class MRTest(c: MR) extends PeekPokeTester(c) {
//  var a = new scala.util.Random
//  poke(c.io.n, 14)
//  for (i <- 0 until 1000) {
//    var aIn = a.nextInt(1 << 28)
//    poke(c.io.a, aIn)
//    var m = (1 << 13) + a.nextInt(1 << 13)
//    poke(c.io.m, m)
//    poke(c.io.u, scala.math.pow(2, 29).toLong / m)
//    step(1)
//    expect(c.io.ar, aIn % m)
//  }
//}
//
//object MRTestMain extends App {
//  iotesters.Driver.execute(Array(), () => new MR) {
//    c => new MRTest(c)
//  }
//}

class BTest(c: Butterfly) extends PeekPokeTester(c) {
  var s = new scala.util.Random
  poke(c.io.n, 14)

  for (i <- 0 until 1000) {
    var m = (1 << 13) + s.nextInt(1 << 13)
    poke(c.io.m, m)
    poke(c.io.u, scala.math.pow(2, 29).toLong / m)

    var a = s.nextInt(m)
    var b = s.nextInt(m)
    var wn = s.nextInt(m)
    poke(c.io.a, a)
    poke(c.io.b, b)
    poke(c.io.wn, wn)

    step(1)
    var mul = (b * wn) % m
    var expectB = 0
    if (a < mul) {
      expectB = a + m- mul
    } else {
      expectB = a - mul
    }
    expect(c.io.aout, (a + mul) % m)
    expect(c.io.bout, expectB)
  }
}

object BTestMain extends App {
  iotesters.Driver.execute(Array(), () => new Butterfly) {
    c => new BTest(c)
  }
}

class PermTest(c: PermNetIn) extends PeekPokeTester(c)
  with HasNTTParameters {
  var r = scala.util.Random
  for (i <- 0 until 4) {
    for (j <- 0 until 1) {
      for (k <- 0 until ButterflyNum * 2) {
        poke(c.io.in(k), r.nextInt(1 << 16))
      }
      for (k <- 0 until 4) {
        poke(c.io.config(k), 0)
      }
      poke(c.io.config(i), 1)
      print("Config:\t" + peek(c.io.config) + "\n")
      for (k <- 0 until ButterflyNum * 2) {
        print(k + ":\t" + peek(c.io.in(k)) + "->" + peek(c.io.out(k)) + "\n")
      }
    }
  }
}

object PermTestMain extends App {
  iotesters.Driver.execute(Array(), () => new PermNetIn) {
    c => new PermTest(c)
  }
}

//class NTTTest(c:NTTR2MDC) extends PeekPokeTester(c) {
//
//  var len = 512
//  def ntt(x: Array[Int]): Array[Int] = {
//    var wn = new Array[Int](len)
//    for (i <- 0 until len) {
//      if (i == 0){
//        wn(i) = 1
//      } else {
//        wn(i) = (wn(i-1) * 3) % 12289
//      }
//    }
//    var res = new Array[Int](len)
//    for (i <- 0 until len) {
//      res(i) = 0
//    }
//    for (i <- 0 until len) {
//      for (j <- 0 until len) {
//        res(i) += (x(j) * wn((i*j) % len)) % 12289
//      }
//      res(i) = res(i) % 12289
//    }
//    res
//  }
//
//  def range(a: Int, upBound: Int, downBound: Int) : Int = {
//    assert(upBound < 32)
//    assert(downBound >= 0)
//    return (a >> downBound) & (0xffffffff >>> (31-upBound+downBound))
//  }
//
//  def reverse(a: Int, len: Int): Int = {
//    var res: Int = 0
//    for(i <- 0 until len) {
//      res = res | range(a, i, i) << (len-1-i)
//    }
//    res
//  }
//
//  var l = 14
//  val r = new scala.util.Random
//  var bound: Double = math.pow(2.0, l)
//  var iterNum: Int = 100
//
//  for (t <- 0 until iterNum) {
//    var a = new Array[Int](len)
//    for (i <- 0 until len) {
//      a(i) = r.nextInt(bound.toInt)
//      poke(c.io.dIn, a(i) & 0x3fff)
//      poke(c.io.dInValid, 1)
//      step(1)
//    }
//    var ref = ntt(a)
//
//    for (i <- 0 until len / 2) {
//      var ref1 = ref(reverse(i * 2, log2Ceil(len)))
//      expect(c.io.dOut1, ref1)
//
//      var ref2 = ref(reverse(i * 2 + 1, log2Ceil(len)))
//      expect(c.io.dOut2, ref2)
//
//      expect(c.io.dOutValid, 1)
//
//      a(reverse(i * 2, log2Ceil(len))) = peek(c.io.dOut1).toInt
//      a(reverse(i * 2 + 1, log2Ceil(len))) = peek(c.io.dOut2).toInt
//      step(1)
//    }
////    for (i <- 0 until len) {
////      print(ref(i) + "\n")
////    }
////    for (i <- 0 until len) {
////      print(a(i) + "\n")
////    }
//  }
//}
//
//object NTTTestMain extends App {
//  iotesters.Driver.execute(Array(), () => new NTTR2MDC) {
//    c => new NTTTest(c)
//  }
//}