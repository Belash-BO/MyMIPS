/*
	Adder +4 bits i.e 1 byte
	Low two bits always = 00.
	Adder increments upper 30 bits of PC by 1	

	Developed by Bogdan Belash.
	6/2018

*/

module aluControl(i_aluOp, i_func, o_aluControl);
 
input       [1:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;
  
endmodule
