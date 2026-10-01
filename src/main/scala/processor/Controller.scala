package processor

import chisel3._

class Controller extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))
    val out = new SignalCtrl_Ctrl_Interface

  })

  val signal_ctrl = Module(new SignalController())
  val type_ctrl = Module(new TypeController())

  io.opcode <> type_ctrl.io.opcode
  signal_ctrl.io.in <> type_ctrl.io.out
  io.out <> signal_ctrl.io.out

}
