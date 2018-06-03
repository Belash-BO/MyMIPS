/*
	Testbench for adder.v	

	Developed by Bogdan Belash.
	6/2018

*/

`timescale 1ns / 100ps

module adder_tb;

	parameter period = 1;

	reg	[31:0]	PC;
	wire	[29:0]	PC_30;
	wire	[29:0]	PC_plus_4;

adder adder1 (.PC(PC_30), .PC_plus_4(PC_plus_4));

	initial 
		PC = 0;

	always @(*)
		forever #(period)
			PC [31:2] = PC_plus_4;

	assign PC_30 = PC [31:2];

	initial #1000 $stop;

endmodule

