`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 09:40:04 PM
// Design Name: 
// Module Name: fsm_task_mealy
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

module fsm_task_mealy(
    input clk,
    input reset,
    input in,
    input [2:0] Scurr,
    output reg [2:0] Snext,
    output reg out);

  
    // always block for next state
    always@(in, reset, Scurr) begin
    	if(reset == 1)
    		Snext = 3'b000;
    	else begin
    		Snext[0] = (in & ~Scurr[1] & ~Scurr[2]) | (Scurr[0] & ~Scurr[1]) | (Scurr[1] & Scurr[2]);
    		Snext[1] = (~in & ~Scurr[1]) | (in & Scurr[1] & ~Scurr[2]) | (~in & ~Scurr[0]) | (~Scurr[1] & Scurr[2]);
    		Snext[2] = (in &  Scurr[1] & ~Scurr[2]) | (in & ~Scurr[1] & Scurr[2]) | (~in & Scurr[0] & Scurr[2]);
    	end

    end
    
    // always block for ouput
    always@(in, Scurr) begin
    	out = (in & ~Scurr[1] & Scurr[2]) | (~in & Scurr[1] & Scurr[2]);
    end
    
    
    // always block for FFs
	always@(posedge clk) begin
		if(reset == 1)
			Scurr <= 3'b000;
		else
			Scurr <= Snext;
	end
	
endmodule

/*
module fsm_task_mealy(
    input clk,
    input reset,
    input in,
    output reg out);

    reg [2:0] Scurr = 3'b000;
    reg [2:0] Snext;
    
    // always block for next state
    always@(in, reset, Scurr) begin
    	if(reset == 1)
    		Snext = 3'b000;
    	else begin
    		Snext[0] = (in & ~Scurr[1] & ~Scurr[2]) | (Scurr[0] & ~Scurr[1]) | (Scurr[1] & Scurr[2]);
    		Snext[1] = (~in & ~Scurr[1]) | (in & Scurr[1] & ~Scurr[2]) | (~in & ~Scurr[0]) | (~Scurr[1] & Scurr[2]);
    		Snext[2] = (in &  Scurr[1] & ~Scurr[2]) | (in & ~Scurr[1] & Scurr[2]) | (~in & Scurr[0] & Scurr[2]);
    	end

    end
    
    // always block for ouput
    always@(in, Scurr) begin
    	out = (in & ~Scurr[1] & Scurr[2]) | (~in & Scurr[1] & Scurr[2]);
    end
    
    // always block for FFs
	always@(posedge clk) begin
		if(reset == 1)
			Scurr <= 3'b000;
		else
			Scurr <= Snext;
	end

endmodule
*/