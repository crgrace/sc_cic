#
# Create work library
#
vlib work

#
# Map libraries
#
vmap work  

#
# Design sources
#
vlog -incr -sv "../src/cic3.sv" 
vlog -incr -sv "../src/cic3_accumulators.sv" 
vlog -incr -sv "../src/cic3_differentiators.sv" 
vlog -incr -sv "../src/sine_wave.sv" 
vlog -incr -sv "../src/sdm_rnm.sv" 
#vlog -incr -sv "../src/serial_adder_datapath.sv" 
#vlog -incr -sv "../src/serial_adder_control.sv" 
vlog -incr -sv "../src/serial_adder_top.sv" 
vlog -incr -sv "../src/serial_adder_shiftreg.sv"

# Testbenches
#
vlog +incdir+../testbench/tasks/ -incr -sv "../testbench/sdm_cic3_tb.sv" 
vlog +incdir+../testbench/tasks/ -incr -sv "../testbench/sdm_cic3_accumulators_tb.sv" 
vlog +incdir+../testbench/tasks/ -incr -sv "../testbench/cic3_tb.sv" 
vlog +incdir+../testbench/tasks/ -incr -sv "../testbench/serial_adder_top_tb.sv" 


