`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2023 11:06:46 PM
// Design Name: 
// Module Name: vga_control
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


module vga_control(
    input clk,
    output [3:0] Red,
    output [3:0] Blue,
    output [3:0] Green,
    output Hsync,
    output Vsync,
    output [10:0] Hpixel,
    output [10:0] Vpixel
    );
    
    wire [10:0] Hbound1, Hbound2;
    wire [10:0] Vbound1, Vbound2;
    
    assign Hbound1 = 11'd655;
    assign Hbound2 = 11'd750;
    
    assign Vbound1 = 11'd489;
    assign Vbound2 = 11'd490;
    
    wire [10:0] Hreset;
    wire [10:0] Vreset;
    
    wire Hactive;
    wire Vactive;
    wire active;
    wire [15:0] hOut;
    wire [15:0] vOut;
    
    assign Hactive = (hOut < 10'd640);
    assign Vactive = (vOut < 10'd480);
    assign active = Hactive && Vactive;
    
    assign Hreset = 10'd799;
    assign Vreset = 10'd524;
    
    countUD15L Hori (.clk(clk), .Up(1'b1), .Dw(1'b0), .LD(Hreset == hOut), .Din(16'h0000), .Q(hOut));
    countUD15L Vert (.clk(clk), .Up(Hreset == hOut), .Dw(1'b0), .LD(Vreset == vOut & Hreset == hOut), .Din(16'h0000), .Q(vOut));
    
    assign Hsync = (hOut < Hbound1) || (hOut > Hbound2);
    assign Vsync = (vOut < Vbound1) || (vOut > Vbound2);
    
    assign Hpixel = hOut [10:0];
    assign Vpixel = vOut [10:0];
    
    assign vgaRed = 4'b1111 & {4{active}};
    assign vgaBlue = 4'b1111 & {4{active}};
    assign vgaGreen = 4'b1111 & {4{active}};
endmodule
