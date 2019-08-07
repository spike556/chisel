
package RLWE

import chisel3._
import chisel3.util._

class TestTopIO extends Bundle
  with HasCommonParameters
  with HasNTTParameters
  with HasPQCInstructions {
  // for SHA3, from outside
  val seed = Input(new stateArray())
  val seedWrite = Input(Bool())
  // for ConstRam, from outside
  val twiddleData = Input(UInt((DataWidth * ButterflyNum).W))
  val twiddleAddr = Input(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val twiddleWrite = Input(Bool())

  // pipeline
  val vs1Idx = Input(UInt(5.W))
  val vs2Idx = Input(UInt(5.W))
  val vdIdx = Input(UInt(5.W))
  val valid = Input(Vec(INSTR_QUANTITY, Bool()))
  val csrs = Input(new CSRIO)
  val busy = Output(Bool())
  val vscr1 = Output(Vec(ML, UInt(DataWidth.W)))
  val vscr2 = Output(Vec(ML, UInt(DataWidth.W)))
}

class TestTop extends Module
  with HasPQCInstructions {
  val io = IO(new TestTopIO)

  // vector SRAM
  val vecSRAM = Module(new VectorRegister)
  vecSRAM.io.vectorReadAddr1 := io.vs1Idx
  vecSRAM.io.vectorReadAddr2 := io.vs2Idx

  val vecop1 = vecSRAM.io.vectorReadValue1
  val vecop2 = vecSRAM.io.vectorReadValue2

  val exunit = Module(new PQCExu)

  // from outside
  exunit.io.seed := io.seed
  exunit.io.seedWrite := io.seedWrite
  exunit.io.twiddleData := io.twiddleData
  exunit.io.twiddleAddr := io.twiddleAddr
  exunit.io.twiddleWrite := io.twiddleWrite
  for (i <- 0 until INSTR_QUANTITY) {
    if (i == INSTR_FETCHRN || i == INSTR_BUTTERFLY) {
      // fetch and butterfly
      exunit.io.valid(i) := io.valid(i)
    } else {
      // sample
      exunit.io.valid(i) := RegNext(io.valid(i))
    }
  }
  exunit.io.vrs1 := vecop1
  exunit.io.vrs2 := vecop2
  exunit.io.csrs := io.csrs

  vecSRAM.io.vectorWriteAddr := Mux(!RegNext(io.valid(INSTR_BUTTERFLY)), RegNext(io.vdIdx),
                                Mux(!exunit.io.wpos, io.vs1Idx, RegNext(io.vs2Idx)))
  vecSRAM.io.vectorWriteEnable := exunit.io.done && exunit.io.wb
  vecSRAM.io.vectorWriteData := exunit.io.vres

  io.busy := exunit.io.busy
  io.vscr1 := vecop1
  io.vscr2 := vecop2
}

object elaborateTestTop extends App {
  chisel3.Driver.execute(args, () => new TestTop())
}
