/*
	Testbench for reg_file.v	

	Developed by Bogdan Belash.
	6/2018

*/

`timescale 1ns / 100ps

module reg_file_tb;

	parameter period = 4;

	reg		clk, we;
	reg	[4:0]	reg_a, reg_b, reg_w;
	reg	[31:0]	bus_w;
	wire	[31:0]	bus_a, bus_b;

reg_file reg_file1 (.clk(clk), .we(we), .reg_a(reg_a), .reg_b(reg_b), .reg_w(reg_w), .bus_w(bus_w), .bus_a(bus_a), .bus_b(bus_b));

	initial begin
		clk = 0;
		forever #(period/4)
			clk = ~clk;
	end

	initial begin
		reg_a = 0;
		reg_b = 0;
		reg_w = 0;
		bus_w = 0;
		forever #(period) begin
			reg_a = $random;
			reg_b = $random;
			reg_w = $random;
			bus_w = $random;
		end
	end

	initial begin
		we = 0;
		#3 we = 1;
		#270 we = 0;
		#50 we = 1;
	end

	initial #1000 $stop;

endmodule
