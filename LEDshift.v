`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2023 02:10:51 PM
// Design Name: 
// Module Name: LEDshift
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


module LEDshift(
    input clk,
    input advance,
    input mode,
    input Din,
    input reset,
    output [7:0] out
    );
    wire [7:0] q;
    wire [7:0] d;
    assign d[0] = (mode & Din) | (~mode & q[1]);
    assign d[1] = (mode & q[0]) | (~mode & q[2]);
    assign d[2] = (mode & q[1]) | (~mode & q[3]);
    assign d[3] = (mode & q[2]) | (~mode & q[4]);
    assign d[4] = (mode & q[3]) | (~mode & q[5]);
    assign d[5] = (mode & q[4]) | (~mode & q[6]);
    assign d[6] = (mode & q[5]) | (~mode & q[7]);
    assign d[7] = (mode & q[6]) | (~mode & Din);
    
    FDRE #(.INIT(1'b0)) s0 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[0]), .Q(q[0])); 
    FDRE #(.INIT(1'b0)) s1 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[1]), .Q(q[1]));
    FDRE #(.INIT(1'b0)) s2 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[2]), .Q(q[2]));
    FDRE #(.INIT(1'b0)) s3 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[3]), .Q(q[3]));
    FDRE #(.INIT(1'b0)) s4 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[4]), .Q(q[4]));
    FDRE #(.INIT(1'b0)) s5 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[5]), .Q(q[5]));
    FDRE #(.INIT(1'b0)) s6 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[6]), .Q(q[6]));
    FDRE #(.INIT(1'b0)) s7 (.C(clk), .CE(advance), .R((~mode & q[0]) | (mode & q[7]) | reset), .D(d[7]), .Q(q[7]));
    
    assign out = q;
endmodule
