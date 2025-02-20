`timescale 1ns/10ps

module sdm_cic3_tb();


real sine_input;

// local signals

logic modulator_out;
logic clk;
logic reset_n;
logic [24:0] cic_out;

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

    
cic3
    cic3 (
        .out        (cic_out),
        .in         (modulator_out),
        .clk        (clk),
        .reset_n    (reset_n)
    );


endmodule

