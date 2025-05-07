///////////////////////////////////////////////////////////////////
// File Name: cic3_accumulators.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: cascaded integrator comb filter (CIC) w/o differentiators
//          The output is downsampled but must be filtered off-chip.
//          Processes filter sigma-delta modulator output
//          Need the following number of internal bits:
//          W = Nlog2(D)+1
//          N = filter order (3 here)
//          D = decimation factor (256 by default)
//          so W = 3*(8)+1 = 25. 
//          divide ratio is 256 (need 25 bits minimum internally)
//          based on sample code provided by ADI in AD7401 datasheet
//
//          D     N    W   (for 3rd order CIC)
//          ----------------------------------
//          32    5    17
//          64    6    19
//          128   7    22
//          256   8    25
///////////////////////////////////////////////////////////////////


module cic3_accumulators
    #(parameter DECIMATION_FACTOR = 256, // default D = 256
    parameter CLOCK_WIDTH = $clog2(DECIMATION_FACTOR),
    parameter NUMBITS = 3*CLOCK_WIDTH+1)
    (output logic [NUMBITS-1:0] out, // downsampled output
    output logic divided_clk, // divided down downsampler clock
    input logic in, // single bit from sigma-delta modulator
    input logic clk, // high-speed modulator clk
    input logic reset_n); // asynchronous digital reset (active low)

logic [NUMBITS-1:0] in_coded; // input coded to 25-bit two's complement
logic [NUMBITS-1:0] acc1;
logic [NUMBITS-1:0] acc2;
logic [NUMBITS-1:0] acc3;
logic [CLOCK_WIDTH-1:0] clock_counter;

// 2's complement encoder
always_comb begin : coder
    if (in) 
        in_coded = 1;
    else
        in_coded = 0;
end // always_comb


always_comb begin : clock_assign
    divided_clk = clock_counter[CLOCK_WIDTH-1]; 
end // always_comb


wire [NUMBITS-1:0] adder1_output;
wire adder1_done, adder1_cout;
serial_adder_top #(.WORDWIDTH(NUMBITS)) adder1(
        .out(adder1_output),
        .done(adder1_done),
        .cout(adder1_cout),
        .a_in(acc1),
        .b_in(in_coded),
        .clk(clk),
        .rst_n(reset_n)
);


wire [NUMBITS-1:0] adder2_output;
wire adder2_done, adder2_cout;
serial_adder_top #(.WORDWIDTH(NUMBITS)) adder2(
	.out(adder2_output),
	.done(adder2_done),
	.cout(adder2_cout),
	.a_in(acc1),
	.b_in(acc2),
	.clk(clk),
	.rst_n(reset_n)
);


wire [NUMBITS-1:0] adder3_output;
wire adder3_done, adder3_cout;
serial_adder_top #(.WORDWIDTH(NUMBITS)) adder3(
        .out(adder3_output),
        .done(adder3_done),
        .cout(adder3_cout),
        .a_in(acc2),
        .b_in(acc3),
        .clk(clk),
        .rst_n(reset_n)
);

// integrators
always_ff @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        acc1 <= 'b0;
    end
    else if (adder1_done) begin
        acc1 <= adder1_output;
    end
    else begin
        acc1 <= acc1;
    end
end // always_ff

// integrators
always_ff @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        acc2 <= 'b0;
    end
    else if (adder2_done) begin
        acc2 <= adder2_output;
    end
    else begin
        acc2 <= acc2;
    end
end // always_ff

// integrators
always_ff @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        acc3 <= 'b0;
    end
    else if (adder3_done) begin
        acc3 <= adder3_output;
    end
    else begin
        acc3 <= acc3;
    end
end // always_ff

// integrators
//always_ff @ (posedge clk or negedge reset_n) begin 
//    if (!reset_n) begin 
//        acc1 <= 'b0; 
//        acc2 <= 'b0; 
//        acc3 <= 'b0; 
//    end 
//    else begin
//        acc1 <= acc1 + in_coded; 
//        acc2 <= acc2 + acc1; 
//        acc3 <= acc3 + acc2;  
//    end
//end // always_ff

// clock divider

// The below assumes that all three serial adders are done at the same time
// which should be the case since they are configured for the same width and
// their inputs are driven in at the same time.
always_ff @ (posedge clk or negedge reset_n) begin
    if (!reset_n)
        clock_counter <= 'b0; 
    else if (adder1_done) begin 
        clock_counter <= clock_counter + 1'b1;
    end
    else begin
	clock_counter <= clock_counter;
    end
end // always_ff

// downsampler 
always_ff @ (negedge divided_clk or negedge reset_n) begin 
    if(!reset_n) begin
        out <= 'b0; 
    end 
    else begin 
        out <= acc3; 
    end
end // always_ff

endmodule

