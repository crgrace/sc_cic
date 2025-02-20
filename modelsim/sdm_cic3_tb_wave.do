onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sdm_cic3_tb/sine_input
add wave -noupdate /sdm_cic3_tb/modulator_out
add wave -noupdate /sdm_cic3_tb/clk
add wave -noupdate /sdm_cic3_tb/reset_n
add wave -noupdate /sdm_cic3_tb/cic_out
add wave -noupdate /sdm_cic3_tb/sine_wave/sine_out
add wave -noupdate /sdm_cic3_tb/sine_wave/pi
add wave -noupdate /sdm_cic3_tb/sine_wave/time_us
add wave -noupdate /sdm_cic3_tb/sine_wave/time_s
add wave -noupdate /sdm_cic3_tb/sine_wave/sampling_clock
add wave -noupdate /sdm_cic3_tb/sine_wave/freq
add wave -noupdate /sdm_cic3_tb/sine_wave/offset
add wave -noupdate /sdm_cic3_tb/sine_wave/ampl
add wave -noupdate /sdm_cic3_tb/sdm_rdm/dout
add wave -noupdate /sdm_cic3_tb/sdm_rdm/analog_in
add wave -noupdate /sdm_cic3_tb/sdm_rdm/clk
add wave -noupdate /sdm_cic3_tb/sdm_rdm/reset_n
add wave -noupdate /sdm_cic3_tb/sdm_rdm/sdm_sign_val
add wave -noupdate /sdm_cic3_tb/sdm_rdm/sdm_sum1
add wave -noupdate /sdm_cic3_tb/sdm_rdm/sdm_sum2
add wave -noupdate /sdm_cic3_tb/sdm_rdm/test
add wave -noupdate /sdm_cic3_tb/cic3/out
add wave -noupdate /sdm_cic3_tb/cic3/in
add wave -noupdate /sdm_cic3_tb/cic3/clk
add wave -noupdate /sdm_cic3_tb/cic3/reset_n
add wave -noupdate /sdm_cic3_tb/cic3/in_coded
add wave -noupdate /sdm_cic3_tb/cic3/acc1
add wave -noupdate /sdm_cic3_tb/cic3/acc2
add wave -noupdate /sdm_cic3_tb/cic3/acc3
add wave -noupdate /sdm_cic3_tb/cic3/acc3_d
add wave -noupdate /sdm_cic3_tb/cic3/diff1
add wave -noupdate /sdm_cic3_tb/cic3/diff2
add wave -noupdate /sdm_cic3_tb/cic3/diff3
add wave -noupdate /sdm_cic3_tb/cic3/diff1_d
add wave -noupdate /sdm_cic3_tb/cic3/diff2_d
add wave -noupdate /sdm_cic3_tb/cic3/clock_counter
add wave -noupdate /sdm_cic3_tb/cic3/divided_clk
add wave -noupdate /math_pkg::cos/cos
add wave -noupdate /math_pkg::cos/rTheta
add wave -noupdate /math_pkg::sin/sin
add wave -noupdate /math_pkg::sin/rTheta
add wave -noupdate /math_pkg::log/log
add wave -noupdate /math_pkg::log/rVal
add wave -noupdate /math_pkg::log10/log10
add wave -noupdate /math_pkg::log10/rVal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 502
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
WaveRestoreZoom {24999646500 ps} {24999969030 ps}
