// Verilog test fixture created from schematic D:\Documents\GitHub\First\Xilinx-Projects\mux\mux8t1_8.sch - Sat May 19 14:27:18 2018

`timescale 1ns / 1ps

module mux8t1_8_mux8t1_8_sch_tb();

// Inputs
   reg [7:0] x6;
   reg [7:0] x7;
   reg [7:0] x4;
   reg [7:0] x5;
   reg [7:0] x2;
   reg [7:0] x3;
   reg [7:0] x0;
   reg [7:0] x1;
   reg [2:0] sel;

// Output
   wire [7:0] o;

// Bidirs

// Instantiate the UUT
   mux8t1_8 UUT (
		.x6(x6), 
		.x7(x7), 
		.x4(x4), 
		.x5(x5), 
		.x2(x2), 
		.x3(x3), 
		.x0(x0), 
		.x1(x1), 
		.o(o), 
		.sel(sel)
   );
// Initialize Inputs

initial begin 
sel = 0; 
x0 = 8'h00; 
x1 = 8'h11; 
x2 = 8'h22; 
x3 = 8'h33; 
x4 = 8'h44; 
x5 = 8'h55; 
x6 = 8'h66; 
x7 = 8'h77; 
#100; 
sel = 1; 
#100; 
sel = 2; 
#100; 
sel = 3; 
#100; 
sel = 4; 
#100; 
sel = 5; 
#100; 
sel = 6; 
#100; 
sel = 7; 
end

endmodule
