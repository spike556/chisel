
package mm

import chisel3._
import chisel3.util._
import utility.ShiftRegs

class MM(digitLen: Int, ispipeline: Boolean=true, barrett: Boolean=false) extends Module{
  val io = IO(new Bundle() {
    val a = Input(UInt(163.W))
    val bi = Input(UInt(163.W))
    val pout = Output(UInt(163.W))
  })

  if (barrett) {
    val PEs = VecInit(Seq.fill(163 / digitLen + 1) (Module(new PEAlter(digitLen)).io))

    for (i <- 0 until 163 / digitLen + 1) {
      if (i == 0) {
        PEs(i).a := io.a
        PEs(i).p := 0.U(163.W)
        PEs(i).bi := Cat(0.U((digitLen-3).W), io.bi(162, 160))
      }
      else {
        PEs(i).a := PEs(i - 1).aout
        PEs(i).p := PEs(i - 1).pout
        PEs(i).bi := ShiftRegs(i, digitLen)(io.bi(159 - digitLen * (i-1), 160 - digitLen * i))
      }
    }

    io.pout := PEs(163 / digitLen).pout
  }
  else {
    val PEs = VecInit(Seq.fill(163 / digitLen - 1)(Module(new PE(digitLen, ispipeline)).io))
    val lastPE = Module(new PE(digitLen + 3, ispipeline))

    for (i <- 0 until 163 / digitLen - 1) {
      if (i == 0) {
        PEs(i).a := io.a
        PEs(i).p := 0.U(163.W)
        PEs(i).bi := io.bi(digitLen - 1, 0)
      }
      else {
        PEs(i).a := PEs(i - 1).aout
        PEs(i).p := PEs(i - 1).pout
        if (ispipeline) {
          PEs(i).bi := ShiftRegs(i, digitLen)(io.bi(digitLen * (i + 1) - 1, digitLen * i))
        } else {
          PEs(i).bi := io.bi(digitLen * (i + 1) - 1, digitLen * i)
        }
      }
    }

    lastPE.io.a := PEs(163 / digitLen - 2).aout
    lastPE.io.p := PEs(163 / digitLen - 2).pout
    if (ispipeline) {
      lastPE.io.bi := ShiftRegs(163 / digitLen - 1, digitLen + 3)(io.bi(162, 160 - digitLen))
    } else {
      lastPE.io.bi := io.bi(162, 160 - digitLen)
    }

    io.pout := lastPE.io.pout
  }
}

object elaborateMM extends App {
  chisel3.Driver.execute(args, () => new MM(8, true, true))
}
