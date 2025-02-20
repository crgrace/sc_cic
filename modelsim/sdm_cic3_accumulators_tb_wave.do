onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 84 -max 0.89999999993797697 -min -0.89999999999310853 /sdm_cic3_accumulators_tb/sine_input
add wave -noupdate /sdm_cic3_accumulators_tb/modulator_out
add wave -noupdate /sdm_cic3_accumulators_tb/clk
add wave -noupdate /sdm_cic3_accumulators_tb/reset_n
add wave -noupdate /sdm_cic3_accumulators_tb/divided_clk
add wave -noupdate -format Analog-Step -height 84 -max 15943271.0 /sdm_cic3_accumulators_tb/cic_out
add wave -noupdate /sdm_cic3_accumulators_tb/acc_out
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/sine_out
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/pi
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/time_us
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/time_s
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/sampling_clock
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/freq
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/offset
add wave -noupdate /sdm_cic3_accumulators_tb/sine_wave/ampl
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/dout
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/analog_in
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/clk
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/reset_n
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/sdm_sign_val
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/sdm_sum1
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/sdm_sum2
add wave -noupdate /sdm_cic3_accumulators_tb/sdm_rdm/test
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/out
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/divided_clk
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/in
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/clk
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/reset_n
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/in_coded
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/acc1
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/acc2
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_accumulators/acc3
add wave -noupdate -radix unsigned -childformat {{{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[7]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[6]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[5]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[4]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[3]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[2]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[1]} -radix unsigned} {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[0]} -radix unsigned}} -expand -subitemconfig {{/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[7]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[6]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[5]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[4]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[3]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[2]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[1]} {-height 17 -radix unsigned} {/sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter[0]} {-height 17 -radix unsigned}} /sdm_cic3_accumulators_tb/cic3_accumulators/clock_counter
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/out
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/in
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/divided_clk
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/reset_n
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/in_d
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/diff1
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/diff2
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/diff3
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/diff1_d
add wave -noupdate /sdm_cic3_accumulators_tb/cic3_differentiators/diff2_d
add wave -noupdate /math_pkg::cos/cos
add wave -noupdate /math_pkg::cos/rTheta
add wave -noupdate /math_pkg::sin/sin
add wave -noupdate /math_pkg::sin/rTheta
add wave -noupdate /math_pkg::log/log
add wave -noupdate /math_pkg::log/rVal
add wave -noupdate /math_pkg::log10/log10
add wave -noupdate /math_pkg::log10/rVal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2198820000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 334
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {26250 us}
