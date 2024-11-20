`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2023/10/19 16:34:58
// Design Name:
// Module Name: selling_machine
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


// module selling_machine(input clk,
//                        input clk_slow,
//                        input clr,
//                        input [1:0] step,
//                        output reg [1:0] out,
//                        output [3:0] sel,
//                        output [6:0] seg,
//                        output dp);
//     parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
//     reg [2:0] next_state;
//     reg [2:0] cur_state;
//     disp dis(clk,{1'b0,1'b0,cur_state[2],cur_state[1]},{1'b0,cur_state[0],1'b0,cur_state[0]},sel,seg,dp); //use cur_state to express Q0,Q1
//     always @(posedge clk_slow, posedge clr) begin
//         if (clr)
//             cur_state <= s0;
//         else
//             cur_state <= next_state;
//     end

//     always @(cur_state,clr) begin
//         if (clr)
//             out = 2'b00;
//         else
//             case(cur_state)
//                 s0: out      = 2'b00;
//                 s1: out      = 2'b00;
//                 s2: out      = 2'b00;
//                 s3: out      = 2'b10;
//                 s4: out      = 2'b11;
//                 default: out = 2'b00;
//             endcase
//     end

//     always @(cur_state,step) begin
//         case(cur_state)
//             s0: if (step == 2'b00)
//             next_state <= s0;
//             else if (step == 2'b01)
//             next_state <= s1;
//             else if (step == 2'b10)
//             next_state <= s2;
//             s1: if (step == 2'b00)
//             next_state <= s1;
//             else if (step == 2'b01)
//             next_state <= s2;
//             else if (step == 2'b10)
//             next_state <= s3;
//             s2: if (step == 2'b00)
//             next_state <= s2;
//             else if (step == 2'b01)
//             next_state <= s3;
//             else if (step == 2'b10)
//             next_state <= s4;
//             s3: if (step == 2'b00)
//             next_state <= s0;
//             else if (step == 2'b01)
//             next_state <= s1;
//             else if (step == 2'b10)
//             next_state <= s2;
//             s4: if (step == 2'b00)
//             next_state <= s0;
//             else if (step == 2'b01)
//             next_state <= s1;
//             else if (step == 2'b10)
//             next_state          <= s2;
//             default: next_state <= s0;
//         endcase
//     end

// endmodule
module selling_machine(input clk,
                       input clk_slow,
                       input clr,
                       input [1:0] step,
                       output reg [1:0] out,
                       output [3:0] sel,
                       output [6:0] seg,
                       output dp);
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
    reg [2:0] next_state;
    reg [2:0] cur_state;
    disp dis(clk,{1'b0,1'b0,cur_state[2],cur_state[1]},{1'b0,cur_state[0],1'b0,cur_state[0]},sel,seg,dp); //use cur_state to express Q0,Q1
    always @(posedge clk_slow, posedge clr) begin
        if (clr)
            cur_state <= s0;
        else
            cur_state <= next_state;
    end
    
    always @(cur_state,clr,step) begin
        case(cur_state)
            s0: begin
                out = 2'b00;
                if (step == 2'b00) begin
                    next_state <= s0;
                end
                else if (step == 2'b01)
                next_state <= s1;
                else if (step == 2'b10)
                next_state <= s2;
            end
            s1: begin
                out = 2'b00;
                if (step == 2'b00) begin
                    next_state <= s1;
                end
                else if (step == 2'b01)
                next_state <= s2;
                else if (step == 2'b10)
                next_state <= s3;
            end
            s2: begin
                out = 2'b00;
                if (step == 2'b00) begin
                    next_state <= s2;
                end
                else if (step == 2'b01)
                next_state <= s3;
                else if (step == 2'b10)
                next_state <= s4;
            end
            s3: begin
                out = 2'b10;
                if (step == 2'b00) begin
                    next_state <= s0;
                end
                else if (step == 2'b01)
                next_state <= s1;
                else if (step == 2'b10)
                next_state <= s2;
            end
            s4: begin
                out = 2'b11;
                if (step == 2'b00) begin
                    next_state <= s0;
                end
                else if (step == 2'b01)
                next_state <= s1;
                else if (step == 2'b10)
                next_state <= s2;
            end
            default: begin
                out = 3'b000;
                next_state <= s0;
            end
        endcase
    end
    
endmodule
