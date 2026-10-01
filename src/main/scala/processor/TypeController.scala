package processor

import chisel3._
import chisel3.util._
import Opcode._

class TypeController extends Module {

  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))
    val out = new TypeCtrl_SignalCtrl_Interface

  })

  io.out.r_type := 0.B
  io.out.i_type := 0.B
  io.out.load_type := 0.B
  io.out.s_type := 0.B
  io.out.sb_type := 0.B
  io.out.uj_type := 0.B
  io.out.jalr_type := 0.B
  io.out.lui_type := 0.B
  io.out.auipc_type := 0.B

  switch(io.opcode) {
    is(R) {
      //   io.inst_type(0) := 1.B
      io.out.r_type := 1.B
    }
    is(I) {
      //   io.inst_type(1) := 1.B
      io.out.i_type := 1.B
    }
    is(LOAD) {
      //   io.inst_type(2) := 1.B
      io.out.load_type := 1.B
    }
    is(S) {
      //   io.inst_type(3) := 1.B
      io.out.s_type := 1.B
    }
    is(SB) {
      //   io.inst_type(4) := 1.B
      io.out.sb_type := 1.B
    }
    is(UJ) {
      //   io.inst_type(5) := 1.B
      io.out.uj_type := 1.B
    }
    is(JALR) {
      //   io.inst_type(6) := 1.B
      io.out.jalr_type := 1.B
    }
    is(LUI) {
      //   io.inst_type(7) := 1.B
      io.out.lui_type := 1.B
    }
    is(AUIPC) {
      //   io.inst_type(8) := 1.B
      io.out.auipc_type := 1.B
    }
  }

}
