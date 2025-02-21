///////////////////////////////////////////////////////////////////
// File Name: serial_adder_shiftreg
// Engineer:  Carl Grace (crgrace@lbl.gov)
// Description: Parallel-in-serial-out shift register
// T///////////////////////////////////////////////////////////////////

module serial_adder_shiftreg
    #(parameter WORDWIDTH = 8)
    (output logic out,
    input logic [WORDWIDTH-1:0] data_in,
    input logic load,
    input logic clk,
    input logic rst_n);

logic [WORDWIDTH-1:0] memory;

always_ff @ (posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        out <= 1'b0;
        memory <= '0;
    end
    else begin
        if (load) 
            memory <= data_in; 
        else begin
            out <= memory[0];
            memory <= memory >> 1'b1;
        end
    end
end
endmodule
