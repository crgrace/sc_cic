///////////////////////////////////////////////////////////////////
// File Name: cic3_differentiators.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: differentiators for cascaded integrator comb filter (CIC)
//          Use in testbench to verify operation of cic3_no_diff
///////////////////////////////////////////////////////////////////


module cic3_differentiators
    #(parameter DECIMATION_FACTOR = 256, // default D = 256
    parameter CLOCK_WIDTH = $clog2(DECIMATION_FACTOR),
    parameter NUMBITS = 3*CLOCK_WIDTH+1)
    (output logic [NUMBITS-1:0] out, // filtered output
    input logic [NUMBITS-1:0] in, // downsampled output from accumulators
    input logic divided_clk, // divided down modulator clk
    input logic reset_n); // asynchronous digital reset (active low)

logic [NUMBITS-1:0] in_d;
logic [NUMBITS-1:0] diff1;
logic [NUMBITS-1:0] diff2;
logic [NUMBITS-1:0] diff3;
logic [NUMBITS-1:0] diff1_d;
logic [NUMBITS-1:0] diff2_d;
logic divided_clk;

// differentiators
always_ff @ (negedge divided_clk or negedge reset_n) begin 
    if(!reset_n) begin
        in_d <= 'b0; 
        diff1_d <= 'b0; 
        diff2_d <= 'b0; 
        diff1 <= 'b0; 
        diff2 <= 'b0; 
        diff3 <= 'b0;
    end 
    else begin 
        diff1 <= in - in_d; 
        diff2 <= diff1 - diff1_d; 
        diff3 <= diff2 - diff2_d; 
        in_d <= in; // accumulation done in another module 
        diff1_d <= diff1; 
        diff2_d <= diff2; 
    end
end // always_ff

/* Clock the CIC3 output into the output register */
always_ff @ (posedge divided_clk)  
    out <= diff3;

endmodule

