`timescale 1ns/10ps

module sdm_cic3_accumulators_tb();

parameter DECIMATION_FACTOR = 256;    
parameter CLOCK_WIDTH = $clog2(DECIMATION_FACTOR);
parameter NUMBITS = (3*CLOCK_WIDTH)+1;

real sine_input;

// local signals

logic modulator_out;
logic clk;
logic reset_n;
logic divided_clk;
logic [NUMBITS-1:0] cic_out;
logic [NUMBITS-1:0] acc_out;

// clock
always #10 clk = ~clk; // 50Mhz


initial begin
    clk = 0;
    reset_n = 0;
    #1000 reset_n = 1;

end // initial


sine_wave
    sine_wave (
        .sine_out   (sine_input)
    );

sdm_rnm
    sdm_rdm (
        .analog_in  (sine_input),
        .clk        (clk),
        .reset_n    (reset_n),
        .dout       (modulator_out)
        );
 
cic3_accumulators
    #(.DECIMATION_FACTOR(DECIMATION_FACTOR))
    cic3_accumulators (
        .out            (acc_out),
        .divided_clk    (divided_clk),
        .in             (modulator_out),
        .clk            (clk),
        .reset_n        (reset_n)
    );

cic3_differentiators
    #(.DECIMATION_FACTOR(DECIMATION_FACTOR))
    cic3_differentiators (
        .out            (cic_out),
        .in             (acc_out),
        .divided_clk    (divided_clk),
        .reset_n        (reset_n)
    );

endmodule

