`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 23:56:17
// Design Name: 
// Module Name: Converter
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


module Converter(
        input [31:0] a_operand,
		output [31:0] Integer
    );

reg[7:0] exp;    
reg [23:0] Integer_Value;

always @(*)
begin
	if (a_operand[30:23] == 8'd127)
			begin
				Integer_Value = 23'd0;
			end

	else if (a_operand[30:23] == 8'd128)
			begin
				Integer_Value = {a_operand[22],22'd0};
				exp = 8'd1;				 
			end

	else if (a_operand[30:23] == 8'd129)
			begin
				Integer_Value = {a_operand[22:21],21'd0};
				exp = 8'd2; 
			end

	else if (a_operand[30:23] == 8'd130)
			begin
				Integer_Value = {a_operand[22:20],20'd0};
				exp = 8'd3; 
			end

	else if (a_operand[30:23] == 8'd131)
			begin
				Integer_Value = {a_operand[22:19],19'd0};
				exp = 8'd4; 
			end

	else if (a_operand[30:23] == 8'd132)
			begin
				Integer_Value = {a_operand[22:18],18'd0};
				exp = 8'd5; 
			end

	else if (a_operand[30:23] == 8'd133)
			begin
				Integer_Value = {a_operand[22:17],17'd0};
				exp = 8'd6; 
			end

	else if (a_operand[30:23] == 8'd134)
			begin
				Integer_Value = {a_operand[22:16],16'd0};
				exp = 8'd7; 
			end

	else if (a_operand[30:23] == 8'd135)
			begin
				Integer_Value = {a_operand[22:15],15'd0};
				exp = 8'd8; 
			end

	else if (a_operand[30:23] == 8'd136)
			begin
				Integer_Value = {a_operand[22:14],14'd0};
				exp = 8'd9; 
			end

	else if (a_operand[30:23] == 8'd137)
			begin
				Integer_Value = {a_operand[22:13],13'd0};
				exp = 8'd10; 
			end

	else if (a_operand[30:23] == 8'd138)
			begin
				Integer_Value = {a_operand[22:12],12'd0};
				exp = 8'd11; 
			end

	else if (a_operand[30:23] == 8'd139)
			begin
				Integer_Value = {a_operand[22:11],11'd0};
				exp = 8'd12; 
			end

	else if (a_operand[30:23] == 8'd140)
			begin
				Integer_Value = {a_operand[22:10],10'd0};
				exp = 8'd13; 
			end

	else if (a_operand[30:23] == 8'd141)
			begin
				Integer_Value = {a_operand[22:9],9'd0};
				exp = 8'd14; 
			end

	else if (a_operand[30:23] == 8'd142)
			begin
				Integer_Value = {a_operand[22:8],8'd0};
				exp = 8'd15; 
			end

	else if (a_operand[30:23] == 8'd143)
			begin
				Integer_Value = {a_operand[22:7],7'd0};
				exp = 8'd16; 
			end

	else if (a_operand[30:23] == 8'd144)
			begin
				Integer_Value = {a_operand[22:6],6'd0};
				exp = 8'd17; 
			end

	else if (a_operand[30:23] == 8'd145)
			begin
				Integer_Value = {a_operand[22:5],5'd0};
				exp = 8'd18; 
			end

	else if (a_operand[30:23] == 8'd146)
			begin
				Integer_Value = {a_operand[22:4],4'd0};
				exp = 8'd19; 
			end

	else if (a_operand[30:23] == 8'd147)
			begin
				Integer_Value = {a_operand[22:3],3'd0};
				exp = 8'd20; 
			end

	else if (a_operand[30:23] == 8'd148)
			begin
				Integer_Value = {a_operand[22:2],2'd0};
				exp = 8'd21; 
			end

	else if (a_operand[30:23] == 8'd149)
			begin
				Integer_Value = {a_operand[22:1],1'd0};
				exp = 8'd22; 
			end

	else if (a_operand[30:23] >= 8'd150)
			begin
				Integer_Value = a_operand[22:0];
				exp = 8'd23; 
			end

	else if (a_operand[30:23] <= 8'd126)
			begin
				Integer_Value = 24'd0;
				exp = 8'd0; 
			end
end

assign Integer = {Integer_Value[23:0],8'b0};

endmodule

