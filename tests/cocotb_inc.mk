CURR_DIR  := $(dir $(lastword $(MAKEFILE_LIST)))
SRC_DIR	  := $(CURR_DIR)../src
TB_DIR    := $(CURR_DIR)../testbench

TOPLEVEL_LANG = verilog

SIM ?= icarus
WAVES ?= 0

COCOTB_HDL_TIMEUNIT = 1ns
COCOTB_HDL_TIMEPRECISION = 1ns

ifeq ($(SIM), icarus)
	COMPILE_ARGS += -Wall -Wno-timescale
	COMPILE_ARGS += $(foreach v,$(filter PARAM_%,$(.VARIABLES)),-P $(TOPLEVEL).$(subst PARAM_,,$(v))=$($(v)))
else ifeq ($(SIM), verilator)
	COMPILE_ARGS += --timing
# to avoid warning on 1-bit signal in counter
	EXTRA_ARGS += -Wno-width
# to avoid warning on unconnected output pins
	EXTRA_ARGS += -Wno-pinmissing
	COMPILE_ARGS += $(foreach v,$(filter PARAM_%,$(.VARIABLES)),-G$(subst PARAM_,,$(v))=$($(v)))
	ifeq ($(WAVES), 1)
		EXTRA_ARGS += --trace --trace-fst --trace-structs
	endif
endif

include $(shell cocotb-config --makefiles)/Makefile.sim

clean::
	rm -f results.xml
	rm -rf __pycache__