package processor

import chisel3._

class Branch extends Module {
  val io = IO(new Bundle {
    val alu_result = Input(SInt(32.W))
    val alu_op = Input(UInt(5.W))
    val br_taken = Output(Bool())
  })

  io.br_taken := (io.alu_result(0)) & Mux((io.alu_op(4, 3) === 2.U), 1.B, 0.B)
}
