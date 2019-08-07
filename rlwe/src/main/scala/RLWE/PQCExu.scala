
package RLWE

import chisel3._
import chisel3.util._

class PQCExuIO extends Bundle
  with HasPQCInstructions
  with HasCommonParameters
  with HasNTTParameters {
  // for SHA3, from outside
  val seed = Input(new stateArray())
  val seedWrite = Input(Bool())
  // for ConstRam, from outside
  val twiddleData = Input(UInt((DataWidth * ButterflyNum).W))
  val twiddleAddr = Input(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val twiddleWrite = Input(Bool())
  val wpos = Output(Bool())

  // pipeline
  val valid = Input(Vec(INSTR_QUANTITY, Bool()))
//  val rs1 = Input(UInt(64.W))
//  val rs2 = Input(UInt(64.W))
  val vrs1 = Input(Vec(ML, UInt(DataWidth.W)))
  val vrs2 = Input(Vec(ML, UInt(DataWidth.W)))
  val csrs = Input(new CSRIO)
  val done = Output(Bool())
  val busy = Output(Bool())
  val wb = Output(Bool())
  val vres = Output(Vec(ML, UInt(DataWidth.W)))
}

class PQCExu extends Module
  with HasPQCInstructions
  with HasCommonParameters {
  val io = IO(new PQCExuIO())

  val vrs1 = io.vrs1
  val vrs2 = io.vrs2

  val SHA3Core = Module(new KeccakWithFifo)
  SHA3Core.io.seed := io.seed
  SHA3Core.io.seedWrite := io.seedWrite
  SHA3Core.io.valid := io.valid(INSTR_FETCHRN)

  val Samplers = Module(new Samplers)
  Samplers.io.vectorReg1 := vrs1
  Samplers.io.vectorReg2 := vrs2
  Samplers.io.csrs := io.csrs
  Samplers.io.valid := io.valid(INSTR_SAMPLEBINOMIAL) || io.valid(INSTR_SAMPLEREJECTION)
  Samplers.io.mode := io.valid(INSTR_SAMPLEBINOMIAL) || !io.valid(INSTR_SAMPLEREJECTION)

  val NTT = Module(new NTT)
  NTT.io.wa := io.twiddleAddr
  NTT.io.di := io.twiddleData
  NTT.io.we := io.twiddleWrite
  NTT.io.vectorReg1 := vrs1
  NTT.io.vectorReg2 := vrs2
  NTT.io.csrs := io.csrs
  NTT.io.valid := io.valid(INSTR_BUTTERFLY)


  val done = SHA3Core.io.done || Samplers.io.done || NTT.io.done
  val busy = SHA3Core.io.busy || Samplers.io.busy || NTT.io.busy
  val vres = MuxCase(SHA3Core.io.prn, Array(
    Samplers.io.done -> Samplers.io.sampledData,
    NTT.io.done -> NTT.io.dataOut
  ))
  val wb = MuxCase(false.B, Array(
    SHA3Core.io.done -> SHA3Core.io.wb,
    Samplers.io.done -> Samplers.io.wb,
    NTT.io.done -> NTT.io.wb
  ))

  io.done := done
  io.vres := vres
  io.busy := busy
  io.wb := wb
  io.wpos := NTT.io.wpos
}
