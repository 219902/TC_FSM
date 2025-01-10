`timescale 1ns / 1ps

module tb_fsm_task();

reg clk;
reg INPUT;
reg RESET;
wire Z;

//module fsm_task(input clk, input in, output reg out);
fsm_task uut(.clk(clk), .reset(RESET), .in(INPUT), .out(Z));

initial begin
	clk = 1'b0;
	forever #10 clk = ~clk;
end 

reg [15:0] X = 16'b0010_1001_0001_0011;

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
#50
	$finish();
		
end

endmodule
