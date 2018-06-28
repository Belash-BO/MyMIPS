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
		 input		[4:0]	shift_amount,
		 output 	[31:0]	result);

		 wire [62:0] ext_data;
		 wire [4:0] sa_sll;
		 wire [46:0] in1;
		 wire [38:0] in2;
		 wire [34:0] in3;
		 wire [32:0] in4;

extender extender_1 (.shift_op(shift_op), .data(data), .ext_data(ext_data));

	assign  sa_sll = {5{(~(shift_op[1] | shift_op[0]))}} ^ shift_amount;

	assign	in1 = sa_sll[4] ? ext_data[62:16] : ext_data[46:0];

	assign	in2 = sa_sll[3] ? in1[46:8] : in1[38:0];
	
	assign	in3 = sa_sll[2] ? in2[38:4] : in2[34:0];

	assign	in4 = sa_sll[1] ? in3[34:2] : in3[32:0];

	assign	result = sa_sll[0] ? in4[32:1] : in4[31:0];

endmodule					
