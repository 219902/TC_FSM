`timescale 1ns / 1ps

module fsm_task(
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
    		Snext[0] = (in &  Scurr[1]) | (~in & Scurr[0] & ~Scurr[2]) | (~Scurr[0] & Scurr[1] & Scurr[2]) | (~Scurr[0] & ~Scurr[1] & ~Scurr[2]);
    		Snext[1] = in | (~Scurr[1] & Scurr[2]);
    		Snext[2] = (~in &  Scurr[1] & ~Scurr[2]) | (~in & ~Scurr[1] & Scurr[2]) | (in & ~Scurr[0] & Scurr[1] & Scurr[2]) | (~in & Scurr[0] & Scurr[2]);
    	end

    end
    
    // always block for ouput
    always@(in, Scurr) begin
    	out = (~Scurr[0] & ~Scurr[1] & Scurr[2]) | (Scurr[0] & Scurr[1] & Scurr[2]);
    end
    
    // always block for FFs
	always@(posedge clk) begin
		if(reset == 1)
			Scurr <= 3'b000;
		else
			Scurr <= Snext;
	end

endmodule
