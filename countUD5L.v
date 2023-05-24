`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 08:35:42 PM
// Design Name: 
// Module Name: countUD5L
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


module countUD5L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [4:0] Din,
    output [4:0] Q,
    output UTC,
    output DTC
    );
    wire [4:0]up;
    wire [4:0]down;
    wire [4:0]d;
    wire ce;
    
    assign up[0] = Q[0] ^ ce;
    assign up[1] = Q[1] ^ (ce & Q[0]);
    assign up[2] = Q[2] ^ (ce & Q[1] & Q[0]);
    assign up[3] = Q[3] ^ (ce & Q[2] & Q[1] & Q[0]);
    assign up[4] = Q[4] ^ (ce & Q[3] & Q[2] & Q[1] & Q[0]);
    
    assign down[0] = Q[0] ^ ce;
    assign down[1] = Q[1] ^ (ce & ~Q[0]);
    assign down[2] = Q[2] ^ (ce & ~Q[1] & ~Q[0]);
    assign down[3] = Q[3] ^ (ce & ~Q[2] & ~Q[1] & ~Q[0]);
    assign down[4] = Q[4] ^ (ce & ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0]);
    
    assign d[0] = ((((up[0] & Up & ~Dw) | (down[0] & ~Up & Dw)) & ~LD) | (LD & Din[0]));
    assign d[1] = ((((up[1] & Up & ~Dw) | (down[1] & ~Up & Dw)) & ~LD) | (LD & Din[1]));
    assign d[2] = ((((up[2] & Up & ~Dw) | (down[2] & ~Up & Dw)) & ~LD) | (LD & Din[2]));
    assign d[3] = ((((up[3] & Up & ~Dw) | (down[3] & ~Up & Dw)) & ~LD) | (LD & Din[3]));
    assign d[4] = ((((up[4] & Up & ~Dw) | (down[4] & ~Up & Dw)) & ~LD) | (LD & Din[4]));
    
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[4];
    assign ce = (Up ^ Dw) | LD;
    
    FDRE #(.INIT(1'b0) ) FF0 (.C(clk), .R(1'b0), .CE(ce), .D(d[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0) ) FF1 (.C(clk), .R(1'b0), .CE(ce), .D(d[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) FF2 (.C(clk), .R(1'b0), .CE(ce), .D(d[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) FF3 (.C(clk), .R(1'b0), .CE(ce), .D(d[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) FF4 (.C(clk), .R(1'b0), .CE(ce), .D(d[4]), .Q(Q[4]));
    
endmodule
