package ntt

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class MRTest(c:MR) extends PeekPokeTester(c) {

  poke(c.io.a, 23333)
  expect(c.io.ar, 23333-12289)
  step(1)
  poke(c.io.a, 12289)
  expect(c.io.ar, 0)
  step(1)
  poke(c.io.a, 233333333)
  expect(c.io.ar, 233333333 % 12289)
  step(1)
  poke(c.io.a, 12345678)
  expect(c.io.ar, 12345678 % 12289)
}

object MRTestMain extends App {
  iotesters.Driver.execute(Array(), () => new MR) {
    c => new MRTest(c)
  }
}