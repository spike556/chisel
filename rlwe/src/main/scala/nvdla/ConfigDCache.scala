
package nvdla

import chisel3.util._

object ConfigDCache {
  // Cache param
  val nSet = 256
  val nWay = 4
  val nByte = 16
  val nBit = nByte * 8
  val setWidth = log2Ceil(nSet)
  val wayWidth = log2Ceil(nWay)
  val byteWidth = log2Ceil(nByte)
  // CPU param
  val AWIDTH = 32
  val DWIDTH = 32
  val bytePerData = AWIDTH / 8
  val dataPerLine = nBit / AWIDTH
  val bytePerDataWidth = log2Ceil(AWIDTH / 8)
  val dataPerLineWidth = log2Ceil(nBit / AWIDTH)
}
