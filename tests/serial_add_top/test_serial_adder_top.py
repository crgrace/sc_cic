import logging
import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, ClockCycles


class TB:
    def __init__(self, dut):
        dut._log.setLevel(logging.INFO)
        self.dut = dut
        cocotb.start_soon(Clock(dut.clk, 5, units="ns").start())

    async def reset(self):
        self.dut.rst_n.setimmediatevalue(0)
        await ClockCycles(self.dut.clk, 2)
        self.dut.rst_n.value = 1
        await RisingEdge(self.dut.clk)

    async def test_serial_adder(self, num_trails=10):
        max = 1 << self.dut.WORDWIDTH.value
        for ix in range(num_trails):
            a = random.randint(0, max)
            b = random.randint(0, max)
            div, mod = divmod((a + b), max)
            self.dut.a_in.value = a
            self.dut.b_in.value = b
            await RisingEdge(self.dut.done)
            await ClockCycles(self.dut.clk, 2)
            assert self.dut.out.value == mod, \
                f"Test failed with a={a}, b={b}, out={self.dut.out.value}"
            assert self.dut.cout.value == div, \
                f"Test failed with a={a}, b={b}, cout={self.dut.cout.value}"


@cocotb.test(timeout_time=1, timeout_unit='us')
async def test_serial_adder(dut):
    tb = TB(dut)

    await tb.reset()
    await tb.test_serial_adder(4)
