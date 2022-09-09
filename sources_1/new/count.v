`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2022 01:54:16 PM
// Design Name: 
// Module Name: count
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




module count(
     seg , Button, clk_in, Anode_Activate, status
    );
     reg temp = 0;  
     reg temp1 = 0;  
     wire temp2;   
     reg temp3 = 0;   
     input status;
     input Button;
     input [3:0] Anode_Activate;
     input [1:0]clk_in;
     //input add, subtract, multiply, divide;
     output reg [7:0] seg;
     
     reg [3:0] x = 0;

     always @(posedge clk_in) begin 
        temp <= Button;
        temp1 <=temp;
     end
     
     always @(posedge clk_in) begin 
        temp3 <=temp1;
     end
     
     assign temp2 = temp1 & ~temp3;
     
     
     always @ (posedge clk_in) begin
      if(temp2)begin
            if( x < 9)begin
                x <= x + 1;end
            else begin
                x <= 0; end
      end
      
     end
     
     always @ (posedge clk_in) begin 
          if(Anode_Activate == 4'b0111)begin
             case (x) //case statement
              0 : seg = 8'b01000000;
              1 : seg = 8'b01111001;
              2 : seg = 8'b00100100;
              3 : seg = 8'b00110000;
              4 : seg = 8'b00011001;
              5 : seg = 8'b00010010;
              6 : seg = 8'b00000010;
              7 : seg = 8'b01111000;
              8 : seg = 8'b00000000;
              9 : seg = 8'b00010000;
              10 : seg = 8'b00111111;
              11 : seg = 8'b01111111;
              12 : seg = 8'b00000110;
              13 : seg = 8'b00101111;
              14 : seg = 8'b00101111;
              //switch off 7 segment character when the bcd digit is not a decimal number.
              default : seg = 8'b11111111;      
     endcase
         end else begin
         case (x) //case statement
                       0 : seg = 8'b11000000;
                       1 : seg = 8'b11111001;
                       2 : seg = 8'b10100100;
                       3 : seg = 8'b10110000;
                       4 : seg = 8'b10011001;
                       5 : seg = 8'b10010010;
                       6 : seg = 8'b10000010;
                       7 : seg = 8'b11111000;
                       8 : seg = 8'b10000000;
                       9 : seg = 8'b10010000;
                       10 : seg = 8'b10111111;
                       11 : seg = 8'b11111111;
                       12 : seg = 8'b10000110;
                       13 : seg = 8'b10101111;
                       14 : seg = 8'b10101111;
                       //switch off 7 segment character when the bcd digit is not a decimal number.
                       default : seg = 8'b11111111;      
              endcase
         end     
          end
     
     //encoder a(.digit(x), .seven(seg), .clk_in(clk_in), .select(Anode_Activate), .status(status));
     
    
endmodule 
   