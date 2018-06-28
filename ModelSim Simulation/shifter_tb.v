/*
	Testbench for shifter.v	

	Developed by Bogdan Belash.
	6/2018

*/

`timescale 1ns / 1ps

module shifter_tb;

	parameter period = 4;

	reg [4:0]	shift_amount;
	reg [1:0]	shift_op;
	reg [31:0]	data;
	wire[31:0]	result;
	integer i;
	integer j;

shifter shifter_1 (.shift_amount(shift_amount), .shift_op(shift_op), .data(data), .result(result));

	initial begin
		shift_op = 0;
		forever #(period/4) begin
			for (i = 0; i <= 3; i = i + 1) 
				#1 shift_op = i;
		end
	end
	
	initial begin
		shift_amount = 0;
		forever #(period) begin
			for (j = 0; j <= 31; j = j + 1) 
				#4 shift_amount = j;
		end
	end

	initial begin
		forever #(period/4) 
			data = $random;
	end

	initial #5000 $stop;

endmodule
