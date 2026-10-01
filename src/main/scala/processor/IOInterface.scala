package processor

import chisel3._

class InstrDecoder_RegFile_interface extends Bundle {
  val reg_src_a = Output(UInt(5.W))
  val reg_src_b = Output(UInt(5.W))
  val reg_dest = Output(UInt(5.W))
}

class InstrDecoder_ALUCtrl_Interface extends Bundle {
  val func3 = Output(UInt(3.W))
  val func7 = Output(Bool())
}

class TypeCtrl_SignalCtrl_Interface extends Bundle {
  val r_type = Output(Bool())
  val i_type = Output(Bool())
  val load_type = Output(Bool())
  val s_type = Output(Bool())
  val sb_type = Output(Bool())
  val uj_type = Output(Bool())
  val jalr_type = Output(Bool())
  val lui_type = Output(Bool())
  val auipc_type = Output(Bool())
}

class SignalCtrl_Ctrl_Interface extends Bundle {
  val reg_write = Output(Bool())
  val mem_write = Output(Bool())
  val mem_read = Output(Bool())
  val mem_to_reg = Output(Bool())
  val branch = Output(Bool())
  val operand_a = Output(UInt(2.W))
  val operand_b = Output(Bool())
  val extend_sel = Output(UInt(2.W))
  val next_pc = Output(UInt(2.W))
  val alu_op = Output(UInt(3.W))
}
