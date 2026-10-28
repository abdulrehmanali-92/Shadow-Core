import processor._
import chisel3._
import chisel3.tester._
import chisel3.experimental.BundleLiterals._
import org.scalatest.FreeSpec

class PipelineTest extends FreeSpec with ChiselScalatestTester {
  "Testing SW and LW" in {
    test(
      new Pipelining(
        "src/test/resources/test_sw_lw.txt"
      )
    ) { dut =>
      for (cycle <- 0 until 40) {
        val pc = dut.io.debug_pc.peek().litValue
        val x1 = dut.io.debug_regs(1).peek().litValue
        val x2 = dut.io.debug_regs(2).peek().litValue
        println(f"SW_LW Cycle $cycle%2d | PC: 0x$pc%04x | x1: $x1, x2: $x2")
        dut.clock.step(1)
      }
    }
  }

  "Testing Branch" in {
    test(
      new Pipelining(
        "src/test/resources/test_branch.txt"
      )
    ) { dut =>
      for (cycle <- 0 until 40) {
        val pc = dut.io.debug_pc.peek().litValue
        val x3 = dut.io.debug_regs(3).peek().litValue
        val x4 = dut.io.debug_regs(4).peek().litValue
        println(f"BRANCH Cycle $cycle%2d | PC: 0x$pc%04x | x3: $x3, x4: $x4")
        dut.clock.step(1)
      }
    }
  }
}
