`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 10:59:25 AM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input advance,
    input clk,
    output [3:0] out
    );
    wire [3:0] q;
    
    FDRE #(.INIT(1'b1) ) ring0 (.CE(advance), .C(clk), .R(), .D(q[3]), .Q(q[0]));
    FDRE #(.INIT(1'b0) ) ring1 (.CE(advance), .C(clk), .R(), .D(q[0]), .Q(q[1]));
    FDRE #(.INIT(1'b0) ) ring2 (.CE(advance), .C(clk), .R(), .D(q[1]), .Q(q[2]));
    FDRE #(.INIT(1'b0) ) ring3 (.CE(advance), .C(clk), .R(), .D(q[2]), .Q(q[3]));
    
    assign out = q;
    
endmodule
