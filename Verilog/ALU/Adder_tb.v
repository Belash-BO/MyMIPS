`timescale 1ns / 1ps

module Adder_tb;
	parameter period = 2;

	reg	[31:0] 	A, B;
	reg		AO;
	wire	[31:0]	Result;
	wire		OF;

Adder Adder_tb (.A(A), .B(B), .AO(AO), .OF(OF), .Result(Result));

	initial begin
		forever #(period/2) begin
			A <= $random;
			B <= $random;
		end
	end

	initial begin
		AO = 0;
		forever #(period) AO = ~AO;
	end

	initial #100 $stop;
endmodule
