`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 09:40:32 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [15:0] N,
    input [3:0] sel,
    output [3:0] H
    );
    
    assign H = (N[15:12] & {sel[3], sel[3], sel[3], sel[3]}) | 
               (N[11:8] & {sel[2], sel[2], sel[2], sel[2]}) |
               (N[7:4] & {sel[1], sel[1], sel[1], sel[1]}) |
               (N[3:0] & {sel[0], sel[0], sel[0], sel[0]});
endmodule
