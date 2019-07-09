
package nvdla

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class DCacheTest(c:DCache) extends PeekPokeTester(c) {
  // read test
  val r = new scala.util.Random
  val bound = 0xffff
  poke(c.io.masterReq.write, 0)
  for (i <- 0 until 10000) {
    poke(c.io.masterReq.valid, 1)
    poke(c.io.masterReq.data, 0x3f1b00e5)
    poke(c.io.masterReq.addr, r.nextInt(bound.toInt))
    step(1)

  }
}

object DCacheTestMain extends App {
  iotesters.Driver.execute(args, () => new DCache()) {
    c => new DCacheTest(c)
  }
}