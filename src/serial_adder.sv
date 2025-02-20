// Datapath Module
module bit_serial_adder_datapath #(parameter int N = 8) (
  input logic clk,
  input logic rst_n, // Active-low reset
  input logic a_in,
  input logic b_in,
  input logic carry_in,
  output logic sum_out,
  output logic carry_out
);

  always_ff @(posedge clk) begin
    if (!rst_n) begin // Check for active-low reset
      sum_out <= '0;
      carry_out <= '0;
    end else begin
      sum_out <= a_in ^ b_in ^ carry_in;
      carry_out <= (a_in & b_in) | (a_in & carry_in) | (b_in & carry_in);
    end
  end

endmodule

// Control Module
module bit_serial_adder_control #(parameter int N = 8) (
  input logic clk,
  input logic rst_n, // Active-low reset
  output logic [N-1:0] counter,
  output logic load,
  output logic done
);

  always_ff @(posedge clk) begin
    if (!rst_n) begin // Check for active-low reset
      counter <= '0;
      load <= 1'b1; // Load initial values
      done <= 1'b0;
    end else begin
      if (load) begin
        load <= 1'b0;
      end else if (counter < N - 1) begin
        counter <= counter + 1;
        done <= 1'b0;
      end else begin
        counter <= '0;
        done <= 1'b1;
      end
    end
  end

endmodule

// Top-Level Module (Connecting Control and Datapath)
module bit_serial_adder #(parameter int N = 8) (
  input logic clk,
  input logic rst_n, // Active-low reset
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [N-1:0] sum,
  output logic carry_out,
  output logic done
);

  logic a_in;
  logic b_in;
  logic carry_in;
  logic sum_out;
  logic load;

  logic [N-1:0] counter;

  bit_serial_adder_datapath #(N) datapath (
    .clk(clk),
    .rst_n(rst_n), // Connect active-low reset
    .a_in(a_in),
    .b_in(b_in),
    .carry_in(carry_in),
    .sum_out(sum_out),
    .carry_out(carry_out)
  );

  bit_serial_adder_control #(N) control (
    .clk(clk),
    .rst_n(rst_n), // Connect active-low reset
    .counter(counter),
    .load(load),
    .done(done)
  );

  assign a_in = a[counter];
  assign b_in = b[counter];
  assign carry_in = (counter == 0) ? 1'b0 : datapath.carry_out; // Initial carry-in is 0
  assign sum[counter] = sum_out;

endmodule

// Testbench (SystemVerilog)
module bit_serial_adder_tb;
  logic clk;
  logic rst_n; // Active-low reset
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum;
  logic carry_out;
  logic done;

  bit_serial_adder #(8) adder (
    .clk(clk),
    .rst_n(rst_n), // Connect active-low reset
    .a(a),
    .b(b),
    .sum(sum),
    .carry_out(carry_out),
    .done(done)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    rst_n = 1'b0; // Assert reset (active low)
    a = 8'h45;
    b = 8'h2A;
    #10 rst_n = 1'b1; // De-assert reset
    #100; // Wait for addition to complete
    $display("Sum: %h, Carry Out: %b, Done: %b", sum, carry_out, done);
    $finish;
  end

endmodule
