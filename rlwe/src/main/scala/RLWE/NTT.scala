
package RLWE

import chisel3._
import chisel3.util._
import scala.math._

class MRIO extends Bundle
  with HasNTTCommonParameters {
  val a = Input(UInt((DataWidth * 2).W))
  val ar = Output(UInt(DataWidth.W))
}

class MR extends Module
  with HasNTTCommonParameters
  with HasMRParameters {
  val io = IO(new MRIO())

  // TODO: consider pipeline when necessary
  // 16bit
  val tmp1 = io.a >> 12
  // 20bit
  val tmp2 = (tmp1 << 1) +& (tmp1 << 3)
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

object MR {
  def apply(a: UInt, ar: UInt): Module = {
    val inst = Module(new MR())
    inst.io.a := a
    ar := inst.io.ar
    inst
  }
  def apply(a: UInt): UInt = {
    val inst = Module(new MR())
    inst.io.a := a
    inst.io.ar
  }
}

object elaborateMR extends App {
  chisel3.Driver.execute(args, () => new MR)
}


class BF2IO extends Bundle
  with HasNTTCommonParameters {
  val a = Input(UInt(DataWidth.W))
  val b = Input(UInt(DataWidth.W))
  val aout = Output(UInt(DataWidth.W))
  val bout = Output(UInt(DataWidth.W))
}

class BF2 extends Module
  with HasMRParameters
  with HasNTTCommonParameters {
  val io = IO(new BF2IO)

  val atmp = Wire(UInt((DataWidth + 1).W))
  val btmp = Wire(UInt((DataWidth + 1).W))
  atmp := io.a +& io.b
  btmp := io.a -& io.b

  val flag = Wire(UInt((DataWidth + 1).W))
  flag := atmp -& MRq.asUInt()

  io.aout := Mux(flag(DataWidth), atmp, atmp - MRq.asUInt())
  io.bout := Mux(btmp(DataWidth), btmp + MRq.asUInt(), btmp)
}

object BF2{
  def apply(a:UInt, b:UInt, aout:UInt, bout:UInt):Module = {
    val inst = Module(new BF2)
    inst.io.a := a
    inst.io.b := b
    aout := inst.io.aout
    bout := inst.io.bout
    inst
  }
}

object elaborateBF2 extends App {
  chisel3.Driver.execute(args, () => new BF2)
}

class SwitchIO extends Bundle
  with HasNTTCommonParameters {
  val a = Input(UInt(DataWidth.W))
  val b = Input(UInt(DataWidth.W))
  val sel = Input(Bool())
  val aout = Output(UInt(DataWidth.W))
  val bout = Output(UInt(DataWidth.W))
}

class Switch extends Module {
  val io = IO(new SwitchIO())
  io.aout := Mux(io.sel, io.b, io.a)
  io.bout := Mux(io.sel, io.a, io.b)
}
object Switch {
  def apply(a: UInt, b: UInt, sel: Bool, aout: UInt, bout: UInt): Module = {
    val inst = Module(new Switch)
    inst.io.a := a
    inst.io.b := b
    inst.io.sel := sel
    aout := inst.io.aout
    bout := inst.io.bout
    inst
  }
}

class NTTR2MDCIO extends Bundle
  with HasNTTCommonParameters {
  val dIn = Input(UInt(DataWidth.W))
  val dInValid = Input(Bool())
  val dOut1 = Output(UInt(DataWidth.W))
  // val addrOut1 = Output(UInt(AddrWidth.W))
  val dOut2 = Output(UInt(DataWidth.W))
  // val addrOut2 = Output(UInt(AddrWidth.W))
  val dOutValid = Output(Bool())
}

class NTTR2MDC extends Module
  with HasMRParameters
  with HasNTTCommonParameters
  with HasNTTParameters {
  val io = IO(new NTTR2MDCIO())

  val stages: Int = AddrWidth

  val wn  = RegInit(VecInit(Seq.fill(stages)(1.U(DataWidth.W))))
  val cnt = RegInit(0.U((stages).W))
  when(io.dInValid){
    cnt := cnt + 1.U
    for (i <- 0 until stages - 1) {
      // TODO: Test => modify this
      val res = MR(wn(i) * WN(i).asUInt())
      wn(i) := Mux(res === (MRq.asUInt() - 1.U), 1.U, res)
    }
  }

  val out1 = VecInit(Seq.fill(stages)(0.U(DataWidth.W)))
  val out2 = VecInit(Seq.fill(stages)(0.U(DataWidth.W)))
  /***
    *
    * pre modular reduction
    *
    *
    */

  val dIn = Mux(io.dIn < MRq.asUInt(), io.dIn, io.dIn - MRq.asUInt())

  for (i <- 0 until stages){
    if (i == 0) {
      val regIn = ShiftRegister(dIn, VectorLength / 2)
      val BFOut1 = Wire(UInt(DataWidth.W))
      val BFOut2 = Wire(UInt(DataWidth.W))
      BF2(regIn, dIn, BFOut1, BFOut2)
      /**
        *  can add pipeline if necessary
         *
      **/
      val mulRes = MR(BFOut2 * wn(i))
      val switchIn1 = BFOut1
      val switchIn2 = ShiftRegister(mulRes, VectorLength/4)
      val swCtrl = cnt(stages-2)
      Switch(switchIn1, switchIn2, swCtrl, out1(0), out2(0))
    }
    else if (i < stages - 1){
      val regIn = ShiftRegister(out1(i-1), (VectorLength/pow(2, i + 1)).toInt)
      val BFOut1 = Wire(UInt(14.W))
      val BFOut2 = Wire(UInt(14.W))
      BF2(regIn, out2(i-1), BFOut1, BFOut2)
      /**
        *  can add pipeline if necessary
        *
        **/
      val mulRes = MR(BFOut2 * wn(i))
      val switchIn1 = BFOut1
      val switchIn2 = ShiftRegister(mulRes, (VectorLength/pow(2, i + 2)).toInt)
      val swCtrl = cnt(stages-2-i)
      Switch(switchIn1, switchIn2, swCtrl, out1(i), out2(i))
    }
    else {
      val regIn = ShiftRegister(out1(i-1), (VectorLength/pow(2, i + 1)).toInt)
      BF2(regIn, out2(i-1), out1(i), out2(i))
    }
  }
  io.dOut1 := RegNext(out1(stages - 1))
  io.dOut2 := RegNext(out2(stages - 1))
  io.dOutValid := ShiftRegister(io.dInValid, VectorLength)

  /**
    *   TODO: reorder buffer a
    *
    **/
}

object elaborateNTTR2MDC extends App {
  chisel3.Driver.execute(args, () => new NTTR2MDC())
}
