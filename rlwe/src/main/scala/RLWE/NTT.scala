
package RLWE

import chisel3._
import chisel3.util._
import scala.math._
import utility._
import fsm._

/*
class MRFixIO extends Bundle
  with HasNTTCommonParameters {
  val a = Input(UInt((DataWidth * 2).W))
  val ar = Output(UInt(DataWidth.W))
}

class MRFix extends Module
  with HasNTTCommonParameters
  with HasMRParameters {
  val io = IO(new MRFixIO())

  // 16bit
  val tmp1 = io.a >> 12.U
  // 20bit
  val tmp2 = (tmp1 << 1.U) +& (tmp1 << 3.U)
  // 32bit
  val mul  = Wire(UInt(32.W))
  mul := (tmp2 << 12.U) + (tmp2 << 8.U) + (tmp2 << 4.U) + (tmp1 << 3.U) - tmp1
  // 15bit
  val qGuess = mul >> 17.U
  // 28bit
  val qM = Wire(UInt((DataWidth * 2).W))
  qM := qGuess + (qGuess << 12.U) + (qGuess << 13.U)

  val z = io.a - qM
  io.ar := Mux(z < MRq.asUInt(), z, z-MRq.asUInt())
}

object MRFix {
  def apply(a: UInt, ar: UInt): Module = {
    val inst = Module(new MRFix())
    inst.io.a := a
    ar := inst.io.ar
    inst
  }
  def apply(a: UInt): UInt = {
    val inst = Module(new MRFix())
    inst.io.a := a
    inst.io.ar
  }
}
*/

// add configurability

class MRIO extends Bundle
  with HasCommonParameters {
  val a = Input(UInt((DataWidth * 2).W))
  val n = Input(UInt(5.W))
  val m = Input(UInt(DataWidth.W))
  val u = Input(UInt((DataWidth + 2).W))
  val ar = Output(UInt(DataWidth.W))
}

class MR extends Module
  with HasCommonParameters {
  val io = IO(new MRIO)

  val shift1 = io.a >> (io.n - 2.U)
  val mul1 = io.u * shift1.asUInt
  val qGuess = mul1 >> (io.n + 3.U)
  // TODO: check if pipeline is needed
  val mul2 = qGuess * io.m
  val z = io.a - mul2

  io.ar := Mux(z < io.m, z, z-io.m)
}

object MR {
  def apply(a: UInt, n: UInt, m: UInt, u: UInt): UInt = {
    val inst = Module(new MR())
    inst.io.a := a
    inst.io.n := n
    inst.io.m := m
    inst.io.u := u
    inst.io.ar
  }
}

object elaborateMR extends App {
  chisel3.Driver.execute(args, () => new MR)
}


class ButterflyIO extends Bundle
  with HasCommonParameters {
  val a = Input(UInt(DataWidth.W))
  val b = Input(UInt(DataWidth.W))
  val wn = Input(UInt(DataWidth.W))
  // csrs
  val n = Input(UInt(5.W))
  val m = Input(UInt(DataWidth.W))
  val u = Input(UInt((DataWidth + 2).W))
  val aout = Output(UInt(DataWidth.W))
  val bout = Output(UInt(DataWidth.W))
}
// cooley-turkey
class Butterfly extends Module
  with HasCommonParameters {
  val io = IO(new ButterflyIO)

  val amul = io.a
  val bmul = MR(io.b * io.wn, n = io.n, m = io.m, u = io.u)

  val atmp = Wire(UInt((DataWidth + 1).W))
  val btmp = Wire(UInt((DataWidth + 1).W))
  atmp := amul +& bmul
  btmp := amul -& bmul

  val flag = Wire(UInt((DataWidth + 1).W))
  flag := atmp -& io.m

  io.aout := Mux(flag(DataWidth), atmp(DataWidth - 1, 0), flag(DataWidth - 1, 0))
  io.bout := Mux(btmp(DataWidth), btmp(DataWidth - 1, 0) + io.m, btmp(DataWidth - 1, 0))
}

object elaborateButterfly extends App {
  chisel3.Driver.execute(args, () => new Butterfly)
}


// permutation network
class PermNetIO extends Bundle
  with HasCommonParameters
  with HasNTTParameters {
  val in = Input(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
  val config = Input(Vec(log2Ceil(ButterflyNum), Bool()))
  val out = Output(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
}
class PermNetIn extends Module
  with HasCommonParameters
  with HasNTTParameters {
  val io = IO(new PermNetIO)

  def perm(split: Int): Vec[UInt] = {
    val perm = Wire(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
    for(i <- 0 until ButterflyNum * 2 / split) {
      for (j <- 0 until split) {
        if (j % 2 == 0) {
          perm(i * split + j) := io.in(i * split + j / 2)
        } else {
          perm(i * split + j) := io.in(i * split + split / 2 + (j - 1) / 2)
        }
      }
    }
    perm
  }

  val multiPerm = Wire(Vec(log2Ceil(ButterflyNum), Vec(ButterflyNum * 2, UInt(DataWidth.W))))
  for (i <- 0 until log2Ceil(ButterflyNum)) {
    multiPerm(i) := perm(pow(2, i + 2).toInt)
  }

  val out = Mux1H(io.config, multiPerm)
  io.out := Mux(!(io.config.reduce(_ || _)), io.in, out)
}
object elaboratePermNet extends App {
  chisel3.Driver.execute(args, () => new PermNetIn)
}

class PermNetOut extends Module
  with HasCommonParameters
  with HasNTTParameters {
  val io = IO(new PermNetIO)

  def perm(split: Int): Vec[UInt] = {
    val perm = Wire(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
    for(i <- 0 until ButterflyNum * 2 / split) {
      for (j <- 0 until split) {
        if (j < split / 2) {
          perm(i * split + j) := io.in(i * split + j * 2)
        } else {
          perm(i * split + j) := io.in(i * split + 1 + (j - split / 2) * 2)
        }
      }
    }
    perm
  }

  val multiPerm = Wire(Vec(log2Ceil(ButterflyNum), Vec(ButterflyNum * 2, UInt(DataWidth.W))))
  for (i <- 0 until log2Ceil(ButterflyNum)) {
    multiPerm(i) := perm(pow(2, i + 2).toInt)
  }

  val out = Mux1H(io.config, multiPerm)
  io.out := Mux(!(io.config.reduce(_ || _)), io.in, out)
}

class NTTIO extends Bundle
  with HasCommonParameters
  with HasNTTParameters {
  val valid = Input(Bool())

  // ram write interface
  val wa = Input(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val di = Input(UInt((DataWidth * ButterflyNum).W))
  val we = Input(Bool())

  // from register
  val vectorReg1 = Input(Vec(ML, UInt(DataWidth.W)))
  val vectorReg2 = Input(Vec(ML, UInt(DataWidth.W)))

  // csr interface
  val csrs = Input(new CSRIO)

  // output
  val dataOut = Output(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
  val done = Output(Bool())
  val busy = Output(Bool())
  val wb = Output(Bool())
  val wpos = Output(Bool())
}

class NTT extends Module
  with HasCommonParameters
  with HasNTTParameters {
  val io = IO(new NTTIO)

  // data preparation
  val op1Interweave = Wire(Vec(ML, UInt(DataWidth.W)))
  val op2Interweave = Wire(Vec(ML, UInt(DataWidth.W)))
  for (i <- 0 until ML) {
    if (i < ML / 2) {
      op1Interweave(i) := io.vectorReg1(i)
      op2Interweave(i) := io.vectorReg1(i + ML / 2)
    } else {
      op1Interweave(i) := io.vectorReg2(i - ML / 2)
      op2Interweave(i) := io.vectorReg2(i)
    }
  }

  io.wb := true.B
  io.done := false.B
  io.busy := false.B
  io.wpos := false.B

  // permutation in
  val permNet = Module(new PermNetIn)
  permNet.io.in := io.vectorReg1
  for (i <- 0 until log2Ceil(ButterflyNum)) {
    permNet.io.config(i) := false.B
  }
  when(io.csrs.csrButterflyCtrl.stageCfg === 0.U) {

  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 1.U) {
    permNet.io.config(0) := true.B
  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 2.U) {
    permNet.io.config(1) := true.B
  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 3.U) {
    permNet.io.config(2) := true.B
  } .otherwise {
    permNet.io.config(3) := true.B
  }

  // data mode
  // 0: Internal  1: Interweave
  val mode = io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt()

  // wn addr prepare
  val wnBaseAddr1 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val wnBaseAddr2 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val wnBaseAddr3 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  // contain stage info
  wnBaseAddr1 := Mux(io.csrs.csrButterflyCtrl.stageCfg < log2Ceil(ButterflyNum).asUInt(),
                    0.U, 1.U << (io.csrs.csrButterflyCtrl.stageCfg - log2Ceil(ButterflyNum).asUInt()))
  // contain iter info
  wnBaseAddr2 := Mux(io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt(),
                    io.csrs.csrButterflyCtrl.iterCfg + wnBaseAddr1, wnBaseAddr1)
  // contain interweave info
  wnBaseAddr3 := Mux(io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt(),
                    wnBaseAddr2 + (1.U << (io.csrs.csrButterflyCtrl.stageCfg - log2Ceil(ButterflyNum).asUInt() - 1.U)), wnBaseAddr2)


  // wn consts ram
  /**
    *
    *    (1)  {1 1} {1 1/4} {1 1/8 ..} {1 1/16 ... 7/16}
    *    (2)  1 1/32 ... 15/32
    *    (3)  ...
    *
    *    32 line 1 1/1024 ... 511/1024
    *
    */
  val twiddleRam = Module(new SyncRam(dep = MaxVectorLength / ButterflyNum, dw = DataWidth * ButterflyNum))
  twiddleRam.io.re := io.valid
  twiddleRam.io.we := io.we
  twiddleRam.io.ra := 0.U
  twiddleRam.io.wa := io.wa
  twiddleRam.io.di := io.di

  // fsm
  val fsm = InstanciateFSM(new FSM {
    entryState(stateName = "idle")
      .act {
        io.done := false.B
        io.busy := false.B
        io.wpos := false.B
        permNet.io.in := io.vectorReg1
        twiddleRam.io.ra := wnBaseAddr2
      }
      .when(io.valid).transferTo(destName = "phase1")

    state(stateName = "phase1")
      .act {
        io.done := true.B
        io.busy := true.B
        io.wpos := false.B
        permNet.io.in := Mux(mode, op1Interweave, io.vectorReg1)
        twiddleRam.io.ra := wnBaseAddr3
      }
      .when(true.B).transferTo(destName = "phase2")

    state(stateName = "phase2")
      .act {
        io.done := true.B
        io.busy := false.B
        io.wpos := true.B
        permNet.io.in := Mux(mode, RegNext(op2Interweave), io.vectorReg2)
        twiddleRam.io.ra := wnBaseAddr2
      }
      .when(io.valid).transferTo(destName = "phase1")
      .otherwise.transferToEnd
  })

  // butterfly PEs
  val PEs = VecInit(Seq.fill(ButterflyNum)(Module(new Butterfly()).io))
  for (i <- 0 until ButterflyNum) {
    PEs(i).a := permNet.io.out(2 * i)
    PEs(i).b := permNet.io.out(2 * i + 1)
    // wn assign
    PEs(i).wn := twiddleRam.io.dout(DataWidth * i + DataWidth - 1, DataWidth * i)
    when(io.csrs.csrButterflyCtrl.stageCfg < log2Ceil(ButterflyNum).asUInt()) {
      switch(io.csrs.csrButterflyCtrl.stageCfg) {
        is(0.U) {
          PEs(i).wn := twiddleRam.io.dout(DataWidth - 1, 0)
        }
        is(1.U) {
          PEs(i).wn := twiddleRam.io.dout(DataWidth * (i % 2 + 2) + DataWidth - 1, DataWidth * (i % 2 + 2))
        }
        is(2.U) {
          PEs(i).wn := twiddleRam.io.dout(DataWidth * (i % 4 + 4) + DataWidth - 1, DataWidth * (i % 4 + 4))
        }
        is(3.U) {
          PEs(i).wn := twiddleRam.io.dout(DataWidth * (i % 8 + 8) + DataWidth - 1, DataWidth * (i % 8 + 8))
        }
      }
    }

    PEs(i).n := io.csrs.csrModulusLen
    PEs(i).m := io.csrs.csrModulusq
    PEs(i).u := io.csrs.csrBarretu

  }

  // permutation out
  val permNetOut = Module(new PermNetOut)
  permNetOut.io.config := permNet.io.config
  for (i <- 0 until ButterflyNum) {
    permNetOut.io.in(2 * i) := PEs(i).aout
    permNetOut.io.in(2 * i + 1) := PEs(i).bout
  }
  io.dataOut := permNetOut.io.out
}

class NTTWithoutRam extends Module
  with HasCommonParameters
  with HasNTTParameters {
  val io = IO(new Bundle {
    val valid = Input(Bool())

    // ram from outside
    val ra = Output(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
    val re = Output(Bool())
    val di = Input(UInt((ButterflyNum * DataWidth).W))

    // from register
    val vectorReg1 = Input(Vec(ML, UInt(DataWidth.W)))
    val vectorReg2 = Input(Vec(ML, UInt(DataWidth.W)))

    // csr interface
    val csrs = Input(new CSRIO)

    // output
    val dataOut = Output(Vec(ButterflyNum * 2, UInt(DataWidth.W)))
    val done = Output(Bool())
    val busy = Output(Bool())
    val wb = Output(Bool())
    val wpos = Output(Bool())
  })


  // data preparation
  val op1Interweave = Wire(Vec(ML, UInt(DataWidth.W)))
  val op2Interweave = Wire(Vec(ML, UInt(DataWidth.W)))
  for (i <- 0 until ML) {
    if (i < ML / 2) {
      op1Interweave(i) := io.vectorReg1(i)
      op2Interweave(i) := io.vectorReg1(i + ML / 2)
    } else {
      op1Interweave(i) := io.vectorReg2(i - ML / 2)
      op2Interweave(i) := io.vectorReg2(i)
    }
  }

  io.wb := true.B
  io.done := false.B
  io.busy := false.B
  io.wpos := false.B

  // permutation in
  val permNet = Module(new PermNetIn)
  permNet.io.in := io.vectorReg1
  for (i <- 0 until log2Ceil(ButterflyNum)) {
    permNet.io.config(i) := false.B
  }
  when(io.csrs.csrButterflyCtrl.stageCfg === 0.U) {

  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 1.U) {
    permNet.io.config(0) := true.B
  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 2.U) {
    permNet.io.config(1) := true.B
  } .elsewhen(io.csrs.csrButterflyCtrl.stageCfg === 3.U) {
    permNet.io.config(2) := true.B
  } .otherwise {
    permNet.io.config(3) := true.B
  }

  // data mode
  // 0: Internal  1: Interweave
  val mode = io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt()

  // wn addr prepare
  val wnBaseAddr1 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val wnBaseAddr2 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  val wnBaseAddr3 = Wire(UInt(log2Ceil(MaxVectorLength / ButterflyNum).W))
  // contain stage info
  wnBaseAddr1 := Mux(io.csrs.csrButterflyCtrl.stageCfg < log2Ceil(ButterflyNum).asUInt(),
    0.U, 1.U << (io.csrs.csrButterflyCtrl.stageCfg - log2Ceil(ButterflyNum).asUInt()))
  // contain iter info
  wnBaseAddr2 := Mux(io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt(),
    io.csrs.csrButterflyCtrl.iterCfg + wnBaseAddr1, wnBaseAddr1)
  // contain interweave info
  wnBaseAddr3 := Mux(io.csrs.csrButterflyCtrl.stageCfg > log2Ceil(ButterflyNum).asUInt(),
    wnBaseAddr2 + (1.U << (io.csrs.csrButterflyCtrl.stageCfg - log2Ceil(ButterflyNum).asUInt() - 1.U)), wnBaseAddr2)


  // wn consts ram
  /**
    *
    *    (1)  {1 1} {1 1/4} {1 1/8 ..} {1 1/16 ... 7/16}
    *    (2)  1 1/32 ... 15/32
    *    (3)  ...
    *
    *    32 line 1 1/1024 ... 511/1024
    *
    */
  io.re := io.valid
  io.ra := 0.U

  // fsm
  val fsm = InstanciateFSM(new FSM {
    entryState(stateName = "idle")
      .act {
        io.done := false.B
        io.busy := false.B
        io.wpos := false.B
        permNet.io.in := io.vectorReg1
        io.ra := wnBaseAddr2
      }
      .when(io.valid).transferTo(destName = "phase1")

    state(stateName = "phase1")
      .act {
        io.done := true.B
        io.busy := true.B
        io.wpos := false.B
        permNet.io.in := Mux(mode, op1Interweave, io.vectorReg1)
        io.ra := wnBaseAddr3
      }
      .when(true.B).transferTo(destName = "phase2")

    state(stateName = "phase2")
      .act {
        io.done := true.B
        io.busy := false.B
        io.wpos := true.B
        permNet.io.in := Mux(mode, RegNext(op2Interweave), io.vectorReg2)
        io.ra := wnBaseAddr2
      }
      .when(io.valid).transferTo(destName = "phase1")
      .otherwise.transferToEnd
  })

  // butterfly PEs
  val PEs = VecInit(Seq.fill(ButterflyNum)(Module(new Butterfly()).io))
  for (i <- 0 until ButterflyNum) {
    PEs(i).a := permNet.io.out(2 * i)
    PEs(i).b := permNet.io.out(2 * i + 1)
    // wn assign
    PEs(i).wn := io.di(DataWidth * i + DataWidth - 1, DataWidth * i)
    when(io.csrs.csrButterflyCtrl.stageCfg < log2Ceil(ButterflyNum).asUInt()) {
      switch(io.csrs.csrButterflyCtrl.stageCfg) {
        is(0.U) {
          PEs(i).wn := io.di(DataWidth - 1, 0)
        }
        is(1.U) {
          PEs(i).wn := io.di(DataWidth * (i % 2 + 2) + DataWidth - 1, DataWidth * (i % 2 + 2))
        }
        is(2.U) {
          PEs(i).wn := io.di(DataWidth * (i % 4 + 4) + DataWidth - 1, DataWidth * (i % 4 + 4))
        }
        is(3.U) {
          PEs(i).wn := io.di(DataWidth * (i % 8 + 8) + DataWidth - 1, DataWidth * (i % 8 + 8))
        }
      }
    }

    PEs(i).n := io.csrs.csrModulusLen
    PEs(i).m := io.csrs.csrModulusq
    PEs(i).u := io.csrs.csrBarretu

  }

  // permutation out
  val permNetOut = Module(new PermNetOut)
  permNetOut.io.config := permNet.io.config
  for (i <- 0 until ButterflyNum) {
    permNetOut.io.in(2 * i) := PEs(i).aout
    permNetOut.io.in(2 * i + 1) := PEs(i).bout
  }
  io.dataOut := permNetOut.io.out
}
object elaborateNTTWithoutRam extends App {
  chisel3.Driver.execute(args, () => new NTTWithoutRam)
}

object elaborateNTT extends App {
  chisel3.Driver.execute(args, () => new NTT)
}

//class SwitchIO extends Bundle
//  with HasCommonParameters {
//  val a = Input(UInt(DataWidth.W))
//  val b = Input(UInt(DataWidth.W))
//  val sel = Input(Bool())
//  val aout = Output(UInt(DataWidth.W))
//  val bout = Output(UInt(DataWidth.W))
//}
//
//class Switch extends Module {
//  val io = IO(new SwitchIO())
//  io.aout := Mux(io.sel, io.b, io.a)
//  io.bout := Mux(io.sel, io.a, io.b)
//}
//object Switch {
//  def apply(a: UInt, b: UInt, sel: Bool, aout: UInt, bout: UInt): Module = {
//    val inst = Module(new Switch)
//    inst.io.a := a
//    inst.io.b := b
//    inst.io.sel := sel
//    aout := inst.io.aout
//    bout := inst.io.bout
//    inst
//  }
//}

//class NTTR2MDCIO extends Bundle
//  with HasNTTCommonParameters {
//  val dIn = Input(UInt(DataWidth.W))
//  val dInValid = Input(Bool())
//  val dOut1 = Output(UInt(DataWidth.W))
//  // val addrOut1 = Output(UInt(AddrWidth.W))
//  val dOut2 = Output(UInt(DataWidth.W))
//  // val addrOut2 = Output(UInt(AddrWidth.W))
//  val dOutValid = Output(Bool())
//}
//
//class NTTR2MDC extends Module
//  with HasMRParameters
//  with HasNTTCommonParameters
//  with HasNTTParameters {
//  val io = IO(new NTTR2MDCIO())
//
//  val stages: Int = AddrWidth
//
//  val wn  = RegInit(VecInit(Seq.fill(stages)(1.U(DataWidth.W))))
//  val cnt = RegInit(0.U((stages).W))
//  when(io.dInValid){
//    cnt := cnt + 1.U
//    for (i <- 0 until stages - 1) {
//      val res = MRFix(wn(i) * WN(i).asUInt())
//      wn(i) := Mux(res === (MRq.asUInt() - 1.U), 1.U, res)
//    }
//  }
//
//  val out1 = VecInit(Seq.fill(stages)(0.U(DataWidth.W)))
//  val out2 = VecInit(Seq.fill(stages)(0.U(DataWidth.W)))
//  /***
//    *
//    * pre modular reduction
//    *
//    *
//    */
//
//  val dIn = Mux(io.dIn < MRq.asUInt(), io.dIn, io.dIn - MRq.asUInt())
//
//  for (i <- 0 until stages){
//    if (i == 0) {
//      val regIn = ShiftRegister(dIn, VectorLength / 2)
//      val BFOut1 = Wire(UInt(DataWidth.W))
//      val BFOut2 = Wire(UInt(DataWidth.W))
//      BF2(regIn, dIn, BFOut1, BFOut2)
//      /**
//        *  can add pipeline if necessary
//         *
//      **/
//      val mulRes = MRFix(BFOut2 * wn(i))
//      val switchIn1 = BFOut1
//      val switchIn2 = ShiftRegister(mulRes, VectorLength/4)
//      val swCtrl = cnt(stages-2)
//      Switch(switchIn1, switchIn2, swCtrl, out1(0), out2(0))
//    }
//    else if (i < stages - 1){
//      val regIn = ShiftRegister(out1(i-1), (VectorLength/pow(2, i + 1)).toInt)
//      val BFOut1 = Wire(UInt(14.W))
//      val BFOut2 = Wire(UInt(14.W))
//      BF2(regIn, out2(i-1), BFOut1, BFOut2)
//      /**
//        *  can add pipeline if necessary
//        *
//        **/
//      val mulRes = MRFix(BFOut2 * wn(i))
//      val switchIn1 = BFOut1
//      val switchIn2 = ShiftRegister(mulRes, (VectorLength/pow(2, i + 2)).toInt)
//      val swCtrl = cnt(stages-2-i)
//      Switch(switchIn1, switchIn2, swCtrl, out1(i), out2(i))
//    }
//    else {
//      val regIn = ShiftRegister(out1(i-1), (VectorLength/pow(2, i + 1)).toInt)
//      BF2(regIn, out2(i-1), out1(i), out2(i))
//    }
//  }
//  io.dOut1 := RegNext(out1(stages - 1))
//  io.dOut2 := RegNext(out2(stages - 1))
//  io.dOutValid := ShiftRegister(io.dInValid, VectorLength)
//
//}
