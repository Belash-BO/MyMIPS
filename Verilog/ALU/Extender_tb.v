`timescale 1ns / 1ps

module Extender_tb;

	parameter period = 4;

	reg	[31:0]	Data;
	reg	[1:0]	SRO;
	wire	[62:0]	Result;
	integer i;

	Extender Extender_tb (.Data(Data), .SRO(SRO), .Result(Result));

	initial begin
		forever #(period) Data = $random;
	end

	initial begin
		forever #(period) begin
			for (i=0; i <=3; i = i + 1) #1 SRO = i;
		end
	end
	
	initial #200 $stop;

endmodule

