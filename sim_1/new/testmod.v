`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2022 03:59:10 PM
// Design Name: 
// Module Name: testmod
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


module testmod();

reg [3:0] B1;
reg [3:0] B2;
reg clk_in;
reg push;
wire [3:0] Anode_Activate;
wire [7:0] seg;

main uut(B1, B2, seg, clk_in, Anode_Activate, push);

initial begin
B1 = 0;
B2 = 0;
clk_in = 0;
push = 0;
forever begin
    #10 clk_in = ~clk_in;
end
end

initial begin

//set all digits to 9. (1)

for(integer i = 0; i < 9; i = i + 1)begin
    #50; 
    B1[0] = 1;
    #50;
    B1[0] = 0;
end

for(integer j = 0; j < 9; j = j + 1)begin
    #50; 
    B1[1] = 1;
    #50;
    B1[1] = 0;
end

for(integer k = 0; k < 9; k = k + 1)begin
    #50; 
    B1[2] = 1;
    #50;
    B1[2] = 0;
end

for(integer y = 0; y < 9; y = y + 1)begin
    #50; 
    B1[3] = 1;
    #50;
    B1[3] = 0;
end

#300;
//multiplication (2)

B2[2] = 1;
#50;
B2[2] = 0;
#300;
//addition (3) 

B2[0] = 1;
#50;
B2[0] = 0;
#300;

//Subtraction (4) 

B2[1] = 1;
#50;
B2[1] = 0;
#300;

//Division (5) 

B2[3] = 1;
#50;
B2[3] = 0;
#300;

//Display 99 99 again. (6) 

push = 1;
#50;
push = 0;
#1000;


//Display 99 98. (7)

for(integer a = 0; a < 9; a = a + 1)begin
    #50; 
    B1[3] = 1;
    #50;
    B1[3] = 0;
end

#1000;

//Subtraction (8)

B2[1] = 1;
#50;
B2[1] = 0;
#1000;


//Division (9)

B2[3] = 1;
#50;
B2[3] = 0;
#1000;

//Display 99 98 again. (10) 

push = 1;
#50;
push = 0;
#1000;

//Display 32 98. (11)

for(integer b = 0; b < 4; b = b + 1)begin
    #50; 
    B1[0] = 1;
    #50;
    B1[0] = 0;
end

for(integer c = 0; c < 3; c = c + 1)begin
    #50; 
B1[1] = 1;
#50;
B1[1] = 0;
end

#1000;

//Subtraction. (12)

B2[1] = 1;
#50;
B2[1] = 0;
#1000;


//Division. (13)

B2[3] = 1;
#50;
B2[3] = 0;
#1000;

//Multiplication. (14)


B2[2] = 1;
#50;
B2[2] = 0;
#1000;

//Display 32 98 again. (15)

push = 1;
#50;
push = 0;
#1000;


//Display 32 10. (16)

for(integer d = 0; d < 2; d = d + 1)begin
    #50; 
    B1[2] = 1;
    #50;
    B1[2] = 0;
end

for(integer e = 0; e < 2; e = e + 1)begin
    #50; 
B1[3] = 1;
#50;
B1[3] = 0;
end

#1000;

//Division. (17)

B2[3] = 1;
#50;
B2[3] = 0;
#1000;

end
endmodule
