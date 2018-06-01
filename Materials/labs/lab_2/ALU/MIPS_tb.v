`timescale 1ns / 1ps

module MIPS_tb;

	parameter period = 64;

	reg [31:0] A, B;
	reg [3:0] SRO, AS, LO;
	reg [1:0] AO;
	wire OF, ZF;
	wire [31:0] Result;
	integer i;
	integer j;
	integer k;
	integer m;
	

MIPS MIPS_tb (.A(A), .B(B), .SRO(SRO), .AS(AS), .LO(LO), .AO(AO), .OF(OF), .ZF(ZF), .Result(Result));

	initial begin
		A = $random;
		B = $random;
		#127 begin
			forever #(period/64) begin
			A <= $random;
			B <= $random;
			end
		end
	end

	initial begin
		SRO = 0;
		#127 begin
			forever #(period/8) begin
				for (i = 0; i <= 3; i = i + 1) #8 SRO = i;
			end
		end
	end

	initial begin
		AO = 0;
		#127 begin
			forever #(period/8) begin
				for (j = 0; j <= 1; j = j + 1) #8 AO = j;
			end
		end
	end

	initial begin
		LO = 0;
		#127 begin
			forever #(period/8) begin
				for (k = 0; k <= 3; k = k + 1) #8 LO = k;
			end
		end
	end

	initial begin
		AS = 0;
		forever #(period) begin
			for (m = 0; m <= 3; m = m + 1) #64 AS = m;
		end	
	end

	initial #1000 $stop;
endmodule
