import processor._
import chisel3._
import chisel3.tester._
import chisel3.experimental.BundleLiterals._
import org.scalatest.FreeSpec

class CoreTest extends FreeSpec with ChiselScalatestTester {

  "Tesing Core" in {
    test(
      new Core(
        "/home/amirali671/Documents/A.Rehman/Shadow/src/test/resources/test.txt"
      )
    ) { dut =>
      dut.clock.step(100)
    }
  }
}
