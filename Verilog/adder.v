/*
	Adder +4 bits i.e 1 byte
	Low two bits always = 00.
	Adder increments upper 30 bits of PC by 1	

	Developed by Bogdan Belash.
	6/2018

*/

module	adder	(input	[29:0]	PC,
		 output	[29:0]	PC_plus_4);

	assign PC_plus_4 = PC + 1'b1;
  
endmodule
