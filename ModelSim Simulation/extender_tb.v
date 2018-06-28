/*
	Testbench for extender.v	

	Developed by Bogdan Belash.
	6/2018

*/


`timescale 1ns / 1ps

module extender_tb;

	parameter period = 1;

	reg	[31:0]	data;
	reg	[1:0]	shift_op;
	wire	[62:0]	ext_data;
	integer i;

	extender extender_1 (.data(data), .shift_op(shift_op), .ext_data(ext_data));

	initial begin
		forever #(period) data = $random;
	end

	initial begin
		forever #(period) begin
			for (i=0; i <=3; i = i + 1) #1 shift_op = i;
		end
	end
	
	initial #200 $stop;

endmodule

