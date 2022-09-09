`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 11:27:17 AM
// Design Name: 
// Module Name: main
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


module main(B1, B2, seg, clk_in, Anode_Activate, push);

input [3:0] B1;
input [3:0] B2;
input clk_in;
//input reset;
input push;
output [3:0] Anode_Activate;
output [7:0] seg;
reg counter =1;

wire [7:0] seg1;
wire [7:0] seg2;
wire [7:0] seg3;
wire [7:0] seg4;

wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;
wire [3:0] num4;

reg [7:0] newnum1 = 0;
reg [7:0] newnum2 = 0;
reg [7:0] finalnum = 0;
reg [13:0] resultmultiply = 0;
reg [7:0] resultsubtract = 0;
reg [7:0] resultdivide = 0;
reg status = 1;

reg [7:0] om11 = 0;
reg [7:0] om22 = 0;
reg [7:0] om33 = 0;
reg [7:0] om43 = 0;

reg [3:0] digits1 = 0;
reg [3:0] digits2 = 0;
reg [3:0] digits3 = 0;
reg [3:0] digits4 = 0;

reg [7:0] none = 0;
reg [7:0] ntwo = 0;
reg [7:0] nthree = 0;
reg [7:0] nfour = 0;

wire [1:0] clk_out;
wire [1:0] refresh_clock;

wire push_edge;
wire add_fix;
wire sub_fix;
wire mul_fix;
wire div_fix;
wire reset_fix;

clock #(5000)c(.in(clk_in), .out(clk_out));
refreshcounter ref (.refresh_clock(clk_out), .refreshcounter(refresh_clock));
anode_control x(.refreshcounter(refresh_clock), .anode(Anode_Activate), .clk_in(clk_out));

decoder de1(.seg(seg1), .num(num1), .clk_in(refresh_clock));
decoder de11(.seg(seg2), .num(num2), .clk_in(refresh_clock));
decoder de12(.seg(seg3), .num(num3), .clk_in(refresh_clock));
decoder de13(.seg(seg4), .num(num4), .clk_in(refresh_clock));


always @ (posedge clk_out)begin
 if (B2[0] ==1)
    begin        //add
        
        newnum1 = num1*10 + num2;
        newnum2 = num3*10 + num4;
        finalnum = newnum1 + newnum2;
        digits4 = finalnum%10; finalnum = finalnum/10;
        digits3 = finalnum%10; finalnum = finalnum/10;
        digits2 = finalnum%10; finalnum = finalnum/10;
        digits1 = 0;
       counter = 0;
        
    end
else if (B2[1] ==1)
    begin        //sub
        newnum1 = num1*10 + num2;
        newnum2 = num3*10 + num4;
        if(newnum1 >= newnum2)begin
            resultsubtract = newnum1 - newnum2;
            digits4 = resultsubtract%10; resultsubtract = resultsubtract/10;
            digits3 = resultsubtract%10; 
            digits2 = 0;
            digits1 = 0;
        end else begin
        resultsubtract = newnum2 - newnum1;
        digits4 = resultsubtract%10; resultsubtract = resultsubtract/10;
        digits3 = resultsubtract%10; 
        digits2 = 0;
        digits1 = 10;    
        end        
        counter =0;

    end
else   if (B2[2] ==1)
    begin        //multiply
     newnum1 = num1*10 + num2;
     newnum2 = num3*10 + num4;
     resultmultiply = newnum1 * newnum2;  
     digits4 = resultmultiply%10; resultmultiply = resultmultiply/10;
     digits3 = resultmultiply%10; resultmultiply = resultmultiply/10;
     digits2 = resultmultiply%10; resultmultiply = resultmultiply/10;
     digits1 = resultmultiply%10;
     counter =0;

    end        
else if (B2[3] ==1)
    begin        //divide
        
         newnum1 = num1*10 + num2;
         newnum2 = num3*10 + num4;
         if (newnum2 ==0 & newnum1 !=0) begin 
         digits4= 14;
         digits3=13;
         digits2=12;
         digits1=11;
         end 
         else begin
         resultdivide = newnum1 / newnum2;
         digits4 = resultdivide%10; resultdivide = resultdivide/10;
         digits3 = resultdivide%10; resultdivide = resultdivide/10;
         digits2 = 0;
         digits1 = 0; end
        counter =0;
     end
else if (push == 1)begin
    counter = 1;
end
end

always @ (posedge clk_in)begin
    case (digits1) //case statement
         0 : none = 8'b11000000;
         1 : none = 8'b11111001;
         2 : none = 8'b10100100;
         3 : none = 8'b10110000;
         4 : none = 8'b10011001;
         5 : none = 8'b10010010;
         6 : none = 8'b10000010;
         7 : none = 8'b11111000;
         8 : none = 8'b10000000;
         9 : none = 8'b10010000;
         10 : none = 8'b10111111;
         11 : none = 8'b11111111;
         12 : none = 8'b10000110;
         13 : none = 8'b10101111;
         14 : none = 8'b10101111;
         //switch off 7 segment character when the bcd digit is not a decimal number.
         default : none = 8'b11111111;   endcase
         case (digits2) //case statement
                  0 : ntwo = 8'b11000000;
                  1 : ntwo = 8'b11111001;
                  2 : ntwo = 8'b10100100;
                  3 : ntwo = 8'b10110000;
                  4 : ntwo = 8'b10011001;
                  5 : ntwo = 8'b10010010;
                  6 : ntwo = 8'b10000010;
                  7 : ntwo = 8'b11111000;
                  8 : ntwo = 8'b10000000;
                  9 : ntwo = 8'b10010000;
                  10 : ntwo = 8'b10111111;
                  11 : ntwo = 8'b11111111;
                  12 : ntwo = 8'b10000110;
                  13 : ntwo = 8'b10101111;
                  14 : ntwo = 8'b10101111;
                  //switch off 7 segment character when the bcd digit is not a decimal number.
                  default : ntwo = 8'b11111111; endcase
                  case (digits3) //case statement
                           0 : nthree = 8'b11000000;
                           1 : nthree = 8'b11111001;
                           2 : nthree = 8'b10100100;
                           3 : nthree = 8'b10110000;
                           4 : nthree = 8'b10011001;
                           5 : nthree = 8'b10010010;
                           6 : nthree = 8'b10000010;
                           7 : nthree = 8'b11111000;
                           8 : nthree = 8'b10000000;
                           9 : nthree = 8'b10010000;
                           10 : nthree = 8'b10111111;
                           11 : nthree = 8'b11111111;
                           12 : nthree = 8'b10000110;
                           13 : nthree = 8'b10101111;
                           14 : nthree = 8'b10101111;
                           //switch off 7 segment character when the bcd digit is not a decimal number.
                           default : nthree = 8'b11111111; endcase
                           case (digits4) //case statement
                                    0 : nfour = 8'b11000000;
                                    1 : nfour = 8'b11111001;
                                    2 : nfour = 8'b10100100;
                                    3 : nfour = 8'b10110000;
                                    4 : nfour = 8'b10011001;
                                    5 : nfour = 8'b10010010;
                                    6 : nfour = 8'b10000010;
                                    7 : nfour = 8'b11111000;
                                    8 : nfour = 8'b10000000;
                                    9 : nfour = 8'b10010000;
                                    10 : nfour = 8'b10111111;
                                    11 : nfour = 8'b11111111;
                                    12 : nfour = 8'b10000110;
                                    13 : nfour = 8'b10101111;
                                    14 : nfour = 8'b10101111;
                                    //switch off 7 segment character when the bcd digit is not a decimal number.
                                    default : nfour = 8'b11111111;   
endcase
end


count one(.seg(seg1), .Button(B1[0]), .clk_in(clk_out), .Anode_Activate(Anode_Activate), .status(status));
count two(.seg(seg2), .Button(B1[1]), .clk_in(clk_out), .Anode_Activate(Anode_Activate), .status(status));
count three(.seg(seg3),.Button(B1[2]),.clk_in(clk_out), .Anode_Activate(Anode_Activate), .status(status));
count four(.seg(seg4), .Button(B1[3]), .clk_in(clk_out), .Anode_Activate(Anode_Activate), .status(status));

always @ (posedge clk_in)begin
    if(counter == 1)begin
        om11 <= seg1;
        om22 <= seg2;
        om33 <= seg3;
        om43 <= seg4;
    end else begin
        om11 <= none;
        om22 <= ntwo;
        om33 <= nthree;
        om43 <= nfour;
    end
end

BCD_control y(.digit1(om11), .digit2(om22), .digit3(om33), .digit4(om43), .refreshcounter(refresh_clock), .ONE_DIGIT(seg), .clk_in(clk_out));

endmodule