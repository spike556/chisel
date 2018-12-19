
package mm

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class MMTest(c:MM) extends PeekPokeTester(c){

  def range(a: BigInt, upBound: Int, downBound: Int) : BigInt = {
    return (a >> downBound) & BigInt('1'.toString * (upBound-downBound+1), 2)
  }

  def computeU(a : BigInt, b : BigInt) : BigInt = {
    var alen = a.bitLength
    var blen = b.bitLength
    var res = a
    for (i <- (alen - blen) to 0 by -1) {
      if (range(res, blen + i - 1, blen + i - 1) == BigInt(1)) {
        res ^= (b << i)
      }
    }
    res
  }

  def mmSW(a : BigInt, b : BigInt) : BigInt = {
    // using LSB algorithm
    var atmp : BigInt = a
    var res : BigInt = BigInt(0)

    for (i <- 0 until 163) {
      if (range(b, i, i) == 1) {
        res ^= atmp
      }
      if (range(atmp, 162, 162) == 1) {
        atmp = (range(atmp, 161, 0) << 1) ^ BigInt("c9", 16)
      } else {
        atmp = range(atmp, 161, 0) << 1
      }
    }
    res
  }

  def mmSWB(a : BigInt, b : BigInt) : BigInt = {
    var res : BigInt = BigInt(0)

    for (i <- 5 to 0 by -1) {
      res = res << 32
      if (i == 5) {
        var tmp : BigInt = BigInt(0)
        for (j <- 0 until 3) {
          if (range(b, 32*i+j, 32*i+j) == BigInt(1)) {
            tmp = tmp ^ (a << j)
          }
        }
        res = res ^ tmp

//        print(res)
//        print("\n")

        var q = res >> 163

//        print ((q << 163) ^ (q << 7) ^ (q << 6) ^ (q << 3) ^ q)
//        print("\n")

        res = res ^ ((q << 163) ^ (q << 7) ^ (q << 6) ^ (q << 3) ^ q)
      } else {
        var tmp : BigInt = BigInt(0)
        for (j <- 0 until 32) {
          if (range(b, 32*i+j, 32*i+j) == BigInt(1)) {
            tmp = tmp ^ (a << j)
          }
        }
        res = res ^ tmp
        var q = res >> 163
        res = res ^ ((q << 163) ^ (q << 7) ^ (q << 6) ^ (q << 3) ^ q)
      }
    }
    res
  }

  var latency = 0
  var expected = new Array[BigInt](6)
  for (i:BigInt <- BigInt("723456789009876543210123456789abcdef12345", 16) until BigInt("723456789009876543210123456789abcdef13456", 16) by BigInt(256)) {
    for (j:BigInt <- BigInt("723456789009876543210123456789abcdef12345", 16) until BigInt("723456789009876543210123456789abcdef13456", 16) by BigInt(256)) {
      poke(c.io.a, i)
      poke(c.io.bi, j)

      for (k <- 5 until 0 by -1) {
        expected(k) = expected(k-1)
      }
      expected(0) = mmSW(i, j)
      if (latency > 4) {
        expect(c.io.pout, expected(5))
      }
      latency += 1
      step(1)
    }
  }

}

object MMTestMain extends App {
  iotesters.Driver.execute(args, () => new MM(32, true, false)) {
    c => new MMTest(c)
  }
}