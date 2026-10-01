package processor

import chisel3._
import chisel3.util.log2Ceil

class DataMemInputs extends Bundle {
  val data_in = Input(SInt(32.W))
  val addr = Input(UInt(log2Ceil(32).W))
  val mem_read = Input(Bool())
  val mem_write = Input(Bool())
}

class DataMem extends Module {
  val io = IO(new Bundle {
    val in = new DataMemInputs
    val data = Output(SInt(32.W))
  })

  val DataMem = Mem(32, SInt(32.W))

  when(io.in.mem_write) {
    DataMem.write(io.in.addr, io.in.data_in)
  }.elsewhen(io.in.mem_read) {
    io.data := DataMem.read(io.in.addr)
  }

  io.data := DontCare

}
