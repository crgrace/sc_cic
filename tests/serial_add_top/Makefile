DUT      = serial_adder_top
TOPLEVEL = $(DUT)
MODULE   = test_$(DUT)
VERILOG_SOURCES += $(SRC_DIR)/$(DUT).sv
VERILOG_SOURCES += $(SRC_DIR)/cic3.sv
VERILOG_SOURCES += $(SRC_DIR)/sdm_rnm.sv
VERILOG_SOURCES += $(SRC_DIR)/sine_wave.sv
VERILOG_SOURCES += $(SRC_DIR)/serial_adder_shiftreg.sv

export PARAM_WORDWIDTH := 8

include ../cocotb_inc.mk