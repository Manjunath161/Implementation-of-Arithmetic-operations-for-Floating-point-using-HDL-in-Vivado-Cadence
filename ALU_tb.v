`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 23:57:56
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb( );

reg [31:0]a,b;
reg [3:0] c;
wire ex,udr,ovr;
wire [31:0]d;

ALU Au(a,b,c,d,ex,ovr,udr);

initial
begin
$monitor ($time,"  a = 0x%h  b = 0x%h  Operation = %b  Output = 0x%h  exception = %b Overflow = %b Underflow = %b",a,b,c,d,ex,ovr,udr);

//Addition
#50 a=32'h41200000; b=32'h40200000; c=4'd1;   // a=10  b=2.5  c=1
#50 a=32'h41200000; b=32'hc0200000; c=4'd1;   // a=10  b= -2.5  c=1

//Subtraction
#50 a=32'h41200000; b=32'h40200000; c=4'd2;   // a=10  b=2.5  c=2
#50 a=32'h41200000; b=32'hc0200000; c=4'd2;   // a=10  b= -2.5  c=2

//Multiplication
#50 a=32'h41200000; b=32'h40200000; c=4'd3;   // a=10  b=2.5  c=3
#50 a=32'h41200000; b=32'hc0200000; c=4'd3;   // a=10  b= -2.5  c=3

//Division
#50 a=32'h41200000; b=32'h40800000; c=4'd4;   // a=10  b=5  c=4
#50 a=32'h41200000; b=32'hc0800000; c=4'd4;   // a=10  b= -5  c=4

//OR
#50 a=32'h0000ffff; b=32'hffff0000; c=4'd5;

//AND
#50 a=32'h0000ffff; b=32'hffff0000; c=4'd6;

//XOR
#50 a=32'h0000ffff; b=32'hffff0000; c=4'd7;

//L-S
#50 a=32'h00000004; c=4'd8;

//R-S
#50 a=32'h00000008; c=4'd9;

//F to N
#50 a=32'h40800000; c=4'd10;

//Compliment
#50 a=32'hffffffff; c=4'd11;

#50 $finish;
end

endmodule

