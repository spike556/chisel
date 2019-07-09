
package RLWE

import chisel3._
import chisel3.util._

trait HasKeccakParameters {
  /**
    *
    * SHA3-256 : output length is 256 bits (not byte!)
    *
  **/
  val SHA224Mode = 0
  val SHA256Mode = 1
  val SHA384Mode = 2
  val SHA512Mode = 3
  val SHAKE128Mode = 4
  val SHAKE256Mode = 5

  val DataOutLength = 512
  val ArrayLength = 1600
  val MaxXOFLength = 1024
  val RoundsNum = 24

  def mod(a: Int, q: Int): Int = {
    var res = 0
    if (a >= 0) {
      res = a % q
    } else {
      res = a + q
    }
    res
  }
  def range(a: Int, upBound: Int, downBound: Int) : Int = {
    assert(upBound < 32)
    assert(downBound >= 0)
    return (a >> downBound) & (0xffffffff >>> (31-upBound+downBound))
  }

  val proc2param = Array( Array(0, 1, 190, 28, 91),
                          Array(36, 300, 6, 55, 276),
                          Array(3, 10, 171, 153, 231),
                          Array(105, 45, 15, 21, 136),
                          Array(210, 66, 253, 120, 78)
                        )
  def rc(t: Int): Int = {
    var res = 0
    var R: Int = 1
    var R8: Int = 0
    if (t % 255 == 0) {
      res = 1
    }
    else {
      for (i <- 1 to t % 255) {
        R = R << 1
        R8 = range(R, 8, 8)
        R = R ^ (R8 | (R8 << 4) | (R8 << 5) | (R8 << 6))
        R = R & 0xff
      }
      res = R & 1
    }
    res
  }
}
