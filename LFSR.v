`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2023 04:01:14 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input clk,
    output [7:0] rnd
    );
    wire xor_in;
    assign xor_in = ^{rnd[0],rnd[5],rnd[6],rnd[7]};
    FDRE #(.INIT(1'b0) ) FF0 (.C(clk), .R(1'b0), .CE(1'b1), .D(xor_in), .Q(rnd[0]));
    FDRE #(.INIT(1'b0) ) FF1 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[0]), .Q(rnd[1]));
    FDRE #(.INIT(1'b0) ) FF2 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[1]), .Q(rnd[2]));
    FDRE #(.INIT(1'b0) ) FF3 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[2]), .Q(rnd[3]));
    FDRE #(.INIT(1'b0) ) FF4 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[3]), .Q(rnd[4]));
    FDRE #(.INIT(1'b0) ) FF5 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[4]), .Q(rnd[5]));
    FDRE #(.INIT(1'b0) ) FF6 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[5]), .Q(rnd[6]));
    FDRE #(.INIT(1'b1) ) FF7 (.C(clk), .R(1'b0), .CE(1'b1), .D(rnd[6]), .Q(rnd[7]));
endmodule
