
package RLWE

import chisel3.util._
import scala.math._

// using Barrett reduction
trait HasMRParameters {
  val MRalpha = 15
  val MRbeta = -2
  val MRq = 12289
  val MRu = (2 << (14 + MRalpha)) / MRq
}

trait HasNTTCommonParameters {
  val DataWidth = 14
  // TODO : Test => Modify this
  val VectorLength = 512
  // 9 bits
  val AddrWidth = log2Ceil(VectorLength)
}

trait HasNTTParameters {
  /**
    *  Apply NEWHOPE512 parameters
    *  r = 10968, w = 3, w-1 = 8193, r-1 = 3656, n-1 = 12265
    *  w is root of unity, 3 ^ 512 = 1, 3 ^ 256 = 12289 - 1, 3 ^ 128 = 1479
    **/

//  val WNTest = new Array[Int](3)
//  for (i <- 0 until 3-1) {
//    if (i == 0) {
//      WNTest(i) = 4043
//    } else {
//      WNTest(i) = (pow(WNTest(i-1), 2) % 12289).toInt
//    }
//  }

  val WN = new Array[Int](9)
  for (i <- 0 until 9 - 1) {
    if (i == 0) {
      WN(i) = 3
    } else {
      WN(i) = (pow(WN(i-1), 2) % 12289).toInt
    }
  }
}