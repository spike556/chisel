// using Barrett reduction
// n = 512, q = 12289

package ntt

import chisel3._

object MRParams {
  val alpha = 15
  val beta = -2
  val q = 12289
  val u = (2 << (14 + alpha)) / q
}


class MRIO extends Bundle()
{
  val a = Input(UInt(28.W))
  val ar = Output(UInt(14.W))
}

class MR extends Module{
  val io = IO(new MRIO)

  // TODO: consider pipeline when necessary
  val shift1 = io.a >> 12.U
  val mul1 = shift1 + (shift1 << 1.U) + (shift1 << 2.U) + (shift1 << 5.U) + (shift1 << 7.U) +
    (shift1 << 9.U) + (shift1 << 11.U) + (shift1 << 13.U) + (shift1 << 15.U)
  val qGuess = mul1 >> 17.U
  val qM = qGuess + (qGuess << 12.U) + (qGuess << 13.U)
  val z = io.a - qM
  io.ar := Mux(z < MRParams.q.asUInt(), z, z-MRParams.q.asUInt())
}

// object  using apply method
object MR {
  def apply(a: UInt) = {
    val inst = Module(new MR)
    inst.io.a := a
    inst.io.ar
  }
}

/*
module MRez for +/-
 */

class MRezIO extends Bundle()
{
  val a = Input(UInt(14.W))
  val b = Input(UInt(14.W))
  val op = Input(Bool())
  val res = Output(UInt(14.W))
}

class MRez extends Module {
  val io = IO(new MRezIO)

  val b = Mux(io.op, ~io.b, io.b)
  val addRes = io.a + b + io.op
  when(io.op) {
    io.res := Mux(io.a < io.b, addRes + 12289.U, addRes)
  } .otherwise {
    io.res := Mux(addRes < 12289.U, addRes, addRes - 12289.U)
  }
}

object MRez{
  def apply(a:UInt, b:UInt, op:Bool) = {
    val inst = Module(new MRez)
    inst.io.a := a
    inst.io.b := b
    inst.io.op := op
    inst.io.res
  }
}

object elaborateMR extends App {
  chisel3.Driver.execute(args, () => new MR)
  chisel3.Driver.execute(args, () => new MRez)
}
