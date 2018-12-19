
package mm

import chisel3._

//object param {
//  val u32 = BigInt("64800000000", 16)
//}

class FMul (digitLen: Int) extends Module {
  val io = IO(new Bundle() {
    val a = Input(UInt(163.W))
    val b = Input(UInt(digitLen.W))
    val pout = Output(UInt((162+digitLen).W))
  })

  val tmp = VecInit (Seq.fill(digitLen+1) (WireInit(0.U((162+digitLen).W))))
  for (i <- 0 until digitLen) {
    when (io.b(i) === 1.U) {
      tmp(i+1) := tmp(i) ^ (io.a << i.U)
    } .otherwise {
      tmp(i+1) := tmp(i)
    }
  }
  io.pout := tmp(digitLen)
}

object FMul {
  def apply (d: Int) (a: UInt, b: UInt) : UInt = {
    val i = Module(new FMul(d))
    i.io.a := a
    i.io.b := b
    i.io.pout
  }
}

class PEAlter (digitLen: Int) extends Module {
  val io = IO(new Bundle() {
    val a = Input(UInt(163.W))
    val p = Input(UInt(163.W))
    val bi = Input(UInt(digitLen.W))
    val aout = Output(UInt(163.W))
    val pout = Output(UInt(163.W))
  })
  val ptmp1 = (io.p << digitLen.U) ^ FMul(digitLen)(io.a, io.bi)
  val pGuess = ptmp1 >> 163.U
  val ptmp4 = ptmp1(162,0) ^ ((pGuess << 7.U) ^ (pGuess << 6.U) ^ (pGuess << 3.U) ^ pGuess)
  //val ptmp4 = ptmp1 ^ FMul(164)(pGuess, "h800000000000000000000000000000000000000c9".U)

  io.aout := RegNext(io.a)
  io.pout := RegNext(ptmp4)
}

object elaboratePEAlter extends App {
  chisel3.Driver.execute(args, () => new PEAlter(32))
}
