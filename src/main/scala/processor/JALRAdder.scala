package processor

import chisel3._

class JALRAdder extends Module {
  val io = IO(new Bundle {
    val read_data_1 = Input(SInt(32.W))
    val jalr = Input(SInt(32.W))
    val computed_addr = Output(SInt(32.W))
  })
  io.computed_addr := (io.read_data_1 + io.jalr) & (0xfffffffe.S)
}
