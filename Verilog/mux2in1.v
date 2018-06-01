
module mux2in1	(input		[WIDTH-1:0]	i_dat0, i_dat1, 
		 input				i_control,
		 output	reg	[WIDTH-1:0]	o_dat);

		parameter WIDTH = 32;

	always (*) 
		if i_control = 0
			o_dat = i_dat0;
		else
			0_dat = i_dat1;	
  
endmodule

