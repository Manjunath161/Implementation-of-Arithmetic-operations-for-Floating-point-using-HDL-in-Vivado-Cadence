`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 23:40:54
// Design Name: 
// Module Name: Add_Sub
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


`include "Equalizer.v" 
`include "priority_encoder.v"

module Add_Sub(
    input [31:0] a_operand,b_operand,
    input AddBar_Sub,
    output [31:0] result,
    output Exception
    );
    
wire operation_sub_addBar;
wire output_sign;

wire [31:0] operand_a,operand_b;

wire [23:0] significand_a;
wire [23:0] significand_b_add_sub;

wire [24:0] significand_add;
wire [30:0] add_sum;

wire [23:0] significand_sub_complement;
wire [24:0] significand_sub;
wire [30:0] sub_diff;
wire [24:0] subtraction_diff; 
wire [7:0] exponent_sub;

Equalizer eq(a_operand,b_operand,AddBar_Sub,significand_a,significand_b_add_sub,Exception,output_sign,operation_sub_addBar,perform,operand_a,operand_b);

///////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------ADD BLOCK------------------------------------------//

assign significand_add = (perform & operation_sub_addBar) ? (significand_a + significand_b_add_sub) : 25'd0; 

//Result will be equal to Most 23 bits if carry generates else it will be Least 22 bits.
assign add_sum[22:0] = significand_add[24] ? significand_add[23:1] : significand_add[22:0];

//If carry generates in sum value then exponent must be added with 1 else feed as it is.
assign add_sum[30:23] = significand_add[24] ? (1'b1 + operand_a[30:23]) : operand_a[30:23];

///////////////////////////////////////////////////////////////////////////////////////////////////////
//------------------------------------------------SUB BLOCK------------------------------------------//

assign significand_sub_complement = (perform & !operation_sub_addBar) ? ~(significand_b_add_sub) + 24'd1 : 24'd0 ; 

assign significand_sub = perform ? (significand_a + significand_sub_complement) : 25'd0;

priority_encoder pe(significand_sub,operand_a[30:23],subtraction_diff,exponent_sub);

assign sub_diff[30:23] = exponent_sub;

assign sub_diff[22:0] = subtraction_diff[22:0];

///////////////////////////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------OUTPUT--------------------------------------------//

//If there is no exception and operation will evaluate

assign result = Exception ? 32'b0 : ((!operation_sub_addBar) ? {output_sign,sub_diff} : {output_sign,add_sum});

endmodule