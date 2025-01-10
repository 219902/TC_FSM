`timescale 1ns / 1ps

module tb_fsm3comb();

reg clk;
reg INPUT;
reg RESET;
wire Z;

//module fsm3comb(input clk, input in, output reg out);
fsm3comb uut(.clk(clk), .in(INPUT), .out(Z));

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end 

reg [15:0] X = 16'b0011_0110_0101_0100;

initial begin
	RESET = 1'b0;
	INPUT = 1'b0;
#4
	RESET = 1'b1;
#6
	RESET = 1'b0;
	
	for(integer i=0; i <= 15; i = i + 1) begin
		#20
			INPUT = X[15-i];	
	end
#10
	$finish();
		
end

endmodule
