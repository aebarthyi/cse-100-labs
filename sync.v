`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 09:30:53 PM
// Design Name: 
// Module Name: sync
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


module sync(
    input [3:0] d,
    input clk,
    output [3:0] q
    );
    
    FDRE #(.INIT(1'b0) ) sync0 (.C(clk), .CE(1'b1), .R(1'b0), .D(d[0]), .Q(q[0]));
    FDRE #(.INIT(1'b0) ) sync1 (.C(clk), .CE(1'b1), .R(1'b0), .D(d[1]), .Q(q[1]));
    FDRE #(.INIT(1'b0) ) sync2 (.C(clk), .CE(1'b1), .R(1'b0), .D(d[2]), .Q(q[2]));
    FDRE #(.INIT(1'b0) ) sync3 (.C(clk), .CE(1'b1), .R(1'b0), .D(d[3]), .Q(q[3]));
endmodule
