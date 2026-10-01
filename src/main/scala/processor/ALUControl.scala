package processor

import chisel3._
import chisel3.util._

class ALUControlInputs extends Bundle {
  val ALUOp = Input(UInt(3.W))
}

class ALUControlOutputs extends Bundle {
  val alu_op = Output(UInt(5.W))
}

class ALUControl extends Module {
  val io = IO(new Bundle {
    val in = new ALUControlInputs()
    val out = new ALUControlOutputs()
    val func = Flipped(new InstrDecoder_ALUCtrl_Interface)
  })

  val pri_encoder = Module(new PriEncoder())

  pri_encoder.io.in(0) := (!io.in.ALUOp(2)) & io.in.ALUOp(1) & io.in.ALUOp(0)
  pri_encoder.io
    .in(1) := (!io.in.ALUOp(2)) & io.in.ALUOp(1) & (!(io.in.ALUOp(0)))
  pri_encoder.io
    .in(2) := (!io.in.ALUOp(2)) & (!io.in.ALUOp(1)) & (!(io.in
    .ALUOp(0))) & (!(io.func.func7))
  pri_encoder.io
    .in(3) := (!io.in.ALUOp(2)) & (!io.in.ALUOp(1)) & (!(io.in
    .ALUOp(0))) & (io.func.func7)
  pri_encoder.io.in(4) := (!io.in.ALUOp(2)) & (!io.in.ALUOp(1)) & (io.in.ALUOp(
    0
  )) & (!io.func.func7)
  pri_encoder.io
    .in(5) := (!io.in.ALUOp(2)) & (!(io.in.ALUOp(1))) & (io.in.ALUOp(
    0
  )) & (io.func.func7)
  pri_encoder.io.in(6) := (io.func.func7) & (pri_encoder.io
    .in(5)) & ((io.func.func3(0)) & (!io.func.func3(1)) & (io.func.func3(2)))
  pri_encoder.io.in(7) := (!pri_encoder.io
    .in(6)) & (!pri_encoder.io.in(0)) & (!pri_encoder.io.in(
    1
  )) & (!pri_encoder.io.in(2)) & (!pri_encoder.io.in(3)) & (!pri_encoder.io.in(
    4
  )) & (!pri_encoder.io.in(5))

  io.out.alu_op := MuxLookup(
    pri_encoder.io.out,
    false.B,
    Seq(
      (0.U) -> 31.U,
      (1.U) -> Cat(2.U, io.func.func3),
      (2.U) -> Cat(0.U, io.func.func3),
      (3.U) -> Cat(1.U, io.func.func3),
      (4.U) -> Cat(0.U, io.func.func3),
      (5.U) -> Cat(0.U, io.func.func3),
      (6.U) -> Cat(1.U, io.func.func3),
      (7.U) -> 0.U
    )
  )

}
