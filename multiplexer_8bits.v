`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 01:02:36 PM
// Design Name: 
// Module Name: multiplexer_8bits
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


module multiplexer_8bits(
    input [7:0] i0,
    input [7:0] i1,
    input s,
    output [7:0] out
    );
    assign out[0] = (~s & i0[0]) | (s & i1[0]);
    assign out[1] = (~s & i0[1]) | (s & i1[1]);
    assign out[2] = (~s & i0[2]) | (s & i1[2]);
    assign out[3] = (~s & i0[3]) | (s & i1[3]);
    assign out[4] = (~s & i0[4]) | (s & i1[4]);
    assign out[5] = (~s & i0[5]) | (s & i1[5]);
    assign out[6] = (~s & i0[6]) | (s & i1[6]);
    assign out[7] = (~s & i0[7]) | (s & i1[7]);
endmodule
