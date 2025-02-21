
///////////////////////////////////////////////////////////////////
// File Name: serial_adder_top_tb.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: Testbench for serial_adder
///////////////////////////////////////////////////////////////////


module serial_adder_top_tb;
    parameter WORDWIDTH = 8;
    logic clk;
    logic rst_n; 
    logic [WORDWIDTH-1:0] a;
    logic [WORDWIDTH-1:0] b;
    logic [WORDWIDTH-1:0] sum_reg;
    logic carry_out;
    logic done;
    logic [31:0] NumTrials; 

serial_adder_top 
    #(.WORDWIDTH(WORDWIDTH)
    ) serial_adder_top (
        .out        (sum_reg),
        .done       (done),
        .cout       (carry_out),
        .a_in       (a),
        .b_in       (b),
        .clk        (clk),
        .rst_n      (rst_n)
    );

`include "test_tasks.sv" // tests here

initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

initial begin
    // initial values of a and b for sanity check
    a = 200;
    b = 100;
    NumTrials = 1000;
    rst_n = 1'b0; 
    #10 rst_n = 1'b1;
    @(posedge done); // let reset clear
    testSerialAdder(NumTrials);
end

endmodule
