import processor._
import chisel3._
import chisel3.tester._
import chisel3.experimental.BundleLiterals._
import org.scalatest.FreeSpec

class PipelineTest extends FreeSpec with ChiselScalatestTester {
  "Testing Pipelining" in {
    test(
      new Pipelining(
        "src/test/resources/test.txt"
      )
    ) { dut =>
      dut.clock.step(20)

    }
  }
}
