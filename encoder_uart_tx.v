`timescale 1ns / 1ps
module encoder_uart_tx(clk_signal,enco_signal,tx,LED
    );
input clk_signal;
input enco_signal;
wire [7:0]data;
output tx;
output [7:0]LED;
enco_mod e(.clk1(clk_signal),.enco(enco_signal),.b(data));
transmitter t(.clk(clk_signal),.data(data),.tx(tx));
assign LED=data;
endmodule
