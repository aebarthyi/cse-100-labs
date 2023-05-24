`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 01:15:06 PM
// Design Name: 
// Module Name: AddSub8
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


module AddSub8(
    input [7:0] A,
    input [7:0] B,
    input sub,
    output [7:0] S,
    output ovfl
    );
    
    wire [7:0] inverse;
    wire [7:0] sum;
    wire [7:0] subB;
    
    assign inverse = {~A};
    Add8 add(.A(inverse[7:0]), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .cin(1'b1), .Cout(), .S(sum[7:0]));
    multiplexer_8bits select(.i0(B[7:0]),.i1(sum[7:0]),.s(sub),.out(subB[7:0]));
    Add8 addFinal(.A(A[7:0]), .B(subB[7:0]), .cin(1'b0), .Cout(ovfl), .S(S[7:0]));
    
endmodule
    

