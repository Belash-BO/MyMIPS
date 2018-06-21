/*
	Adder +4 bits i.e 1 byte
	Low two bits always = 00.
	Adder increments upper 30 bits of PC by 1	

	Developed by Bogdan Belash.
	6/2018

*/

module pc(i_clk, i_rst_n, i_pc, o_pc);

input               i_clk, i_rst_n;
input       [31:0]  i_pc;
output  reg [31:0]  o_pc;

   
endmodule
