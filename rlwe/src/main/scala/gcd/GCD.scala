
package gcd

import chisel3._

/**
  * Compute GCD using stein algorithm
  */
class GCD extends Module {
  val io = IO(new Bundle {
    val OPA        = Input(UInt(32.W))
    val OPB        = Input(UInt(32.W))
    val START      = Input(Bool())
    val RESULT     = Output(UInt(32.W))
    val DONE       = Output(Bool())
  })

  val OPAReg  = Reg(UInt(32.W))
  val OPBReg  = Reg(UInt(32.W))
  val cnt     = Reg(UInt(5.W))

  val AisZero = !(OPAReg.orR())
  val BisZero = !(OPBReg.orR())

  val AisEven = !OPAReg(0)
  val BisEven = !OPBReg(0)
  val larger = OPAReg > OPBReg

  val subop1 = Mux(larger, OPAReg, OPBReg)
  val subop2 = Mux(larger, OPBReg, OPAReg)

  val subRes = subop1 - subop2
  val subResisZero = !(subRes.orR())

  when(!io.DONE) {
    cnt := cnt + (AisEven && BisEven)
  }

  when(!io.DONE) {
    when(AisEven || BisEven) {
      OPAReg := OPAReg >> AisEven
      OPBReg := OPBReg >> BisEven
    }.otherwise {
      OPAReg := subRes >> 1.U
      OPBReg := subop2
    }
  }

  when(io.START) {
    OPAReg := io.OPA
    OPBReg := io.OPB
    cnt    := 0.U
  }
  val tmp = Mux(AisZero, OPBReg, Mux(BisZero || subResisZero, OPAReg, 0.U))
  io.RESULT := tmp << cnt

  io.DONE := AisZero || BisZero || subResisZero
}

object elaborateGCD extends App {
  chisel3.Driver.execute(args, () => new GCD)
}
