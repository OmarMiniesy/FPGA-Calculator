`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 12:55:45 PM
// Design Name: 
// Module Name: BCD_control
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


module BCD_control(
input [7:0] digit1,
input [7:0] digit2,
input [7:0] digit3,
input [7:0] digit4,
input [1:0] refreshcounter,
output reg [7:0] ONE_DIGIT =0,
input [1:0] clk_in
    );
    
    always @ (clk_in)
    begin 
    case (refreshcounter)
     2'd0:
       ONE_DIGIT = digit1;
     2'd1:
        ONE_DIGIT = digit2;
     2'd2:
        ONE_DIGIT = digit3;
     2'd3:
        ONE_DIGIT = digit4;
     endcase 
     end 
    
endmodule
