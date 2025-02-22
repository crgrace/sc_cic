SRC_DIR = ../src
INC_DIR = ./tasks

# Compiler and flags
IVERILOG = iverilog
IVERILOG_FLAGS = -g2012 -I$(INC_DIR) -Wall -Wno-timescale

# VVP runtime
VVP = vvp

MODULE_TB = serial_adder_top_tb

# Source files
SRC  = $(SRC_DIR)/cic3.sv
SRC += $(SRC_DIR)/sdm_rnm.sv
SRC += $(SRC_DIR)/sine_wave.sv
SRC += $(SRC_DIR)/serial_adder_top.sv
SRC += $(SRC_DIR)/serial_adder_shiftreg.sv
SRC += $(MODULE_TB).sv

# Output files
VVP_FILE = $(MODULE_TB).vvp
VCD_FILE = $(MODULE_TB).vcd

# Default target
all: compile run

# Compile the design and testbench
compile: $(SRC)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(VVP_FILE) $(SRC)

# Run the simulation
run: $(VVP_FILE)
	$(VVP) -N $(VVP_FILE)

# View the waveform (assumes GTKWave is installed)
view: $(VCD_FILE)
	gtkwave $(VCD_FILE)

# Clean up generated files
clean:
	rm -f $(VVP_FILE) $(VCD_FILE)

# Phony targets
.PHONY: all compile run view clean
