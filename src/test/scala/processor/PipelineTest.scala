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
      dut.io.out.expect(BigInt("45359344638887013482758144").U)
      dut.clock.step(1)

    }
  }
}
