import logging
import cocotb
import numpy as np
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
            a, b = np.random.randint(0, max, size=2)
            div, mod = divmod((a + b), max)
            self.dut.a_in.value = int(a)
            self.dut.b_in.value = int(b)
            await RisingEdge(self.dut.done)  # load the values
            await RisingEdge(self.dut.done)  # wait for the result
            assert self.dut.out.value.integer == mod, \
                f"Failed sum: a={a}, b={b}, expect={mod}"
            assert self.dut.cout.value.integer == div, \
                f"Failed carry: a={a}, b={b}, expect={div}"


@cocotb.test(timeout_time=100, timeout_unit='us')
async def test_serial_adder(dut):
    tb = TB(dut)

    await tb.reset()
    await tb.test_serial_adder(400)
