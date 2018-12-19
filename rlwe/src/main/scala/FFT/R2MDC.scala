
package FFT

import scala.math._
import chisel3._
import chisel3.util._
import FFT.Config._

/**
  *  n: data width
  *  p: number of point
  */

class ovAdd (w: Int) extends Module {
  val io = IO( new Bundle {
    val a = Input(SInt(w.W))
    val b = Input(SInt(w.W))
    val res = Output(SInt(w.W))
  })
  val allPos = !(io.a(w - 1) | io.b(w - 1))
  val allNeg = io.a(w - 1) & io.b(w - 1)
  val rest = io.a + io.b
  val overFlow = allPos & rest(w - 1)
  val underFlow = allNeg & (!rest(w - 1))
  val maxNum = Fill(w, 0.U(1.W)) | Fill(w-1, 1.U(1.W))
  val minNum = 1.U(1.W) << (w - 1)
  io.res := Mux(overFlow, maxNum.asSInt(), Mux(underFlow, minNum.asSInt(), rest))
}

object ovAdd {
  def apply (w: Int) (a: SInt, b: SInt): SInt = {
    val inst = Module(new ovAdd(w))
    inst.io.a := a
    inst.io.b := b
    inst.io.res
  }
}

class ovSub (w: Int) extends Module {
  val io = IO( new Bundle {
    val a = Input(SInt(w.W))
    val b = Input(SInt(w.W))
    val res = Output(SInt(w.W))
  })
  val pn = !io.a(w - 1) & io.b(w - 1)
  val np = io.a(w - 1) & !io.b(w - 1)
  val rest = io.a - io.b
  val overFlow = pn & rest(w - 1)
  val underFlow = np & (!rest(w - 1))
  val maxNum = Fill(w, 0.U(1.W)) | Fill(w-1, 1.U(1.W))
  val minNum = 1.U(1.W) << (w - 1)
  io.res := Mux(overFlow, maxNum.asSInt(), Mux(underFlow, minNum.asSInt(), rest))
}

object ovSub {
  def apply (w: Int) (a: SInt, b: SInt): SInt = {
    val inst = Module(new ovSub(w))
    inst.io.a := a
    inst.io.b := b
    inst.io.res
  }
}

class complexNum extends Bundle {
  val re = SInt(bw.W)
  val im = SInt(bw.W)
}

class BF extends Module {
  val io = IO(new Bundle{
    val in1 = Input(new complexNum)
    val in2 = Input(new complexNum)
    val out1 = Output(new complexNum)
    val out2 = Output(new complexNum)
  })
  if (dealOverflow) {
    io.out1.re := ovAdd(bw)(io.in1.re, io.in2.re)
    io.out1.im := ovAdd(bw)(io.in1.im, io.in2.im)
    io.out2.re := ovSub(bw)(io.in1.re, io.in2.re)
    io.out2.im := ovSub(bw)(io.in1.im, io.in2.im)
  }
  else{
    io.out1.re := io.in1.re + io.in2.re
    io.out1.im := io.in1.im + io.in2.im
    io.out2.re := io.in1.re - io.in2.re
    io.out2.im := io.in1.im - io.in2.im
  }
}
object BF {
  def apply(in1: complexNum, in2: complexNum): (complexNum, complexNum) = {
    val inst = Module(new BF)
    inst.io.in1 := in1
    inst.io.in2 := in2
    (inst.io.out1, inst.io.out2)
  }
}

class complexMul(gauss: Boolean) extends Module {
  val io = IO(new Bundle {
    val in1 = Input(new complexNum)
    val in2 = Input(new complexNum)
    val out = Output(new complexNum)
  })
  // using Gauss's complex multiplication
  if (dealOverflow) {
    if (gauss) {
      val k1 = io.in2.re * ovAdd(bw)(io.in1.re, io.in1.im)
      val k2 = io.in1.re * ovSub(bw)(io.in2.im, io.in2.re)
      val k3 = io.in1.im * ovAdd(bw)(io.in2.re, io.in2.im)
      io.out.re := ovSub(bw*2)(k1, k3) >> (bw - 2)
      io.out.im := ovAdd(bw*2)(k1, k2) >> (bw - 2)
    } else {
      io.out.re := ovSub(bw*2)((io.in1.re * io.in2.re), (io.in1.im * io.in2.im)) >> (bw - 2)
      io.out.im := ovAdd(bw*2)((io.in1.re * io.in2.im), (io.in1.im * io.in2.re)) >> (bw - 2)
    }
  }
  else {
    if (gauss) {
      val k1 = io.in2.re * (io.in1.re + io.in1.im)
      val k2 = io.in1.re * (io.in2.im - io.in2.re)
      val k3 = io.in1.im * (io.in2.re + io.in2.im)
      io.out.re := (k1 - k3) >> (bw - 2)
      io.out.im := (k1 + k2) >> (bw - 2)
    } else {
      io.out.re := ((io.in1.re * io.in2.re) - (io.in1.im * io.in2.im)) >> (bw - 2)
      io.out.im := ((io.in1.re * io.in2.im) + (io.in1.im * io.in2.re)) >> (bw - 2)
    }
  }
}
object complexMul {
  def apply(gauss: Boolean)(in1: complexNum, in2: complexNum): complexNum = {
    val inst = Module(new complexMul(gauss))
    inst.io.in1 := in1
    inst.io.in2 := in2
    inst.io.out
  }
}

class Switch extends Module {
  val io = IO(new Bundle{
    val in1 = Input(new complexNum)
    val in2 = Input(new complexNum)
    val sel = Input(Bool())
    val out1 = Output(new complexNum)
    val out2 = Output(new complexNum)
  })
  io.out1 := Mux(io.sel, io.in2, io.in1)
  io.out2 := Mux(io.sel, io.in1, io.in2)
}
object Switch {
  def apply(in1: complexNum, in2: complexNum, sel: Bool): (complexNum, complexNum) = {
    val inst = Module(new Switch)
    inst.io.in1 := in1
    inst.io.in2 := in2
    inst.io.sel := sel
    (inst.io.out1, inst.io.out2)
  }
}


class R2MDC(p: Int) extends Module {
  val io = IO ( new Bundle {
    val dIn = Input(new complexNum)
    val din_valid = Input(Bool())
    val dOut1 = Output(new complexNum)
    val dOut2 = Output(new complexNum)
    val dout_valid = Output(Bool())
  })

  val stages: Int = log2Ceil(p)

  // assume 00.a1a2a3a4a5a6a7a8 or 01.00000000
  //        11.a1a2a3a4a5a6a7a8 or 11.00000000
  def sinTable(k: Int): Vec[SInt] = {
    val times = (0 until p/2 by pow(2, k).toInt).map(i => -(i * 2 * Pi) / p.toDouble)
    val inits = times.map(t => round(pow(2, bw-2) * sin(t)).asSInt(bw.W))
    VecInit(inits)
  }
  def cosTable(k: Int): Vec[SInt] = {
    val times = (0 until p/2 by pow(2, k).toInt).map(i => (i * 2 * Pi) / p.toDouble)
    val inits = times.map(t => round(pow(2, bw-2) * cos(t)).asSInt(bw.W))
    VecInit(inits)
  }

  def wnTable1(k: Int)(idx: UInt): complexNum = {
    val res = Wire(new complexNum)
    res.re := cosTable(k)(idx)
    res.im := sinTable(k)(idx)
    res
  }

  val cnt = RegInit(0.U((stages).W))
  when(io.din_valid){
    cnt := cnt + 1.U
  }
  val out1 = VecInit(Seq.fill(stages)(0.S((2 * bw).W).asTypeOf(new complexNum)))
  val out2 = VecInit(Seq.fill(stages)(0.S((2 * bw).W).asTypeOf(new complexNum)))

  for (i <- 0 until stages){
    if (i == 0) {
      val reg1 = ShiftRegister(io.dIn, p/2)
      val BF12 = BF(reg1, io.dIn) // 2 complexNum
      val wnCtrl = cnt(stages-2, 0)
      val wn = wnTable1(0)(wnCtrl)
      val mulRes = complexMul(gauss = true)(BF12._2, wn)
      val switchIn1 = BF12._1
      val switchIn2 = ShiftRegister(mulRes, p/4)
      val swCtrl = cnt(stages-2)
      val sw12 = Switch(switchIn1, switchIn2, swCtrl)
      out1(0) := sw12._1
      out2(0) := sw12._2
    }
    else if (i != stages - 1){
      val reg1 = ShiftRegister(out1(i-1), (p/pow(2, i + 1)).toInt)
      val BF12 = BF(reg1, out2(i-1)) // 2 complexNum
      val wnCtrl = cnt(stages-2-i, 0)
      val wn = wnTable1(i)(wnCtrl)
      val mulRes = complexMul(gauss = true)(BF12._2, wn)
      val switchIn1 = BF12._1
      val switchIn2 = ShiftRegister(mulRes, (p/pow(2, i + 2)).toInt)
      val swCtrl = cnt(stages-2-i)
      val sw12 = Switch(switchIn1, switchIn2, swCtrl)
      out1(i) := sw12._1
      out2(i) := sw12._2
    }
    else {
      val reg1 = ShiftRegister(out1(i-1), (p/pow(2, i + 1)).toInt)
      val BF12 = BF(reg1, out2(i-1)) // 2 complexNum
      out1(i) := BF12._1
      out2(i) := BF12._2
    }
  }
  io.dOut1 := RegNext(out1(stages - 1))
  io.dOut2 := RegNext(out2(stages - 1))
  io.dout_valid := ShiftRegister(io.din_valid, p)

  /**
    *   TODO: reorder buffer a
    *   TODO: parallel to serial
    *
    * **/
}

object elaborateR2MDC extends App {
  chisel3.Driver.execute(args, () => new R2MDC(p = 64))
}