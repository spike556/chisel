
package nvdla

import chisel3._
import chisel3.util._
import ram._

class bufCtrlIn extends Bundle {
  val data = UInt(1024.W)
  val addr = UInt(12.W)
  val enable = Bool()
  val hsel = UInt(2.W)
}

class bufCtrlOutIO extends Bundle {
  val addr = Input(UInt(12.W))
  val enable = Input(Bool())
  val data = Output(UInt(1024.W))
  val valid = Output(Bool())
}

class ramReqB extends Bundle {
  val addr = UInt(8.W)
  val data = UInt(512.W)
}

class Cbuf extends Module {
  val io = IO(new Bundle {

    val pwrbus_ram_pd = Input(UInt(32.W))

    //cdma2buf
    val cdma2bufWt = Input(new bufCtrlIn())
    val cdma2bufDat = Input(new bufCtrlIn())

    //sc2buf
    val sc2bufDat = new bufCtrlOutIO()
    val sc2bufWt = new bufCtrlOutIO()
    val sc2bufWMB = new bufCtrlOutIO()
  })

  //instance SRAM
  val bankRam = Array.fill(16)(Array.fill(2)(Module(new RamSync(256, 512)).io))

  /***
    *
    *
    *   write logic
    *
    */
  val datWreq = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W)))))
  val wtWreq = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W)))))

  datWreq(io.cdma2bufDat.addr(11,8))(0) := io.cdma2bufDat.enable & io.cdma2bufDat.hsel(0)
  datWreq(io.cdma2bufDat.addr(11,8))(1) := io.cdma2bufDat.enable & io.cdma2bufDat.hsel(1)


  wtWreq(io.cdma2bufWt.addr(11,8))(0) := io.cdma2bufWt.enable & (!io.cdma2bufWt.hsel(0))
  wtWreq(io.cdma2bufWt.addr(11,8))(1) := io.cdma2bufWt.enable & io.cdma2bufWt.hsel(0)

  // input register
  val ramWreqd1 = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W))))))
  val ramp0Addrd1 = RegNext(io.cdma2bufDat.addr(7, 0))
  val ramp1Addrd1 = RegNext(io.cdma2bufWt.addr(7, 0))
  val ramp0DatLod1 = RegNext(io.cdma2bufDat.data(511, 0))
  val ramp0DatHid1 = RegNext(io.cdma2bufDat.data(1023, 512))
  val ramp1WtLod1 = RegNext(io.cdma2bufWt.data(511, 0))
  val ramp1WtHid1 = RegNext(io.cdma2bufWt.data(511, 0))

  for (i <- 0 until 16) {
    if (i == 0) {
      ramWreqd1(i) := datWreq(i)
    }
    else if (i == 15) {
      ramWreqd1(i) := wtWreq(i)
    }
    else {
      ramWreqd1(i)(0) := datWreq(i)(0) | wtWreq(i)(0)
      ramWreqd1(i)(1) := datWreq(i)(1) | wtWreq(i)(1)
    }
  }

  //  RAM interface
  val ramReq = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(520.W).asTypeOf(new ramReqB)))))
  for (i <- 0 until 16) {
    if (i == 0) {
      ramReq(i)(0).addr := Mux(ramWreqd1(i)(0) === 1.U, ramp0Addrd1, 0.U)
      ramReq(i)(1).addr := Mux(ramWreqd1(i)(1) === 1.U, ramp0Addrd1, 0.U)
      ramReq(i)(0).data := Mux(ramWreqd1(i)(0) === 1.U, ramp0DatLod1, 0.U)
      ramReq(i)(1).data := Mux(ramWreqd1(i)(1) === 1.U, ramp0DatHid1, 0.U)
    }
    else if (i == 15) {
      ramReq(i)(0).addr := Mux(ramWreqd1(i)(0) === 1.U, ramp1Addrd1, 0.U)
      ramReq(i)(1).addr := Mux(ramWreqd1(i)(1) === 1.U, ramp1Addrd1, 0.U)
      ramReq(i)(0).data := Mux(ramWreqd1(i)(0) === 1.U, ramp1WtLod1, 0.U)
      ramReq(i)(1).data := Mux(ramWreqd1(i)(1) === 1.U, ramp1WtHid1, 0.U)
    }
    else {
      ramReq(i)(0).addr := Mux(ramWreqd1(i)(0) === 1.U, ramp0Addrd1, 0.U) | Mux(ramWreqd1(i)(0) === 1.U, ramp1Addrd1, 0.U)
      ramReq(i)(1).addr := Mux(ramWreqd1(i)(1) === 1.U, ramp0Addrd1, 0.U) | Mux(ramWreqd1(i)(1) === 1.U, ramp1Addrd1, 0.U)
      ramReq(i)(0).data := Mux(ramWreqd1(i)(0) === 1.U, ramp0DatLod1, 0.U) | Mux(ramWreqd1(i)(0) === 1.U, ramp1WtLod1, 0.U)
      ramReq(i)(1).data := Mux(ramWreqd1(i)(1) === 1.U, ramp0DatHid1, 0.U) | Mux(ramWreqd1(i)(1) === 1.U, ramp1WtHid1, 0.U)
    }
  }

  // retiming
  val ramWreqd2 = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W))))))
  val ramReqd2 = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(520.W).asTypeOf(new ramReqB)))))

  ramWreqd2 := ramWreqd1
  ramReqd2 := ramReq


  /***
    *
    *   read logic
    *
    */
  val datRreq = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W)))))
  val wtRreq = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W)))))
  val wmbRreq = VecInit(Seq.fill(2)(io.sc2bufWMB.enable))

  datRreq(io.sc2bufDat.addr(11,8)) := VecInit(Seq.fill(2)(io.sc2bufDat.enable))
  datRreq(15) := VecInit(Seq.fill(2)(0.U(1.W)))

  wtRreq(io.sc2bufWt.addr(11,8)) := VecInit(Seq.fill(2)(io.sc2bufWt.enable))
  wtRreq(0) := VecInit(Seq.fill(2)(0.U(1.W)))


  // ram interface
  val ramRreq = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(1.W))))))
  val ramRaddr = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(8.W))))))

  for (i <- 0 until 16) {
    if (i == 0) {
      ramRreq(i) := datRreq(i)
    }
    else if (i == 15) {
      ramRreq(i)(0) := wtRreq(i)(0) | wmbRreq(0)
      ramRreq(i)(1) := wtRreq(i)(1) | wmbRreq(1)
    }
    else {
      ramRreq(i)(0) := datRreq(i)(0) | wtRreq(i)(0)
      ramRreq(i)(1) := datRreq(i)(1) | wtRreq(i)(1)
    }
  }

  for (i <- 0 until 16) {
    if (i == 0) {
      ramRaddr(i)(0) := Mux(datRreq(i)(0) === 1.U, io.sc2bufDat.addr, 0.U)
      ramRaddr(i)(1) := Mux(datRreq(i)(1) === 1.U, io.sc2bufDat.addr, 0.U)
    }
    else if (i == 15) {
      ramRaddr(i)(0) := Mux(wtRreq(i)(0) === 1.U, io.sc2bufWt.addr, 0.U) | Mux(wmbRreq(0) === 1.U, io.sc2bufWMB.addr, 0.U)
      ramRaddr(i)(1) := Mux(wtRreq(i)(1) === 1.U, io.sc2bufWt.addr, 0.U) | Mux(wmbRreq(1) === 1.U, io.sc2bufWMB.addr, 0.U)
    }
    else {
      ramRaddr(i)(0) := Mux(datRreq(i)(0) === 1.U, io.sc2bufDat.addr, 0.U) | Mux(wtRreq(i)(0) === 1.U, io.sc2bufWt.addr, 0.U)
      ramRaddr(i)(1) := Mux(datRreq(i)(1) === 1.U, io.sc2bufDat.addr, 0.U) | Mux(wtRreq(i)(1) === 1.U, io.sc2bufWt.addr, 0.U)
    }
  }

  // out register
  val datRreqd2 = ShiftRegister(datRreq, 2)
  val wtRreqd2 = ShiftRegister(wtRreq, 2)
  val wmbRreqd2 = ShiftRegister(wmbRreq, 2)

  val ramdout = VecInit(Seq.fill(16)(VecInit(Seq.fill(2)(0.U(512.W)))))
  val p0Datad3 = Wire(UInt(1024.W))
  val p0Validd3 = Wire(Bool())
  val p1Datad3 = Wire(UInt(1024.W))
  val p1Validd3 = Wire(Bool())
  val p2Datad3 = Wire(UInt(1024.W))
  val p2Validd3 = Wire(Bool())

  val p0enabled2 = ShiftRegister(io.sc2bufDat.enable, 2)
  val p1enabled2 = ShiftRegister(io.sc2bufWt.enable, 2)
  val p2enabled2 = ShiftRegister(io.sc2bufWMB.enable, 2)

  p0Datad3 := RegNext((0 until 15).map(i => Cat(Fill(512, datRreqd2(i)(1)), Fill(512, datRreqd2(i)(0))) & Cat(ramdout(i)(1), ramdout(i)(0))).reduce(_ | _))
  p0Validd3 := RegNext(p0enabled2)
  p1Datad3 := RegNext((1 until 16).map(i => Cat(Fill(512, wtRreqd2(i)(1)), Fill(512, wtRreqd2(i)(0))) & Cat(ramdout(i)(1), ramdout(i)(0))).reduce(_ | _))
  p1Validd3 := RegNext(p1enabled2)
  p2Datad3 := RegNext((15 until 16).map(i => Cat(Fill(512, wmbRreqd2(1)), Fill(512, wmbRreqd2(0))) & Cat(ramdout(i)(1), ramdout(i)(0))).reduce(_ | _))
  p2Validd3 := RegNext(p1enabled2)

  // for retiming
  val p0Datad6 = ShiftRegister(p0Datad3, 3)
  val p0Validd6 = ShiftRegister(p0Validd3, 3)
  val p1Datad6 = ShiftRegister(p1Datad3, 3)
  val p1Validd6 = ShiftRegister(p1Validd3, 3)
  val p2Datad6 = ShiftRegister(p2Datad3, 3)
  val p2Validd6 = ShiftRegister(p2Validd3, 3)

  // connect to RAM
  for (i <- 0 until 16) {
    for (j <- 0 until 2) {
      // read ports
      bankRam(i)(j).re := ramRreq(i)(j)
      bankRam(i)(j).ra := ramRaddr(i)(j)
      ramdout(i)(j) := bankRam(i)(j).dout
      // write ports
      bankRam(i)(j).we := ramWreqd2(i)(j)
      bankRam(i)(j).wa := ramReqd2(i)(j).addr
      bankRam(i)(j).di := ramReqd2(i)(j).data
      //bankRam(i)(j).pwrbus_ram_pd := io.pwrbus_ram_pd
    }
  }
  // connect tp output
  io.sc2bufDat.data := p0Datad6
  io.sc2bufDat.valid := p0Validd6
  io.sc2bufWt.data := p1Datad6
  io.sc2bufWt.valid := p1Validd6
  io.sc2bufWMB.data := p2Datad6
  io.sc2bufWMB.valid := p2Validd6
}

object elaborateCbuf extends App {
  chisel3.Driver.execute(args, () => new Cbuf())
}