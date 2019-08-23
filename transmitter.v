`timescale 1ns / 1ps
module transmitter(clk,data,tx
    );
input wire clk;
input [7:0]data; //data to be sent
reg [7:0]tx_data=0; //reg to which data is copied to
reg [1:0]status=2'b11;
//11-idle
//00-start
//10-data
//01-stop
reg status1=1;
reg [2:0]count=0; //count the number of bits sent  0-7
wire clk_ref;
reg output_signal=1;
output tx;
 //clock prescalar
 std_counter C(.clk(clk),.counter_out(clk_ref));
 assign tx=output_signal;
always @(posedge clk_ref) begin
	if(status==0) begin  //start bit
			output_signal=0;
			count=0;
			tx_data<=data;
			status<=1;
	end
	if(status==1) begin  //data bit
			if(count==7)
			status<=2;
			
			output_signal=tx_data[count];
			count=count+1;
			
	
	end
	if(status==2) begin  //stop bit
			output_signal=1;
			status<=3;
			
	end
	if(status==3) begin  //idle
	
	output_signal=1;
	if(status1==1)
	status<=0;
	end
	
	end
endmodule
