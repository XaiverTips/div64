`timescale 1ns / 1ps

module x64_cbn(
    input clk,
    input rst,
    input [7:0] data_i,
    output reg [63:0] data_o_a,
    output reg [63:0] data_o_b,
    output reg output_en,
    output reg output_en1,
    output reg [3:0] cnt
    );
reg [3:0] cnt;
reg [127:0] data_o_temp;

always@(posedge clk or negedge rst)
begin
if(!rst)
begin
    cnt=0;
    output_en<=0;
    data_o_temp<=0;
end
else
    begin
    if(cnt == 0)
    begin
        cnt <= cnt + 1;
        output_en<=1;
        data_o_a<=data_o_temp[63:0];
        data_o_b<=data_o_temp[127:64];
        data_o_temp[127:8]<= data_o_temp[119:0];
        data_o_temp[7:0]<= data_i;
    end
else
    begin
        output_en<=0;        
        cnt <= cnt + 1;
        data_o_temp[127:8]<= data_o_temp[119:0];
        data_o_temp[7:0]<= data_i;
    end

//     if(cnt==16)
//     begin
//         cnt=0;
//         output_en=1;
//         data_o_a=data_o_temp[63:0];
//         data_o_b=data_o_temp[127:64];
// end
// else
//     begin
//         data_o_temp[127:8]= data_o_temp[119:0];
//         data_o_temp[7:0]= data_i;
//         cnt = cnt + 1;
//         output_en=0;
//     end


end
end
always@(posedge clk)
begin
    output_en1<=output_en;
end


endmodule