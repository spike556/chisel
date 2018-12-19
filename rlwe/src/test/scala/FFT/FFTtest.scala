
package FFT

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class Complex(val re: Double, val im: Double) {
  def +(rhs: Complex) = new Complex(re + rhs.re, im + rhs.im)
  def -(rhs: Complex) = new Complex(re - rhs.re, im - rhs.im)
  def *(rhs: Complex) = new Complex(re * rhs.re - im * rhs.im, rhs.re * im + re * rhs.im)
  //def r = re

  def magnitude = Math.hypot(re, im)
  def phase = Math.atan2(im, re)

  override def toString = s"Complex($re, $im)"
}

class FFTtest(c:R2MDC) extends PeekPokeTester(c) {
  def fft(x: Array[Complex]): Array[Complex] = {
    require(x.length > 0 && (x.length & (x.length - 1)) == 0, "array size should be power of two")
    fft(x, 0, x.length, 1)
  }

  def fft(x: Array[Double]): Array[Complex] = fft(x.map(re => new Complex(re, 0.0)))
  def rfft(x: Array[Double]): Array[Complex] = fft(x).take(x.length / 2 + 1)

  private def fft(x: Array[Complex], start: Int, n: Int, stride: Int) : Array[Complex] = {
    if (n == 1)
      return Array(x(start))

    val X = fft(x, start, n / 2, 2 * stride) ++ fft(x, start + stride, n / 2, 2 * stride)

    for (k <- 0 until n / 2) {
      val t = X(k)
      val arg = -2 * math.Pi * k / n
      val c = new Complex(math.cos(arg), math.sin(arg)) * X(k + n / 2)
      X(k) = t + c
      X(k + n / 2) = t - c
    }
    X
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

  var l = 6
  val r = new scala.util.Random
  var bound: Double = math.pow(2.0, l)
  var error: Double = 0
  var ovNum: Int = 0
  var iterNum: Int = 5000

  for (t <- 0 until iterNum) {
    var a = new Array[Complex](64)
    var cnt = 0
    for (i <- 0 until 64) {
      var re = -bound.toInt / 2 + r.nextInt(bound.toInt)
      var im = -bound.toInt / 2 + r.nextInt(bound.toInt)
      a(cnt) = new Complex(2 * re / bound, 2 * im / bound)
      poke(c.io.dIn.re, re)
      poke(c.io.dIn.im, im)
      poke(c.io.din_valid, 1)
      step(1)
      cnt += 1
    }
    var ref = fft(a)

    var errorOne: Double = 0
    var eps: Double = 1e-5
    for (i <- 0 until 32) {
//      print(ref(reverse(i * 2, 6)))
//      var d1 = peek(c.io.dOut1)
//      print(" real:" + (2 * d1("re").toDouble / bound) + " im:" + (2 * d1("im").toDouble / bound) + "\n")
//      print(ref(reverse(i * 2 + 1, 6)))
//      var d2 = peek(c.io.dOut2)
//      print(" real:" + (2 * d2("re").toDouble / bound) + " im:" + (2 * d2("im").toDouble / bound) + "\n")
      var ref1 = ref(reverse(i * 2, 6))
      var d1 = peek(c.io.dOut1)
      errorOne += math.abs((((2 * d1("re").toDouble / bound) - ref1.re) / (ref1.re + eps) + ((2 * d1("im").toDouble / bound) - ref1.im) / (ref1.im + eps)) / 2.0)
      var ref2 = ref(reverse(i * 2 + 1, 6))
      var d2 = peek(c.io.dOut2)
      errorOne += math.abs((((2 * d2("re").toDouble / bound) - ref2.re) / (ref2.re + eps) + ((2 * d2("im").toDouble / bound) - ref2.im) / (ref2.im + eps)) / 2.0)
      step(1)
    }
    errorOne /= 64
    if (errorOne > 0.5) {
      ovNum +=1
    } else {
      error += errorOne
    }
    var errorOnePercent = errorOne*100
    printf("%.2f%%\n", errorOnePercent)
  }
  error /= iterNum
  print("Total error rate is: " + error*100 + "%\n")
  print(ovNum + " of " + iterNum + " overflowed! " + "The overlow ratio is " + 100 * ovNum / iterNum.toDouble  + "%" + "\n")
}

object FFTTestMain extends App {
  iotesters.Driver.execute(args, () => new R2MDC(64)) {
    c => new FFTtest(c)
  }
}
