
///////////////////////////////////////////////////////////////////
// File Name: serial_adder_top.sv
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: Top-level for bit-serial adder
// Trades off area for speed. Adder takes WORDWIDTH times as long but 
// uses WORDWITH times fewer full adders 
///////////////////////////////////////////////////////////////////

module serial_adder_top
    #(parameter WORDWIDTH = 8)
    (output logic [WORDWIDTH-1:0] out,
    output logic done,
    output logic cout,
    input logic [WORDWIDTH-1:0] a_in,
    input logic [WORDWIDTH-1:0] b_in,
    input logic clk,
    input logic rst_n);
    
    logic [$clog2(WORDWIDTH):0] counter;
    logic [WORDWIDTH-1:0] sum_sr;
    logic load;
    logic bit_a, bit_b;
    logic cout_temp;
    logic cin;
    logic sum;

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        load <= 1'b0;
        counter <= '0; 
        out <= '0;
        cin <= 1'b0;
        cout <= 1'b0;
 //       done <= 1'b0;
        sum_sr <= 0;
    end
    else begin
        if (counter == (WORDWIDTH+1)) begin
            cout <= cout_temp;
        end
        if (counter == (WORDWIDTH+2)) begin
            out <= sum_sr;
            counter <= counter + 1'b1;
            load <= 1'b1;
            counter <= '0;
        end
        else begin
            load <= 1'b0;
            cin <= cout_temp;
            counter <= counter + 1;
            sum_sr <= sum_sr >> 1;
            sum_sr[WORDWIDTH-1] <= sum;
        end
    end
end

// full adder
always_comb begin
    {cout_temp, sum} = bit_a + bit_b + cin;
    done = load;
end

serial_adder_shiftreg
    #(.WORDWIDTH(WORDWIDTH) 
    ) shift_reg_a (
        .out        (bit_a),
        .data_in    (a_in),
        .load       (load),
        .clk        (clk),
        .rst_n      (rst_n)
    );

serial_adder_shiftreg 
    #(.WORDWIDTH(WORDWIDTH)
    ) shift_reg_b (
        .out        (bit_b),
        .data_in    (b_in),
        .load       (load),
        .clk        (clk),
        .rst_n      (rst_n)
    );


endmodule


