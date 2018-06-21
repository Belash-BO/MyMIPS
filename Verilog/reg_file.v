/*
	Register File 

	Register File consists of 32 × 32-bit registers	

	bus_a and bus_b: 32-bit output busses for reading 2 registers
	bus_w: 32-bit input bus for writing a register when we is 1
	Two registers read and one written in a cycle

	reg_a selects register to be read on bus_a
	reg_b selects register to be read on bus_b
	reg_w selects the register to be written

	The clock input is used only during write operation
	During read, register file behaves as a combinational logic block

	Developed by Bogdan Belash.
	6/2018

*/

module reg_file	(input 			clk, we,
		 input		[4:0]	reg_a, reg_b, reg_w, 
              	 input		[31:0]	bus_w,
		 output		[31:0]	bus_a, bus_b);

	reg	[31:0]	mem [0:31];	//Main memory

	reg	[31:0]	decoder_w, decoder_a, decoder_b;
	wire	[31:1] internal_w;
	integer i;

	//Writing process	
	always 	@(reg_w) begin
		decoder_w = 0;
		decoder_w [reg_w] = 1;
	end

	assign internal_w = {31{we}} & decoder_w [31:1];
               
	always @(posedge clk) begin
		for (i = 1; i <= 31; i = i + 1)
			if (internal_w [i])
				mem [i] <= bus_w;
		mem[0] = 32'b0;
	end

	//Reading A process
	always 	@(reg_a) begin
		decoder_a <= 0;
		decoder_a [reg_a] <= 1;
	end

	assign bus_a[31:0] = (decoder_a[reg_a]) ? mem [reg_a] : 32'bz; 
	
	//Reading B process
	always 	@(reg_b) begin
		decoder_b = 0;
		decoder_b [reg_b] = 1;
	end

	assign bus_b[31:0] = (decoder_b[reg_b]) ? mem [reg_b] : 32'bz;
	
endmodule
