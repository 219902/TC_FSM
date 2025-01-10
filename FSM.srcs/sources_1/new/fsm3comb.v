`timescale 1ns / 1ps

module fsm3comb(
    input clk,
    input in,
    output reg out);

    reg [1:0] Scurr = 2'b00;
    reg [1:0] Snext;
    
    // always block for next state
    always@(in, Scurr) begin
    	Snext[0] = in;
    	Snext[1] = (~in & Scurr[0]) | (in & Scurr[1] & ~Scurr[0]);
    end
    
    
    // always block for ouput
    always@(in, Scurr) begin
    	out = Scurr[1] & Scurr[0];
    end
    
    // always block for FFs
	always@(posedge clk) begin
		Scurr <= Snext;
	end

endmodule
