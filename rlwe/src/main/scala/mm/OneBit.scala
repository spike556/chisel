
package mm

import chisel3._
import chisel3.util._

class OneBitIO extends Bundle() {
  val a = Input(UInt(163.W))
  val p = Input(UInt(163.W))
  val bi = Input(Bool())
  val aout = Output(UInt(163.W))
  val pout = Output(UInt(163.W))
}

class OneBit extends Module {
  val io = IO(new OneBitIO())

  val aShift = Cat(io.a(161, 0),0.U)
  io.aout := Mux(io.a(162) === 1.U, aShift ^ Cat(Fill(155,0.U(1.W)), "hc9".U(8.W)), aShift)
  io.pout := Mux(io.bi === 1.U, io.a ^ io.p, io.p)
}

object elaborateOneBit extends App {
  chisel3.Driver.execute(args, () => new OneBit)
}
