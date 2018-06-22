/*
	Shifter

	Contains: extender

	Implemented with multiplexers and wiring
	Shift Operation can be: SLL, SRL, SRA, or ROR
	Input Data is extended to 63 bits according to Shift Op
	The 63 bits are shifted right according to S4 S3 S2 S1 S0

	The wiring of the above shifter dictates a right shift
	We can convert a left shift into a right shift
	For SLL, 31 zeros are appended to the right of data
	To shift left by 0 is equivalent to shifting right by 31
	To shift left by 1 is equivalent to shifting right by 30
	To shift left by 31 is equivalent to shifting right by 0
	For SLL use the 1’s complement of the shift amount
	ROL is equivalent to ROR if we use (32 – rotate amount)
	ROL by 10 bits is equivalent to ROR by (32–10) = 22 bits
	Software can convert ROL to ROR

	Developed by Bogdan Belash.
	6/2018

*/

module shifter	(input		[31:0]	data,
		 input		[1:0]	shift_op,
		 input		[4:0]	SA,
		 output reg	[31:0]	result);

		 wire [62:0] ext_data;
		 reg [4:0] SAsll;
		 reg [46:0] S4;
		 reg [38:0] S3;
		 reg [34:0] in3;
		 reg [32:0] in4;

Extender Shifter (.SRO(SRO), .Data(Data), .Result(Result1));

	always @(*) begin
		SAsll = {5{(~(SRO[1:1] | SRO[0:0]))}} ^ SA;
		
		in1 = SAsll[4] ? Result1[62:16] : Result1[46:0];

		in2 = SAsll[3] ? in1[46:8] : in1[38:0];
	
		in3 = SAsll[2] ? in2[38:4] : in2[34:0];

		in4 = SAsll[1] ? in3[34:2] : in3[32:0];

		Result = SAsll[0] ? in4[32:1] : in4[31:0];
	end
endmodule					
