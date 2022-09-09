`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2022 01:15:43 PM
// Design Name: 
// Module Name: refreshcounter
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


module refreshcounter(
input [1:0] refresh_clock,
output reg [1:0] refreshcounter = 0
    );
    
    always @ (posedge refresh_clock) begin
    refreshcounter <= refreshcounter +1;
    end
endmodule
