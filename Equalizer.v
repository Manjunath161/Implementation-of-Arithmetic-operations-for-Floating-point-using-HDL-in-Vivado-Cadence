`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 23:42:43
// Design Name: 
// Module Name: Equalizer
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


module Equalizer(
    input [31:0] a_operand,b_operand,
    input AddBar_Sub,
    output [23:0] significand_a,significand_b_add_sub,
    output Exception,output_sign,operation_sub_addBar,perform,
    output [31:0] operand_a,operand_b
    );

wire Comp_enable;
wire [23:0] significand_b;
wire [7:0] exponent_diff,exp_a,exp_b;
wire [7:0] exponent_b_add_sub;

//for operations always operand_a must not be less than b_operand
assign {Comp_enable,operand_a,operand_b} = (a_operand[30:0] < b_operand[30:0]) ? {1'b1,b_operand,a_operand} : {1'b0,a_operand,b_operand};

assign exp_a = operand_a[30:23];
assign exp_b = operand_b[30:23];

//Exception flag sets 1 if either one of the exponent is 255.
assign Exception = (&operand_a[30:23]) | (&operand_b[30:23]);

assign output_sign = AddBar_Sub ? Comp_enable ? !operand_a[31] : operand_a[31] : operand_a[31] ;

assign operation_sub_addBar = AddBar_Sub ? operand_a[31] ^ operand_b[31] : ~(operand_a[31] ^ operand_b[31]);

//Assigining significand values according to Hidden Bit.
//If exponent is equal to zero then hidden bit will be 0 for that respective significand else it will be 1
assign significand_a = (|operand_a[30:23]) ? {1'b1,operand_a[22:0]} : {1'b0,operand_a[22:0]};
assign significand_b = (|operand_b[30:23]) ? {1'b1,operand_b[22:0]} : {1'b0,operand_b[22:0]};

//Evaluating Exponent Difference
assign exponent_diff = operand_a[30:23] - operand_b[30:23];

//Shifting significand_b according to exponent_diff
assign significand_b_add_sub = significand_b >> exponent_diff;

assign exponent_b_add_sub = operand_b[30:23] + exponent_diff; 

//Checking exponents are same or not
assign perform = (operand_a[30:23] == exponent_b_add_sub);    
    
endmodule