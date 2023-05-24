`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2023 12:41:03 PM
// Design Name: 
// Module Name: Add8
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


module Add8(
    input [7:0] A,
    input [7:0] B,
    input cin,
    output [7:0] S,
    output ovfl,
    output Cout
    );
    wire[7:0] carry;
    FA f1(.A(A[0]),.B(B[0]),.cin(cin),.S(S[0]),.cout(carry[0]));
    FA f2(.A(A[1]),.B(B[1]),.cin(carry[0]),.S(S[1]),.cout(carry[1]));
    FA f3(.A(A[2]),.B(B[2]),.cin(carry[1]),.S(S[2]),.cout(carry[2]));
    FA f4(.A(A[3]),.B(B[3]),.cin(carry[2]),.S(S[3]),.cout(carry[3]));
    FA f5(.A(A[4]),.B(B[4]),.cin(carry[3]),.S(S[4]),.cout(carry[4]));
    FA f6(.A(A[5]),.B(B[5]),.cin(carry[4]),.S(S[5]),.cout(carry[5]));
    FA f7(.A(A[6]),.B(B[6]),.cin(carry[5]),.S(S[6]),.cout(carry[6]));
    FA f8(.A(A[7]),.B(B[7]),.cin(carry[6]),.S(S[7]),.cout({Cout,ovfl}));
endmodule


module FA(
    input A,
    input B,
    input cin,
    output S,
    output cout
    );
    assign cout = cin & (A | B) | (A & B);
    assign S = A ^ B ^ cin;
endmodule