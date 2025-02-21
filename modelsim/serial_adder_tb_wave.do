onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /serial_adder_top_tb/clk
add wave -noupdate /serial_adder_top_tb/rst_n
add wave -noupdate -radix unsigned /serial_adder_top_tb/a
add wave -noupdate -radix unsigned /serial_adder_top_tb/b
add wave -noupdate -radix unsigned /serial_adder_top_tb/sum_reg
add wave -noupdate /serial_adder_top_tb/carry_out
add wave -noupdate /serial_adder_top_tb/done
add wave -noupdate /serial_adder_top_tb/NumTrials
add wave -noupdate /serial_adder_top_tb/testSerialAdder/NumTrials
add wave -noupdate /serial_adder_top_tb/testSerialAdder/debug
add wave -noupdate /serial_adder_top_tb/testSerialAdder/expectedOut
add wave -noupdate /serial_adder_top_tb/testSerialAdder/errors
add wave -noupdate /serial_adder_top_tb/testSerialAdder/expectedOutTrimmed
add wave -noupdate /serial_adder_top_tb/testSerialAdder/expectedCarryOut
add wave -noupdate /serial_adder_top_tb/serial_adder_top/out
add wave -noupdate /serial_adder_top_tb/serial_adder_top/done
add wave -noupdate /serial_adder_top_tb/serial_adder_top/cout
add wave -noupdate /serial_adder_top_tb/serial_adder_top/a_in
add wave -noupdate /serial_adder_top_tb/serial_adder_top/b_in
add wave -noupdate /serial_adder_top_tb/serial_adder_top/clk
add wave -noupdate /serial_adder_top_tb/serial_adder_top/rst_n
add wave -noupdate /serial_adder_top_tb/serial_adder_top/counter
add wave -noupdate /serial_adder_top_tb/serial_adder_top/sum_sr
add wave -noupdate /serial_adder_top_tb/serial_adder_top/load
add wave -noupdate /serial_adder_top_tb/serial_adder_top/bit_a
add wave -noupdate /serial_adder_top_tb/serial_adder_top/bit_b
add wave -noupdate /serial_adder_top_tb/serial_adder_top/cout_temp
add wave -noupdate /serial_adder_top_tb/serial_adder_top/cin
add wave -noupdate /serial_adder_top_tb/serial_adder_top/sum
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/out
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/data_in
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/load
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/clk
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/rst_n
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_a/memory
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/out
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/data_in
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/load
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/clk
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/rst_n
add wave -noupdate /serial_adder_top_tb/serial_adder_top/shift_reg_b/memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 581
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {837 ns}
