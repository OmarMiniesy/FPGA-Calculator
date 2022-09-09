`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 09:20:24 AM
// Design Name: 
// Module Name: decoder
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


module decoder ( seg, num, clk_in);

    input [7:0] seg;
    output reg [3:0] num = 0;
    input [1:0] clk_in;
    
    
   always @ (posedge clk_in) begin 
         
         case (seg) //case statement
                   8'b11000000  : num = 0;
                   8'b11111001  : num = 1;
                   8'b10100100  : num = 2;
                   8'b10110000  : num = 3;
                   8'b10011001  : num = 4;
                   8'b10010010  : num = 5;
                   8'b10000010  : num = 6;
                   8'b11111000  : num = 7;
                   8'b10000000  : num = 8;
                   8'b10010000  : num = 9;
                   //switch off 7 segment character when the bcd digit is not a decimal number.
                   default : num = 8'b11111111; 
         endcase
       end
    
endmodule
