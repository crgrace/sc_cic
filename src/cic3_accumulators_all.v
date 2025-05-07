module serial_adder_shiftreg (
	out,
	data_in,
	load,
	clk,
	rst_n
);
	parameter WORDWIDTH = 8;
	output reg out;
	input wire [WORDWIDTH - 1:0] data_in;
	input wire load;
	input wire clk;
	input wire rst_n;
	reg [WORDWIDTH - 1:0] memory;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			out <= 1'b0;
			memory <= 1'sb0;
		end
		else if (load)
			memory <= data_in;
		else begin
			out <= memory[0];
			memory <= memory >> 1'b1;
		end
endmodule
module serial_adder_top (
	out,
	done,
	cout,
	a_in,
	b_in,
	clk,
	rst_n
);
	reg _sv2v_0;
	parameter WORDWIDTH = 8;
	output reg [WORDWIDTH - 1:0] out;
	output reg done;
	output reg cout;
	input wire [WORDWIDTH - 1:0] a_in;
	input wire [WORDWIDTH - 1:0] b_in;
	input wire clk;
	input wire rst_n;
	reg [$clog2(WORDWIDTH):0] counter;
	reg [WORDWIDTH - 1:0] sum_sr;
	reg load;
	wire bit_a;
	wire bit_b;
	reg cout_temp;
	reg cin;
	reg sum;
	always @(posedge clk or negedge rst_n)
		if (!rst_n) begin
			load <= 1'b0;
			counter <= 1'sb0;
			out <= 1'sb0;
			cin <= 1'b0;
			cout <= 1'b0;
			sum_sr <= 0;
		end
		else begin
			if (counter == (WORDWIDTH + 1))
				cout <= cout_temp;
			if (counter == (WORDWIDTH + 2)) begin
				out <= sum_sr;
				counter <= counter + 1'b1;
				load <= 1'b1;
				counter <= 1'sb0;
			end
			else begin
				load <= 1'b0;
				cin <= cout_temp;
				counter <= counter + 1;
				sum_sr <= sum_sr >> 1;
				sum_sr[WORDWIDTH - 1] <= sum;
			end
		end
	always @(*) begin
		if (_sv2v_0)
			;
		{cout_temp, sum} = (bit_a + bit_b) + cin;
		done = load;
	end
	serial_adder_shiftreg #(.WORDWIDTH(WORDWIDTH)) shift_reg_a(
		.out(bit_a),
		.data_in(a_in),
		.load(load),
		.clk(clk),
		.rst_n(rst_n)
	);
	serial_adder_shiftreg #(.WORDWIDTH(WORDWIDTH)) shift_reg_b(
		.out(bit_b),
		.data_in(b_in),
		.load(load),
		.clk(clk),
		.rst_n(rst_n)
	);
	initial _sv2v_0 = 0;
endmodule
module cic3_accumulators_all (
	out,
	divided_clk,
	in,
	clk,
	reset_n
);
	reg _sv2v_0;
	parameter DECIMATION_FACTOR = 256;
	parameter CLOCK_WIDTH = $clog2(DECIMATION_FACTOR);
	parameter NUMBITS = (3 * CLOCK_WIDTH) + 1;
	output reg [NUMBITS - 1:0] out;
	output reg divided_clk;
	input wire in;
	input wire clk;
	input wire reset_n;
	reg [NUMBITS - 1:0] in_coded;
	reg [NUMBITS - 1:0] acc1;
	reg [NUMBITS - 1:0] acc2;
	reg [NUMBITS - 1:0] acc3;
	reg [CLOCK_WIDTH - 1:0] clock_counter;
	always @(*) begin : coder
		if (_sv2v_0)
			;
		if (in)
			in_coded = 1;
		else
			in_coded = 0;
	end
	always @(*) begin : clock_assign
		if (_sv2v_0)
			;
		divided_clk = clock_counter[CLOCK_WIDTH - 1];
	end
	wire [NUMBITS - 1:0] adder1_output;
	wire adder1_done;
	wire adder1_cout;
	serial_adder_top #(.WORDWIDTH(NUMBITS)) adder1(
		.out(adder1_output),
		.done(adder1_done),
		.cout(adder1_cout),
		.a_in(acc1),
		.b_in(in_coded),
		.clk(clk),
		.rst_n(reset_n)
	);
	wire [NUMBITS - 1:0] adder2_output;
	wire adder2_done;
	wire adder2_cout;
	serial_adder_top #(.WORDWIDTH(NUMBITS)) adder2(
		.out(adder2_output),
		.done(adder2_done),
		.cout(adder2_cout),
		.a_in(acc1),
		.b_in(acc2),
		.clk(clk),
		.rst_n(reset_n)
	);
	wire [NUMBITS - 1:0] adder3_output;
	wire adder3_done;
	wire adder3_cout;
	serial_adder_top #(.WORDWIDTH(NUMBITS)) adder3(
		.out(adder3_output),
		.done(adder3_done),
		.cout(adder3_cout),
		.a_in(acc2),
		.b_in(acc3),
		.clk(clk),
		.rst_n(reset_n)
	);
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			acc1 <= 'b0;
		else if (adder1_done)
			acc1 <= adder1_output;
		else
			acc1 <= acc1;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			acc2 <= 'b0;
		else if (adder2_done)
			acc2 <= adder2_output;
		else
			acc2 <= acc2;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			acc3 <= 'b0;
		else if (adder3_done)
			acc3 <= adder3_output;
		else
			acc3 <= acc3;
	always @(posedge clk or negedge reset_n)
		if (!reset_n)
			clock_counter <= 'b0;
		else if (adder1_done)
			clock_counter <= clock_counter + 1'b1;
		else
			clock_counter <= clock_counter;
	always @(negedge divided_clk or negedge reset_n)
		if (!reset_n)
			out <= 'b0;
		else
			out <= acc3;
	initial _sv2v_0 = 0;
endmodule
