`timescale 1ns / 1ps



module x64_bc(
    input clk,
    input rst,
    input in_enable,
    input [3:0] cnt,
    input [63:0] data_i_a,
    input [63:0] data_i_b,
    output reg [7:0] data_o,
    output reg done
    );
    reg [127:0] temp;
// always@(posedge clk)
// begin
//     if(in_enable)
//         temp = {data_i_b,data_i_a};
// end

always@(posedge clk or negedge rst)
begin
if(!rst)
begin
    done<=0;
    temp<=0;
end
else
begin
if(cnt==14)
begin
    data_o<=temp[127:120];
    temp <= {data_i_b,data_i_a};
end
else
    begin
        data_o<=temp[127:120];
        temp<= {temp[119:0],8'b0};
        done<=0;
    end
end
end

endmodule
