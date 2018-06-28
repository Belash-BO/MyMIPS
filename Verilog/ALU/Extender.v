/*
	Extender

	
	Input data is extended to 63 bits according to shift_op
	The 63 bits are shifted right according to S4 S3 S2 S1 S0

	Input data is extended from 32 to 63 bits as follows:
 	If shift_op = SRL then ext_data[62:0] = {31{0}} 	|| data[31:0]
 	If shift_op = SRA then ext_data[62:0] = {31{data[31]}}	|| data[31:0]
 	If shift_op = ROR then ext_data[62:0] = data[30:0] 	|| data[31:0]
 	If shift_op = SLL then ext_data[62:0] = data[31:0] 	|| {31{0}}
	For SRL, the 32-bit input data is zero-extended to 63 bits
	For SRA, the 32-bit input data is sign-extended to 63 bits
	For ROR, 31-bit extension = lower 31 bits of data
	Then, shift right according to the shift amount
	As the extended data is shifted right, the upper bits will be: 0 (SRL), sign-bit (SRA), or lower bits of data (ROR)

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

module extender	(input		[31:0]	data,
		 input		[1:0]	shift_op,
		 output reg	[62:0]	ext_data);

	wire [62:0] SLL, SRA, SRL, ROR;

	always @(*) begin
		case (shift_op)
			2'b00: ext_data = SLL;
			2'b01: ext_data = SRA;
			2'b10: ext_data = SRL;
			2'b11: ext_data = ROR;
			default: ext_data =  63'b0;
		endcase
	end

	assign SLL = {data, 31'b0};
	assign SRA = {{31{data[31]}}, data};
	assign SRL = {31'b0, data};
	assign ROR = {data[30:0], data};
	
endmodule
