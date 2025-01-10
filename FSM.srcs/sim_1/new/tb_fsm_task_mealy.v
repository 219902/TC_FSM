`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 09:45:45 PM
// Design Name: 
// Module Name: tb_fsm_task_mealy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fsm_task_mealy();

reg clk;
reg INPUT;
reg RESET;
wire Z;

//module fsm_task(input clk, input in, output reg out);
fsm_task_mealy uut(.clk(clk), .reset(RESET), .in(INPUT), .out(Z));

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end 

reg [15:0] X = 16'b0010_1001_0001_0011;

initial begin
	RESET = 1'b0;
	INPUT = 1'b0;
#1
	RESET = 1'b1;
#10
	RESET = 1'b0;
	
	for(integer i=0; i <= 15; i = i + 1) begin
		#9
			INPUT = X[15-i];	
	end
#50
	$finish();
		
end

endmodule

