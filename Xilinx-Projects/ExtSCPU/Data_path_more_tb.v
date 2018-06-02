// Verilog test fixture created from schematic D:\Documents\GitHub\First\Xilinx-Projects\ExtSCPU\Code\CPU\SDPath_M.sch - Sat Jun 02 16:54:39 2018

`timescale 1ns / 1ps

module SDPath_M_SDPath_M_sch_tb();

// Inputs
   reg ALUSrc_B;
   reg RegDst;
   reg rst;
   reg clk;
   reg [2:0] ALU_Control;
   reg [25:0] inst_field;
   reg RegWrite;
   reg Jal;
   reg [1:0] DatatoReg;
   reg [31:0] Data_in;
   reg [1:0] Branch;

// Output
   wire [31:0] Data_out;
   wire [31:0] PC_out;
   wire zero;
   wire [31:0] ALU_out;
   wire overflow;

// Bidirs

// Instantiate the UUT
   SDPath_M UUT (
		.ALUSrc_B(ALUSrc_B), 
		.RegDst(RegDst), 
		.Data_out(Data_out), 
		.PC_out(PC_out), 
		.rst(rst), 
		.clk(clk), 
		.ALU_Control(ALU_Control), 
		.zero(zero), 
		.inst_field(inst_field), 
		.RegWrite(RegWrite), 
		.Jal(Jal), 
		.ALU_out(ALU_out), 
		.DatatoReg(DatatoReg), 
		.Data_in(Data_in), 
		.overflow(overflow), 
		.Branch(Branch)
   );
// Initialize Inputs
 initial begin    //����ָ��add��1+1=2������R��ָ�RegDst=1��RegWrite=1.
		ALUSrc_B = 0;
		RegDst = 1;
		rst = 0;
		clk = 0;
		ALU_Control = 6'b000000;   //ALU_Control=3'b010;   //add
		inst_field = 26'b10010100111000100000100000; // 0 *000000 18 *10010 19 *10011 17*10001 0 *00000 32 *100000
		RegWrite = 1;
		Jal = 0;
		DatatoReg = 2'b10;
		Data_in= 32'h1;
		Branch = 0;
	end
endmodule
