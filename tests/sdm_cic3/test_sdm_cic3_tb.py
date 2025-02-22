import logging
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


class TB:
    def __init__(self, dut):
        dut._log.setLevel(logging.INFO)
        self.dut = dut
        cocotb.start_soon(Clock(dut.clk, 5, units="ns").start())


@cocotb.test(timeout_time=100, timeout_unit='us')
async def test_sdm_cic3_tb(dut):
    tb = TB(dut)

    await RisingEdge(tb.dut.clk)
