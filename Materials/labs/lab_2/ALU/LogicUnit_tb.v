`timescale 1ns / 1ps

module LogicUnit_tb;
	
	parameter period = 4;

	reg [31:0] A, B;
	reg [1:0] LO;
	wire [31:0] Result;
	integer i;

LogicUnit LogicUnit_tb (.A(A), .B(B), .LO(LO), .Result(Result));

	initial begin
		LO = 0;
		forever #(period/4) begin
			for (i = 0; i <= 3; i = i + 1) #1 LO = i;
		end
	end

	initial begin
		forever #(period+1) A = $random;
	end

	initial begin
		forever #(period+1) B = $random;
	end

	initial #50 $stop;
endmodule
