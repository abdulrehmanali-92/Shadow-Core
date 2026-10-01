package processor

import chisel3._

class IDOutputs extends Bundle {}

class InstrDecoder extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(32.W))
    val opcode = Output(UInt(7.W))
    val rf_out = new InstrDecoder_RegFile_interface
    val ac_out = new InstrDecoder_ALUCtrl_Interface
  })

  io.opcode := io.instr(6, 0)
  io.rf_out.reg_dest := io.instr(11, 7)
  io.ac_out.func3 := io.instr(14, 12)
  io.rf_out.reg_src_a := io.instr(19, 15)
  io.rf_out.reg_src_b := io.instr(24, 20)
  io.ac_out.func7 := io.instr(30)
}
