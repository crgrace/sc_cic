# compile source
do {compile_src.do}


# run vsim
vsim -voptargs=+acc -sv_seed random serial_adder_top_tb

#
# Source wave do file
#
do {serial_adder_tb_wave.do}

#
# Set the window types
#
view wave
view structure
view signals

#
# End
#
