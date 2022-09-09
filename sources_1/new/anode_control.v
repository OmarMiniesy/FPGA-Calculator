`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:17:57 PM
// Design Name: 
// Module Name: anode_control
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


module anode_control(
input [1:0] refreshcounter, input clk_in,
output reg [3:0] anode = 0
    );
    
 always @ (clk_in)
    begin 
    case (refreshcounter)
     2'd0:
        anode = 4'b0111;
     2'd1:
        anode = 4'b1011;
     2'd2:
       anode = 4'b1101;
     2'd3:
        anode = 4'b1110;
      endcase 
     end 
endmodule
