
package RLWE

import chisel3._
import chisel3.util._

// not rocc style
// standalone coprocessor

class PQCCoprocessorIO extends Bundle
  with HasCommonParameters
  with HasNTTParameters
  with HasPQCInstructions {
  // for decode
  val instr = Input(new PQCInstruction)
  val rs1 = Input(UInt(64.W))
  val rs2 = Input(UInt(64.W))
  val in_fire = Input(Bool())

  // for SHA3
  val seed = Input(new stateArray())
  val seedWrite = Input(Bool())

  // for ConstRam, from outside
  val twiddleData = Input(UInt((DataWidth * ButterflyNum).W))
  val twiddleAddr = Input(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val twiddleWrite = Input(Bool())

  // vector interface
  val vectorOut = Output(Vec(ML, UInt(DataWidth.W)))
  val vectorWriteAddr = Output(UInt(32.W))
  val vectorWriteEnable = Output(Bool())

  val vectorIn = Input(Vec(ML, UInt(DataWidth.W)))
  val vectorReadaddr = Output(UInt(32.W))
  val vectorReadEnable = Output(Bool())
}

class CSRIO extends Bundle
  with HasCommonParameters {
  val csrBarretu = UInt((DataWidth + 2).W)
  val csrBound = UInt((DataWidth * 2).W)
  val csrBinomialk = UInt(3.W)
  val csrModulusq = UInt(DataWidth.W)
  val csrModulusLen = UInt(5.W)
  /**
    *
    *      9 ... 6        5 ... 0
    *     stage_cfg      iter_cfg
    */

  val csrButterflyCtrl = new Bundle {
    val stageCfg = UInt(4.W)
    val iterCfg = UInt(6.W)
  }
  val csrLsBaseAddr = UInt(32.W)
}

class PQCCoprocessor extends Module
  with HasCommonParameters
  with HasPQCInstructions {
  val io = IO(new PQCCoprocessorIO)

  // decode
  val decoder = Module(new PQCDecode)
  decoder.io.instr := io.instr
  decoder.io.rs1 := io.rs1
  decoder.io.rs2 := io.rs2
  decoder.io.in_fire := io.in_fire
  val doinstr = decoder.io.result

  // CSRs
  val csrBarretu = RegInit(0.U((DataWidth + 2).W))
  val csrBound = RegInit(0.U((DataWidth * 2).W))
  val csrBinomialk = RegInit(0.U(3.W))
  val csrModulusq = RegInit(0.U(DataWidth.W))
  val csrModulusLen = RegInit(0.U(5.W))
  val csrButterflyCtrl = RegInit(0.U(10.W))
  val csrLsBaseAddr = RegInit(0.U(32.W))

  // vector SRAM
  val vecSRAM = Module(new VectorRegister)
  vecSRAM.io.vectorReadAddr1 := decoder.io.vrs1idx
  vecSRAM.io.vectorReadAddr2 := decoder.io.vrs2idx
  val vecop1 = vecSRAM.io.vectorReadValue1
  val vecop2 = vecSRAM.io.vectorReadValue2

  // ======================================
  // EXU Stage
  // ======================================
  val exunit = Module(new PQCExu)

  exunit.io.seed := io.seed
  exunit.io.seedWrite := io.seedWrite
  exunit.io.twiddleData := io.twiddleData
  exunit.io.twiddleAddr := io.twiddleAddr
  exunit.io.twiddleWrite := io.twiddleWrite
  for (i <- 0 until INSTR_QUANTITY) {
    if (i == INSTR_FETCHRN || i == INSTR_BUTTERFLY) {
      // fetch and butterfly
      exunit.io.valid(i) := doinstr(i) && decoder.io.fire
    } else {
      // sample
      exunit.io.valid(i) := RegNext(doinstr(i) && decoder.io.fire)
    }
  }

  exunit.io.vrs1 := vecop1
  exunit.io.vrs2 := vecop2
  exunit.io.csrs.csrBarretu := csrBarretu
  exunit.io.csrs.csrBound := csrBound
  exunit.io.csrs.csrBinomialk := csrBinomialk
  exunit.io.csrs.csrModulusq := csrModulusq
  exunit.io.csrs.csrModulusLen := csrModulusLen
  exunit.io.csrs.csrButterflyCtrl.stageCfg := csrButterflyCtrl(9, 6)
  exunit.io.csrs.csrButterflyCtrl.iterCfg := csrButterflyCtrl(5, 0)
  exunit.io.csrs.csrLsBaseAddr := csrLsBaseAddr

  vecSRAM.io.vectorWriteEnable := exunit.io.done && exunit.io.wb
  vecSRAM.io.vectorWriteData := exunit.io.vres
  vecSRAM.io.vectorWriteAddr := Mux(!RegNext(doinstr(INSTR_BUTTERFLY) && decoder.io.fire), RegNext(decoder.io.vrdidx),
                                    Mux(!exunit.io.wpos, decoder.io.vrs1idx, RegNext(decoder.io.vrs1idx)))

  // CSRRW
  when(decoder.io.fire && doinstr(INSTR_CSRRW)){
    switch(decoder.io.vrs2idx) {
      is(0.U) {
        csrBarretu := decoder.io.srs1
      }
      is(1.U) {
        csrBound := decoder.io.srs1
      }
      is(2.U) {
        csrBinomialk := decoder.io.srs1
      }
      is(3.U) {
        csrModulusq := decoder.io.srs1
      }
      is(4.U) {
        csrModulusLen := decoder.io.srs1
      }
      is(5.U) {
        csrButterflyCtrl := decoder.io.srs1
      }
      is(6.U) {
        csrLsBaseAddr := decoder.io.srs1
      }
    }
  }

  // CSRRWI
  when(decoder.io.fire && doinstr(INSTR_CSRRWI)){
    switch(decoder.io.vrs2idx) {
      is(0.U) {
        csrBarretu := decoder.io.vrs1idx
      }
      is(1.U) {
        csrBound := decoder.io.vrs1idx
      }
      is(2.U) {
        csrBinomialk := decoder.io.vrs1idx
      }
      is(3.U) {
        csrModulusq := decoder.io.vrs1idx
      }
      is(4.U) {
        csrModulusLen := decoder.io.vrs1idx
      }
      is(5.U) {
        csrButterflyCtrl := decoder.io.vrs1idx
      }
      is(6.U) {
        csrLsBaseAddr := decoder.io.vrs1idx
      }
    }
  }

  // additional connect
  // TODO: Finish This
  decoder.io.busy := exunit.io.busy

  // memory
  io.vectorReadaddr := csrLsBaseAddr
  io.vectorWriteAddr := csrLsBaseAddr
  io.vectorOut := vecop1

  when(decoder.io.fire && doinstr(INSTR_VLD)) {
    vecSRAM.io.vectorWriteData := io.vectorIn
    vecSRAM.io.vectorWriteEnable := RegNext(true.B)
  }

  io.vectorReadEnable := decoder.io.fire && doinstr(INSTR_VLD)
  io.vectorWriteEnable := decoder.io.fire && doinstr(INSTR_VST)
}

object elaboratePQCCoprocessor extends App {
  chisel3.Driver.execute(args, () => new PQCCoprocessor())
}
