
package gcd

//class Mul {
//  def mulfix(a : Int, apos : Int, b : Int, bpos : Int) : Float = {
//    var c : Float = a * b
//    var cpos : Float = 1 << (apos + bpos)
//    return c / cpos
//  }
//
//  def mulFP16(a : Int, b : Int) : Int = {
//    var aSign = (a >> 15) & 1
//    var aExp = (a >> 10) & 0x1f
//    var aManti = a & 0x3ff
//    var bSign = (b >> 15) & 1
//    var bExp = (b >> 10) & 0x1f
//    var bManti = b & 0x3ff
//
//    var cSign = aSign ^ bSign
//    var cExp = aExp + bExp - 15
//    var cManti : Int = 0
//    var ctmp : Int = ((1 << 10) + aManti) * ((1 << 10) + bManti)
//    if (ctmp >= (1 << 21)) {
//      cManti = (ctmp >> 11) & 0x3ff
//      cExp += 1
//    } else {
//      cManti = (ctmp >> 10) & 0x3ff
//    }
//    return ((cSign << 15) | (cExp << 10) | cManti) & 0xffff
//   }
//}

class CMAC {

  /**
  *  common helper function
  *     TESTED ? YES
  **/

  def range(a: BigInt, upBound: Int, downBound: Int) : BigInt = {
    return (a >> downBound) & BigInt('1'.toString * (upBound-downBound+1), 2)
  }

  def range(a: Int, upBound: Int, downBound: Int) : Int = {
    assert(upBound < 32)
    assert(downBound >= 0)
    return (a >> downBound) & (0xffffffff >>> (31-upBound+downBound))
  }

  def toFP32(x : (BigInt,BigInt)) : Int = {
      // FP32 generate
    var exp = x._1
    var manti = x._2
    var resSign = 0
    var resExp = exp.toInt + 127 - 30
    var resManti = manti
    if (manti.signum == -1) {
      resSign = 1
    }
    if (manti.bitLength >= 24) {
      resManti = manti >> (manti.bitLength - 24)
      resExp += (manti.bitLength -21)
    } else {
      resManti = manti << (24 - manti.bitLength)
      resExp += (manti.bitLength -21)
    }

    var res = (resSign << 31) | (resExp << 23) | range(resManti.toInt, 22, 0)
    return res
  }

  def fp32Value(a : Int) : Float = {
    var exp = range(a, 30, 23)
    var manti = range(a, 22, 0)
    var absValue : Float = (manti.toFloat / scala.math.pow(2.0F, 23).toFloat + 1.0F) * scala.math.pow(2.0F, exp-127).toFloat
    if (range(a,31,31) == 0) {
      return absValue
    } else {
      return -absValue
    }
  }

  /**
    *
    *  NaN function
    *  @param dat    1024bit
    *  @param datNaN 64bit
    *  @param wt     1024bit
    *  @param wtNaN  64bit
    *  Tested ? YES
    **/

  def naNHW(dat: BigInt, datNaN: BigInt, wt: BigInt, wtNaN: BigInt) : (BigInt, BigInt)= {
    var datUnified = (dat << 1024) | wt
    var naNUnified = (datNaN << 64) | wtNaN
    var naNPos = 0
    var isNaN : BigInt = 0
    if (naNUnified != BigInt(0)) {
      for (i <- 127 to 0 by -1){
        if (range(naNUnified, i, i) == BigInt(1)) {
          naNPos = i
          isNaN = 1
        }
      }
    }
    var mantissa = (range(datUnified, naNPos*16+9, naNPos*16)) | (range(datUnified, naNPos*16+15, naNPos*16+15) << 10)
    return (mantissa, isNaN)
  }

  def naNSW(dat: BigInt, wt: BigInt) : (BigInt, BigInt)= {
    var datNaN = BigInt(0)
    var wtNaN = BigInt(0)
    for (i <- 0 until 64) {
      var fp16 = range(dat, 16*i+15, 16*i)
      var wt16 = range(wt, 16*i+15, 16*i)
      var fpisNaN = BigInt(0)
      var wtisNaN = BigInt(0)
      if ((range(fp16, 14, 10) == BigInt(0x1f)) && (range(fp16, 9, 0) != BigInt(0))) {
        fpisNaN = BigInt(1)
      }
      if ((range(wt16, 14, 10) == BigInt(0x1f)) && (range(wt16, 9, 0) != BigInt(0))) {
        wtisNaN = BigInt(1)
      }
      datNaN = datNaN | (fpisNaN << i)
      wtNaN = wtNaN | (wtisNaN << i)
    }
    naNHW(dat, datNaN, wt, wtNaN)
  }

  /**
    *
    *  exp
    *  @param darExp  192bit
    *  @param wtExp   192bit
    *  @param mask    64bit
    *  @param expMax  4bit
    *  @param expShift 4X64bit
    *  TESTED ? YES
    */

  def expHW(datExp: BigInt, wtExp: BigInt, mask: BigInt): (BigInt, BigInt) = {
    var expSum = BigInt(0)
    for (i <- 0 until 64) {
      if (range(mask, i, i) == BigInt(1)) {
        expSum |= (range(datExp, i * 3 + 2, i * 3) + range(wtExp, i * 3 + 2, i * 3)) << (4 * i)
      }
    }
    var expMax = BigInt(0)
    for (i <- 0 until 64) {
      if (range(expSum, i*4+3, i*4) > expMax) {
        expMax = range(expSum, i*4+3, i*4)
      }
    }
    var expShift = BigInt(0)
    for (i <- 0 until 64) {
      expShift |= (expMax - range(expSum, i*4+3, i*4)) << (4*i)
    }
    return (expMax, expShift)
  }

  /**
    *  @param darExp  320bit
    *  @param wtExp   320bit
    *  @param mask    64bit
    *  @param expMax  6bit
    *  @param expShift 6X64bit
    *                  TESTED ? YES
    */
  def expSW(datExp: BigInt, wtExp: BigInt, mask: BigInt): (BigInt, BigInt) = {
    var expSum = BigInt(0)
    for (i <- 0 until 64) {
      if (range(mask, i, i) == BigInt(1)) {
        expSum |= (range(datExp, i * 5 + 4, i * 5) + range(wtExp, i * 5 + 4, i * 5)) << (6 * i)
      }
    }
    var expMax = BigInt(0)
    for (i <- 0 until 64) {
      if (range(expSum, i*6+5, i*6) > expMax) {
        expMax = range(expSum, i*6+5, i*6)
      }
    }
    var expShift = BigInt(0)
    for (i <- 0 until 64) {
      expShift |= (expMax - range(expSum, i*6+5, i*6)) << (6*i)
    }
    return (expMax, expShift)
  }

  /**
    *
    *  mul
    *  @param a       16bit
    *  @param b       16bit
    *  @param shift   6bit
    *  TESTED ? YES
    *
  **/
  def mulHW(a: BigInt, b: BigInt, shift: BigInt): BigInt = {
    var aSign = range(a, 15, 15)
    var aManti = BigInt(0)
    if (range(a, 14,10) == BigInt(0)) {
      // complement subnormal number
      aManti = range(a, 9,0) << 1
    } else {
      aManti = range(a, 9, 0) | (BigInt(1) << 10)
    }
    aManti = aManti << range(a, 11, 10).toInt

    var bSign = range(b, 15, 15)
    var bManti = BigInt(0)
    if (range(b, 14,10) == BigInt(0)) {
      // complement subnormal number
      bManti = range(b, 9,0) << 1
    } else {
      bManti = range(b, 9, 0) | (BigInt(1) << 10)
    }
    bManti = bManti << range(b, 11, 10).toInt

    var res = (aManti * bManti) >> shift.toInt
    var resSign = if ((aSign ^ bSign).toInt == 1) -1 else 1
    return resSign * res
  }

  def mulSW(a: BigInt, b: BigInt, shift: BigInt): BigInt = {
    var aSign = range(a, 15, 15)
    var aManti = BigInt(0)
    if (range(a, 14,10) == BigInt(0)) {
      // complement subnormal number
      aManti = range(a, 9,0) << 1
    } else {
      aManti = range(a, 9, 0) | (BigInt(1) << 10)
    }
    var bSign = range(b, 15, 15)
    var bManti = BigInt(0)
    if (range(b, 14,10) == BigInt(0)) {
      // complement subnormal number
      bManti = range(b, 9,0) << 1
    } else {
      bManti = range(b, 9, 0) | (BigInt(1) << 10)
    }

    var res = (aManti * bManti) >> shift.intValue
    var resSign = if ((aSign ^ bSign).toInt == 1) -1 else 1
    return resSign * res
  }

  /**
    *
    *  MAC
    *  @param dat       1024bit
    *  @param wt        1024bit
    *  @param mask      64bit
    *  @param expMax    6bit
    *  @param mulSUmRes 32+6=38bit
    *  TESTED ? YES
  **/
  def MAC(dat: BigInt, wt: BigInt, mask: BigInt = BigInt("ffffffffffffffff", 16)): (BigInt, BigInt) = {
    // NaN
    var nanRes = naNSW(dat, wt)
    assert(nanRes._2 == BigInt(0))

    // exp
    var datExp = BigInt(0)
    var wtExp = BigInt(0)
    for (i <- 0 until 64) {
      datExp |= range(dat, 16*i+14, 16*i+12) << (3*i)
      wtExp |= range(wt, 16*i+14, 16*i+12) << (3*i)
    }
    var expRes = expHW(datExp, wtExp, mask)
    var expMax = expRes._1
    var expShift = expRes._2

    // 64 mul
    var mulSumRes = BigInt(0)
    for (i <- 0 until 64) {
      mulSumRes += mulHW(range(dat, 16*i+15, 16*i),
                        range(wt, 16*i+15, 16*i),
                        range(expShift, 4*i+3, 4*i) << 2)

    }
    return (expMax << 2, mulSumRes)
  }

  def MACFP32(dat: BigInt, wt: BigInt, mask: BigInt = BigInt("ffffffffffffffff", 16)): Float = {
    return fp32Value(toFP32(MAC(dat, wt, mask)))
  }

  /**
    *
    *  CACC
    *
    *  @param x 44bit X length   (expmax:mulRes)
    *  @param t 44bit X length   (expmax:mulRes)
    *  @param out 32bit X length (fp32 IEEE754)
    *  length <= 16
    *  TESTED ? YES
    *
  **/
  def CACCFP32(x : Array[(BigInt,BigInt)], y : Array[(BigInt,BigInt)]) : Array[Int] = {
    var res = new Array[Int](16)
    for (i <- 0 until 16) {
      var a = x(i)
      var aExp = a._1
      var aManti = a._2
      var b = y(i)
      var bExp = b._1
      var bManti = b._2
      // select expMax, then shift
      var expMax = aExp
      if (aExp < bExp) {expMax = bExp}
      aManti = aManti >> (expMax.toInt - aExp.toInt)
      bManti = bManti >> (expMax.toInt - bExp.toInt)
      var manti = aManti + bManti

      // FP32 generate
      var resSign = 0
      var resExp = expMax.toInt + 127 - 30
      var resManti = manti
      if (manti.signum == -1) {
        resSign = 1
      }
      if (manti.bitLength >= 24) {
        resManti = manti >> (manti.bitLength - 24)
        resExp += (manti.bitLength -21)
      } else {
        resManti = manti << (24 - manti.bitLength)
        resExp += (manti.bitLength -21)
      }

      res(i) = (resSign << 31) | (resExp << 23) | range(resManti.toInt, 22, 0)
    }
    return res
  }

  def CACCFP44(x : Array[(BigInt,BigInt)], y : Array[(BigInt,BigInt)]) : Array[(BigInt, BigInt)] = {
    var res = new Array[(BigInt, BigInt)](16)
    for (i <- 0 until 16) {
      var a = x(i)
      var aExp = a._1
      var aManti = a._2
      var b = y(i)
      var bExp = b._1
      var bManti = b._2
      // select expMax, then shift
      var expMax = aExp
      if (aExp < bExp) {expMax = bExp}
      aManti = aManti >> (expMax.toInt - aExp.toInt)
      bManti = bManti >> (expMax.toInt - bExp.toInt)
      var manti = aManti + bManti

      res(i) = (expMax, manti)
    }
    return res
  }


  /**
    *
    *  CMACBasic
    *  @param dat   1024bit
    *  @param wt    1024 x 16 bit
    *  @param out   44 X 16 bit
    *               TESTED ? YES
  **/
  def CMACBasicOp(dat : BigInt, wt : Array[BigInt]) : Array[(BigInt, BigInt)] = {
    var res = new Array[(BigInt, BigInt)](16)
    for (i <- 0 until 16) {
      res(i) = MAC(dat, wt(i))
    }
    return res
  }

  /**
    *
    *  CMACStripe
    *  description : assume no zero padding
    *
    *  @param W   width of dat  (Int)
    *  @param H   height of dat (Int)
    *  @param R   width of wt  (Int)
    *  @param S   height of wt (Int)
    *  @param strideX
    *  @param strideY
    *  @param startPos (y, x)
    *  @param dat 1024bit  (H X W)
    *  @param wt  1024bit  (16)
    *  @param out 44bit    (H' X W' X 16)
    **/
  def CMACStripeOp(w : Int = 6, h : Int = 6, r : Int = 3, s : Int = 3, strideX : Int = 1, strideY : Int = 1, startPos : (Int, Int),
                   dat : Array[Array[BigInt]], wt : Array[BigInt]) : Array[Array[Array[(BigInt, BigInt)]]] = {
    var outW = (w - r) / strideX + 1
    var outH = (h - s) / strideY + 1
    assert((w-r) % strideX == 0)
    assert((h-s) % strideY == 0)

    var res = Array.ofDim[(BigInt, BigInt)](outH, outW, 16)
    for (posY <- startPos._1 until (outH-1) * strideY + startPos._1 by strideY) {
      for (posX <- startPos._2 until (outW-1) * strideX + startPos._2 by strideX) {
        res(posY)(posX) = CMACBasicOp(dat(posY)(posX), wt)
      }
    }
    return res
  }

  /**
    *
    *  CMACBlock
    *  @param W   width of dat  (Int)
    *  @param H   height of dat (Int)
    *  @param R   width of wt   (Int)
    *  @param S   height of wt  (Int)
    *  @param strideX
    *  @param strideY
    *  @param dat 1024bit X H X W
    *  @param wt  1024bit X  S X R X 16
    *  @param out 44  X H' X W' X 16
    *             TESTED ? NO!
    *
  **/
  def CMACBlockOp(w : Int = 6, h : Int = 6, r : Int = 3, s : Int = 3, strideX : Int = 1, strideY : Int = 1,
                  dat : Array[Array[BigInt]], wt : Array[Array[Array[BigInt]]]) : Array[Array[Array[(BigInt, BigInt)]]] = {
    var outW = (w - r) / strideX + 1
    var outH = (h - s) / strideY + 1
    assert((w-r) % strideX == 0)
    assert((h-s) % strideY == 0)

    var res = Array.ofDim[(BigInt, BigInt)](outH, outW, 16)
    for (i <- 0 until s ) {
      for (j <- 0 until r) {
        if ((i == 0) && (j == 0)) {
          res = CMACStripeOp(w, h, r, s, strideX, strideY, (0,0), dat, wt(i)(j))
        } else {
          /**  Accumulate sum **/
          var tmpRes = CMACStripeOp(w, h, r, s, strideX, strideY, (i,j), dat, wt(i)(j))
          for (ii <- 0 until outH) {
            for (jj <- 0 until outW) {
              res(ii)(jj) = CACCFP44(res(ii)(jj), tmpRes(ii)(jj))
            }
          }
        }
      }
    }
    return res
  }

  /**
    *
    *  CMAC Channel
    *  @param W   width of dat  (Int)
    *  @param H   height of dat (Int)
    *  @param R   width of wt   (Int)
    *  @param S   height of wt  (Int)
    *  @param strideX
    *  @param strideY
    *  @param channelNum
    *  @param dat (1024bit) channelNum X H X W
    *  @param wt  (1024bit) channelNum X S X R X 16
    *  @param out 32 X H' X W' X 16
    *             TESTED ? NO!
    *
    **/
  def CMACChannelOp(w : Int = 6, h : Int = 6, r : Int = 3, s : Int = 3, strideX : Int = 1, strideY : Int = 1, channelNum : Int = 2,
                  dat : Array[Array[Array[BigInt]]], wt : Array[Array[Array[Array[BigInt]]]]) : Array[Array[Array[Float]]] = {
    var outW = (w - r) / strideX + 1
    var outH = (h - s) / strideY + 1
    assert((w-r) % strideX == 0)
    assert((h-s) % strideY == 0)

    var res = Array.ofDim[(BigInt, BigInt)](outH, outW, 16)
    var resfp32 = Array.ofDim[Int](outH, outW, 16)
    var resfp32Val = Array.ofDim[Float](outH, outW, 16)

    for (c <- 0 until channelNum) {
      if (c == 0) {
        res = CMACBlockOp(w, h, r, s, strideX, strideY, dat(0), wt(0))
      } else {
        /**  Accumulate sum **/
        var tmpRes = CMACBlockOp(w, h, r, s, strideX, strideY, dat(c), wt(c))
        for (ii <- 0 until outH) {
          for (jj <- 0 until outW) {
            if (c != channelNum-1) {
              res(ii)(jj) = CACCFP44(res(ii)(jj), tmpRes(ii)(jj))
            } else {
              resfp32(ii)(jj) = CACCFP32(res(ii)(jj), tmpRes(ii)(jj))
              for (kk <- 0 until 16) {
                resfp32Val(ii)(jj)(kk) = fp32Value(resfp32(ii)(jj)(kk))
              }
            }
          }
        }
      }
    }
    return resfp32Val
  }
}
