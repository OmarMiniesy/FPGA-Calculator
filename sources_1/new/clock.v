`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 01:12:54 PM
// Design Name: 
// Module Name: clock
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
/////////////////////////////////////////////////////////////////////////////////

module clock #(parameter n = 50) (input in, output reg out);
reg [31:0] count;
initial out = 0;
initial count = 0; 
always @ (posedge(in)) begin // Asynchronous Reset
if (count == n-1)
count <= 0;
else
begin count <= count+1;end
end
// Handle the output clock
always @ (posedge(in)) begin // Asynchronous Reset
if (count == n-1)
out <= out;
else
out <=~ out;
end
endmodule
