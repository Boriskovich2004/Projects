`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/10/19 19:07:15
// Design Name:
// Module Name: trans
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

module trans(input hfyen,
             input oneyen,
             input clk,
             output [1:0] money);
    reg hf_r1,hf_r2,hf_r3;
    reg one_r1,one_r2,one_r3;
    initial begin
        hf_r1  <= 0;
        hf_r2  <= 0;
        hf_r3  <= 0;
        one_r1 <= 0;
        one_r2 <= 0;
        one_r3 <= 0;
    end
    always @(posedge hfyen,posedge clk) begin
        if (hfyen) hf_r1 <= 1;
        else hf_r1       <= hfyen;
    end
    always @(posedge clk) begin
        hf_r2 <= hfyen | hf_r1;
        hf_r3 <= hf_r2 | hf_r1;
    end
    
    always @(posedge oneyen,posedge clk) begin
        if (oneyen) one_r1 <= 1;
        else one_r1        <= oneyen;
    end
    always @(posedge clk) begin
        one_r2 <= oneyen | one_r1;
        one_r3 <= one_r2 | one_r1;
    end
    
    reg hf_r4, hf_r5;
    reg one_r4, one_r5;
    initial begin
        hf_r4  <= 0;
        hf_r5  <= 0;
        one_r4 <= 0;
        one_r5 <= 0;
    end
    always @(posedge clk) begin
        hf_r4  <= hf_r3;
        one_r4 <= one_r3;
    end
    always @(posedge clk) begin
        hf_r5  <= hf_r3 & hf_r4;
        one_r5 <= one_r3 & one_r4;
    end
    assign money = {one_r4 & ~one_r5, hf_r4 & ~hf_r5};
endmodule
    
    
