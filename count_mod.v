//currently being used for the encoder
`timescale 1ns / 1ps
module counter (
	clk,			
	counter_out  
    
);

	input clk;			
	 reg Counter_out=0;
	 reg [16:0]x=0;  
	 output counter_out;
	always @(posedge clk) begin
	 	x = x+1'b1;
 if(x==0)
begin
			Counter_out = ~Counter_out;
		end
	end
	assign counter_out=Counter_out;
endmodule				
