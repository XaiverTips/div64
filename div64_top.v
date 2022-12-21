`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/27 15:26:43
// Design Name: 
// Module Name: div64_top
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


module div64_top(
    clk,rst,sel,data_in,data_out,done,err);
    input clk;
    input rst;
    input sel;
    input [7:0] data_in;

    output [7:0] data_out;

    output done;
    output err;
    wire [3:0] cnt;
    wire [63:0] data_o_a;
    wire [63:0] data_o_b;
    wire [63:0] yshang;
    wire [63:0] yyushu;
    wire output_en;
    wire output_en1;


x64_cbn u1(.cnt(cnt),.clk(clk),.rst(rst),.data_i(data_in),.data_o_a(data_o_a),.data_o_b(data_o_b),.output_en(output_en),.output_en1(output_en1));
div64n u2(.clk(clk),.a(data_o_a),.b(data_o_b),.enable(output_en),.sel(sel),.yshang(yshang),.yyushu(yyushu),.err(err));
x64_bc u3(.cnt(cnt),.clk(clk),.rst(rst),.in_enable(output_en),.data_i_a(yshang),.data_i_b(yyushu),.data_o(data_out),.done(done));


endmodule
