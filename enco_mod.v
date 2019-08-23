`timescale 1ns / 1ps   //prescalar is 2^17 for the 100MHz clock signal
module enco_mod(clk1,enco,b,clk_ref2); //clk1=reference clock
input clk1,enco;
output wire clk_ref2;
reg [7:0]value=0;
reg [7:0]count=0;
reg value1=1;
reg value2=1;
output [7:0]b;
//reg reset=0;
counter C12(.clk(clk1),.counter_out(clk_ref2));
//assign in= enco && clk_ref2;
always @(posedge enco) begin
if(clk_ref2==1)
count=count+1;
else begin 
value=(count==0)?value:count;
count=0;
end
end
always @(negedge clk_ref2) begin
if(count==0)
value1=0;
else
value1=1;
end
always @(posedge clk_ref2) begin
if(count!=0)
value2=0;
else
value2=1;
end
assign b=(value1==0 || value2==0)?0:value;
endmodule
