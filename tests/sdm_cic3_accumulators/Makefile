DUT      = sdm_cic3_accumulators_tb
TOPLEVEL = $(DUT)
MODULE   = test_$(DUT)
VERILOG_SOURCES += $(TB_DIR)/$(DUT).sv
VERILOG_SOURCES += $(SRC_DIR)/cic3_accumulators.sv
VERILOG_SOURCES += $(SRC_DIR)/cic3_differentiators.sv
VERILOG_SOURCES += $(SRC_DIR)/sine_wave.sv
VERILOG_SOURCES += $(SRC_DIR)/sdm_rnm.sv

export PARAM_DECIMATION_FACTOR := 256

include ../cocotb_inc.mk