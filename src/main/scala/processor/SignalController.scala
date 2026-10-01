package processor

import chisel3._
import chisel3.util._

class Sel3To2_IO extends Bundle {
  val in = Input(Vec(3, (Bool())))
  val out = Output(UInt(2.W))
}

class AluOpSel_IO extends Bundle {
  val in = Flipped(new TypeCtrl_SignalCtrl_Interface)
  val alu_op = Output(Vec(3, (Bool())))
}

class SignalController extends Module {
  val io = IO(new Bundle {
    val in = Flipped(new TypeCtrl_SignalCtrl_Interface)
    val out = new SignalCtrl_Ctrl_Interface
  })

  val op_a_selector = Module(new Selector3To2())
  val imm_extend_selector = Module(new Selector3To2())
  val next_pc_selector = Module(new Selector3To2())
  val alu_op_selector = Module(new AluOpSelector())

  io.out.reg_write := io.in.i_type | io.in.r_type | io.in.load_type | io.in.lui_type | io.in.uj_type | io.in.jalr_type
  io.out.mem_write := io.in.s_type
  io.out.mem_read := io.in.load_type
  io.out.mem_to_reg := io.in.load_type
  io.out.branch := io.in.sb_type
  op_a_selector.io.in(0) := io.in.auipc_type
  op_a_selector.io.in(1) := io.in.uj_type | io.in.jalr_type
  op_a_selector.io.in(2) := io.in.lui_type
  io.out.operand_a := op_a_selector.io.out
  io.out.operand_b := io.in.i_type | io.in.load_type | io.in.lui_type | io.in.auipc_type | io.in.s_type
  imm_extend_selector.io.in(0) := io.in.s_type
  imm_extend_selector.io.in(1) := io.in.lui_type | io.in.auipc_type
  imm_extend_selector.io.in(2) := 0.B
  io.out.extend_sel := imm_extend_selector.io.out
  next_pc_selector.io.in(0) := io.in.uj_type
  next_pc_selector.io.in(1) := io.in.jalr_type
  next_pc_selector.io.in(2) := io.in.sb_type
  io.out.next_pc := next_pc_selector.io.out
  alu_op_selector.io.in.r_type := io.in.r_type
  alu_op_selector.io.in.i_type := io.in.i_type
  alu_op_selector.io.in.load_type := io.in.load_type
  alu_op_selector.io.in.s_type := io.in.s_type
  alu_op_selector.io.in.sb_type := io.in.sb_type
  alu_op_selector.io.in.uj_type := io.in.uj_type
  alu_op_selector.io.in.jalr_type := io.in.jalr_type
  alu_op_selector.io.in.lui_type := io.in.lui_type
  alu_op_selector.io.in.auipc_type := io.in.auipc_type
  io.out.alu_op := Cat(
    alu_op_selector.io.alu_op(2),
    alu_op_selector.io.alu_op(1),
    alu_op_selector.io.alu_op(0)
  )

}

class Selector3To2 extends Module {
  val io = IO(new Sel3To2_IO)

  io.out := Cat((io.in(2) | io.in(1)), (io.in(0) | io.in(2)))

}

class AluOpSelector extends Module {
  val io = IO(new AluOpSel_IO)

  io.alu_op(
    0
  ) := (!(io.in.r_type)) & (!(io.in.sb_type)) & (!(io.in.lui_type)) & (!(io.in.load_type))
  io.alu_op(
    1
  ) := (!(io.in.r_type)) & (!(io.in.i_type)) & (!(io.in.s_type)) & (!(io.in.load_type))
  io.alu_op(
    2
  ) := (!(io.in.r_type)) & (!(io.in.i_type)) & (!(io.in.sb_type)) & (!(io.in.uj_type)) & (!(io.in.jalr_type))

}
