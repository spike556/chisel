package ntt

import chisel3._

class BF2IO extends Bundle()
{
  val a = Input(UInt(14.W))
  val b = Input(UInt(14.W))
  val w = Input(UInt(14.W))
  val A = Output(UInt(14.W))
  val B = Output(UInt(14.W))
}

class BF2 extends Module {
  val io = IO(new BF2IO)

  // pipeline 1
  val bmulw = RegNext(io.b * io.w)
  val aq1 = RegNext(io.a)

  // pipeline 2
  val bmulwMR = RegNext(MR(bmulw))
  val aq2 = RegNext(aq1)

  // reg out
  io.A := RegNext(MRez(aq2, bmulwMR, false.B))
  io.B := RegNext(MRez(aq2, bmulwMR, true.B))
}

object elaborateBF2 extends App {
  chisel3.Driver.execute(args, () => new BF2)
}
