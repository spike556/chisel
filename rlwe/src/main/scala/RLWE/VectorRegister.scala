
package RLWE

import chisel3._

// behavior model
// use SRAM to implement it
class VectorRegisterIO extends Bundle
  with HasCommonParameters {
  val vectorReadAddr1 = Input(UInt(5.W))
  val vectorReadAddr2 = Input(UInt(5.W))
  val vectorWriteAddr = Input(UInt(5.W))
  val vectorWriteData = Input(Vec(ML, UInt(DataWidth.W)))
  val vectorWriteEnable = Input(Bool())
  val vectorReadValue1 = Output(Vec(ML, UInt(DataWidth.W)))
  val vectorReadValue2 = Output(Vec(ML, UInt(DataWidth.W)))
}

class VectorRegister extends Module
  with HasCommonParameters {
  val io = IO(new VectorRegisterIO)

  val vectorSRAM = SyncReadMem(32, UInt((ML * DataWidth).W))

  // Create one write port and two read port.
  when (io.vectorWriteEnable) {
    vectorSRAM.write(io.vectorWriteAddr, io.vectorWriteData.asUInt())
  }

  for (i <- 0 until ML) {
    io.vectorReadValue1(i) := vectorSRAM.read(io.vectorReadAddr1, true.B)(DataWidth * i + DataWidth - 1, DataWidth * i)
    io.vectorReadValue2(i) := vectorSRAM.read(io.vectorReadAddr2, true.B)(DataWidth * i + DataWidth - 1, DataWidth * i)
  }
}

object elaborateVectorRegister extends App {
  chisel3.Driver.execute(args, () => new VectorRegister())
}