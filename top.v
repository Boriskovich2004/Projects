`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/10/19 19:07:35
// Design Name:
// Module Name: top
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


module top(input hfyen,
           input oneyen,
           input clk,
           input clr,
           output [1:0] out,
           output [3:0] sel,
           output [6:0] seg,
           output dp);
    parameter N = 21;
    reg [N-1:0] regN;
    initial begin
        regN = 0;
    end
    always @(posedge clk) begin
        regN <= regN + 1;
    end
    wire [1:0] money;
    trans tr(hfyen,oneyen,regN[N-1],money);
    selling_machine sm(clk,regN[N-1],clr,money,out,sel,seg,dp);
    
endmodule
