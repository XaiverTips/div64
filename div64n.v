`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/02 13:52:26
// Design Name: 
// Module Name: div_64_comb
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


module div64n  
(  
input[63:0] a,   
input[63:0] b,  
input enable,
input sel,
input clk,
output [63:0] yshang,  
output [63:0] yyushu,
output err
// output reg done 
);  
  
wire[63:0] tempa;  
wire[63:0] tempb;  
wire[127:0] temp_a;  
wire[127:0] temp_qa;  
wire[127:0] temp_ca;  
wire[127:0] temp_b;
wire [127:0] temp_o_a;  
integer i; 
wire c;
wire [127:0] fa;
// assign c=sel?a[63]^b[63]:0; 

sign1 a0(.a(a),.b(b),.temp_a(temp_a),.sel(sel),.yshang(yshang),.yyushu(yyushu),.fa(fa));
pre1 a1(.a(a),.b(b),.enable(enable),.sel(sel),.clk(clk),.temp_a(temp_a),.temp_b(temp_b),.err(err));
mux1 a2(.a(temp_a),.b(temp_qa),.s(enable),.c(temp_ca));
alu1 a3(.temp_a(temp_ca),.temp_b(temp_b),.temp_o_a(temp_o_a));
latch1c a4(.enable(enable),.a(temp_o_a),.qa(temp_qa),.fa(fa));


// always@(posedge clk)
// begin
//     if(enable)
//     begin
//     if(!b)
//     begin
//     err<=0;
//     if(sel)
//     begin  
//         tempa <= a[63]?(~a+1):a;  
//         tempb <= b[63]?(~b+1):b;
//     end
//     else if(sel==0)
//     begin
//         tempa<=a;
//         tempb<=b;
//     end
//     temp_a <= {64'h00000000,tempa};  
//     temp_b <= {tempb,64'h00000000};  
//     end
//     else
//     err<=1;
//     end
// end 
  
// assign yshang = c?(~temp_a[63:0]+1):temp_a[63:0]; 
// assign yyushu =sel?(a[63]?(~temp_a[127:64]+1):temp_a[127:64]):temp_a[127:64];

// always @(tempa or tempb)  
//begin  
// if(enable)
//   begin
//     if(!b)
// 	err = 1;
//     else
//     begin
//     err = 0;
//     temp_a = {64'h00000000,tempa};  
//     temp_b = {tempb,64'h00000000};  
    // done = 0; 
    
    


    // for(i = 0;i < 64;i = i + 1)  
    //     begin  
    //         temp_a = {temp_a[126:0],1'b0};  
    //         if(temp_a[127:64] >= tempb)  
    //             temp_a = temp_a - temp_b + 1'b1;  
    //         else  
    //             temp_a = temp_a;  
    //     end  
  
    // yshang = c?(~temp_a[63:0]+1):temp_a[63:0]; 
    // yyushu =sel?(a[63]?(~temp_a[127:64]+1):temp_a[127:64]):temp_a[127:64];
    // done = 1; 
//
//   end
// end  
  
endmodule
