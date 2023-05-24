`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 09:33:50 PM
// Design Name: 
// Module Name: EdgeDetector
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


module EdgeDetector(
    input clk,
    input btn,
    output out
    );
    wire Q0;
    
    FDRE #(.INIT(1'b0) ) edge0 (.CE(1'b1), .C(clk), .R(), .D(btn), .Q(Q0));
    
    assign out = btn & ~Q0;
endmodule
