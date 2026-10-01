package processor

import chisel3._
import chisel3.util._
import AluOp._

class ALU extends Module {
  val io = IO(new Bundle {
    val operand_a = Input(SInt(32.W))
    val operand_b = Input(SInt(32.W))
    val alu_op = Input(UInt(5.W))
    val data = Output(SInt(32.W))
    val branch = Output(Bool())
  })

  val br_module = Module(new Branch)

  io.data := 0.S

  switch(io.alu_op) {
    is(ALU_ADD) {
      io.data := io.operand_a + io.operand_b
    }
    is(ALU_SLL) {
      io.data := (io.operand_a << ((io.operand_b(4, 0).asUInt).asUInt)).asSInt
    }
    is(ALU_SLT, ALU_BLT) {
      io.data := (io.operand_a < io.operand_b).asSInt & 0x01.S
    }
    is(ALU_SLTU, ALU_BLTU) {
      io.data := (io.operand_a.asUInt < io.operand_b.asUInt).asSInt & 0x01.S
    }
    is(ALU_XOR) {
      io.data := io.operand_a ^ io.operand_b
    }
    is(ALU_SRL) {
      io.data := (io.operand_a.asUInt >> (io
        .operand_b(4, 0)
        .asUInt)
        .asUInt).asSInt
    }
    is(ALU_OR) {
      io.data := io.operand_a | io.operand_b
    }
    is(ALU_AND) {
      io.data := io.operand_a & io.operand_b
    }
    is(ALU_SUB) {
      io.data := io.operand_a - io.operand_b
    }
    is(ALU_SRA) {
      io.data := (io.operand_a >> (io.operand_b(4, 0).asUInt)).asSInt
    }
    is(ALU_BEQ) {
      io.data := (io.operand_a === io.operand_b).asSInt & 0x01.S
    }
    is(ALU_BNE) {
      io.data := (!(io.operand_a === io.operand_b)).asSInt & 0x01.S
    }
    is(ALU_BGE) {
      io.data := (io.operand_a >= io.operand_b).asSInt & 0x01.S
    }
    is(ALU_BGEU) {
      io.data := (io.operand_a.asUInt >= io.operand_b.asUInt).asSInt & 0x01.S
    }
    is(ALU_COPY_A) {
      io.data := io.operand_a
    }
  }

  br_module.io.alu_result := io.data
  br_module.io.alu_op := io.alu_op
  io.branch := br_module.io.br_taken

}
