`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 11:33:15 AM
// Design Name: 
// Module Name: countUD15L
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


module countUD15L(
    input [14:0] Din,
    input Up,
    input Dw,
    input LD,
    input clk,
    output [14:0] Q,
    output UTC,
    output DTC
    );
    wire [2:0]utc;
    wire [2:0]dtc;
    
    countUD5L count2(.clk(clk),.Din(Din[14:10]),.Up(Up & utc[0] & utc[1]),.Dw(Dw & dtc[0] & dtc[1]),.LD(LD),.Q(Q[14:10]),.UTC(utc[2]),.DTC(dtc[2]));
    countUD5L count1(.clk(clk),.Din(Din[9:5]),.Up(Up & utc[0]),.Dw(Dw & dtc[0]),.LD(LD),.Q(Q[9:5]),.UTC(utc[1]),.DTC(dtc[1]));
    countUD5L count0(.clk(clk),.Din(Din[4:0]),.Up(Up),.Dw(Dw),.LD(LD),.Q(Q[4:0]),.UTC(utc[0]),.DTC(dtc[0]));
    
    assign UTC = utc[0] & utc[1] & utc[2];
    assign DTC = dtc[0] & dtc[1] & dtc[2];
    
endmodule
