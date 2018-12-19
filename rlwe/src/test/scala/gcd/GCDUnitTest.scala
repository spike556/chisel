// See README.md for license details.

package gcd

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class GCDUnitTester(c: GCD) extends PeekPokeTester(c) {
  /**
    * compute the gcd and the number of steps it should take to do it
    *
    * @param a positive integer
    * @param b positive integer
    * @return the GCD of a and b
    */
  def computeGcd(a: Int, b: Int): (Int, Int) = {
    var x = a
    var y = b
    var depth = 1
    var k = 0
    var res = 0
    while((y != 0) && (x != 0) && (x != y)) {
      if (((x % 2) == 0) || ((y % 2) == 0)) {
        if (((x % 2) == 0) && ((y % 2) == 0)) {
          k += 1
        }
        if ((x % 2) == 0) {
          x = x / 2
        }
        if ((y % 2) == 0) {
          y = y / 2
        }
      }
      else {
        if (x > y) {
          x = (x-y) / 2
        }
        else {
          var tmp = x
          x = (y-x) / 2
          y = tmp
        }
      }
      depth += 1
    }
    if (x != 0) {
      res = x << k
    } else {
      res = y << k
    }
    (res, depth)
  }

  private val gcd = c

  for(i <- 1 to ((1 << 31) -1) by ((1 << 24) -1)) {
    for (j <- 1 to ((1 << 31) -1) by ((1 << 25) -7)) {
      poke(gcd.io.OPA, i)
      poke(gcd.io.OPB, j)
      poke(gcd.io.START, 1)
      step(1)
      poke(gcd.io.START, 0)

      val (expected_gcd, steps) = computeGcd(i, j)

      step(steps - 1) // -1 is because we step(1) already to toggle the enable
      expect(gcd.io.RESULT, expected_gcd)
      expect(gcd.io.DONE, 1)
    }
  }
}

/**
  * This is a trivial example of how to run this Specification
  * From within sbt use:
  * {{{
  * testOnly example.test.GCDTester
  * }}}
  * From a terminal shell use:
  * {{{
  * sbt 'testOnly example.test.GCDTester'
  * }}}
  */
class GCDTester extends ChiselFlatSpec {
  // Disable this until we fix isCommandAvailable to swallow stderr along with stdout
  private val backendNames = if(false && firrtl.FileUtils.isCommandAvailable(Seq("verilator", "--version"))) {
    Array("firrtl", "verilator")
  }
  else {
    Array("firrtl")
  }
  for ( backendName <- backendNames ) {
    "GCD" should s"calculate proper greatest common denominator (with $backendName)" in {
      Driver(() => new GCD, backendName) {
        c => new GCDUnitTester(c)
      } should be (true)
    }
  }

  "Basic test using Driver.execute" should "be used as an alternative way to run specification" in {
    iotesters.Driver.execute(Array(), () => new GCD) {
      c => new GCDUnitTester(c)
    } should be (true)
  }

  "using --backend-name verilator" should "be an alternative way to run using verilator" in {
    if(backendNames.contains("verilator")) {
      iotesters.Driver.execute(Array("--backend-name", "verilator"), () => new GCD) {
        c => new GCDUnitTester(c)
      } should be(true)
    }
  }

  "running with --is-verbose" should "show more about what's going on in your tester" in {
    iotesters.Driver.execute(Array("--is-verbose"), () => new GCD) {
      c => new GCDUnitTester(c)
    } should be(true)
  }

  "running with --fint-write-vcd" should "create a vcd file from your test" in {
    iotesters.Driver.execute(Array("--fint-write-vcd"), () => new GCD) {
      c => new GCDUnitTester(c)
    } should be(true)
  }
}
