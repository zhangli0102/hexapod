`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:48 04/21/2017 
// Design Name: 
// Module Name:    hexapod 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hexapod(
    input CLK,
    input rst,
    output zu11,
    output zu12,
    output zu13,
    output zu21,
    output zu22,
    output zu23,
    output zu31,
    output zu32,
    output zu33,
    output zu41,
    output zu42,
    output zu43,
    output zu51,
    output zu52,
    output zu53,
    output zu61,
    output zu62,
    output zu63,
    output [2:0] servo_en
    );


reg [23:0] prescaler = 0;
reg [7:0] count = 0;
reg [15:0] pul_11;
reg [15:0] pul_12;
reg [15:0] pul_13;
reg [15:0] pul_21;
reg [15:0] pul_22;
reg [15:0] pul_23;
reg [15:0] pul_41;
reg [15:0] pul_42;
reg [15:0] pul_43;
reg [15:0] pul_51;
reg [15:0] pul_52;
reg [15:0] pul_53;


assign servo_en = 3'b111;

guanjie y1(.CLK(CLK), .pul_len(pul_11), .CTL(zu11));
guanjie d1(.CLK(CLK), .pul_len(pul_12), .CTL(zu12));
guanjie x1(.CLK(CLK), .pul_len(pul_13), .CTL(zu13));
guanjie y2(.CLK(CLK), .pul_len(pul_21), .CTL(zu21));
guanjie d2(.CLK(CLK), .pul_len(pul_22), .CTL(zu22));
guanjie x2(.CLK(CLK), .pul_len(pul_23), .CTL(zu23));
guanjie y3(.CLK(CLK), .pul_len(pul_11), .CTL(zu31));
guanjie d3(.CLK(CLK), .pul_len(pul_12), .CTL(zu32));
guanjie x3(.CLK(CLK), .pul_len(pul_13), .CTL(zu33));
guanjie y4(.CLK(CLK), .pul_len(pul_41), .CTL(zu41));
guanjie d4(.CLK(CLK), .pul_len(pul_42), .CTL(zu42));
guanjie x4(.CLK(CLK), .pul_len(pul_43), .CTL(zu43));
guanjie y5(.CLK(CLK), .pul_len(pul_51), .CTL(zu51));
guanjie d5(.CLK(CLK), .pul_len(pul_52), .CTL(zu52));
guanjie x5(.CLK(CLK), .pul_len(pul_53), .CTL(zu53));
guanjie y6(.CLK(CLK), .pul_len(pul_41), .CTL(zu61));
guanjie d6(.CLK(CLK), .pul_len(pul_42), .CTL(zu62));
guanjie x6(.CLK(CLK), .pul_len(pul_43), .CTL(zu63));

always @ (posedge CLK or posedge rst)
begin
	if (rst)
	begin
		pul_11 <= 1500;
		pul_12 <= 1500;
		pul_13 <= 1500;
		pul_21 <= 1500;
		pul_22 <= 1600;
		pul_23 <= 1400;
		pul_41 <= 1500;
		pul_42 <= 1400;
		pul_43 <= 1600;
		pul_51 <= 1500;
		pul_52 <= 1500;
		pul_53 <= 1500;
	end
	else
	begin
		prescaler <= prescaler + 1;
		if (prescaler == 499999)
		begin
			prescaler <= 0;
			count <= count + 1;
			if (count < 25)
			begin
				pul_11 <= 1500 - 8 * count;
				pul_12 <= 1500 + 4 * count;
				pul_13 <= 1500 - 4 * count;
				pul_21 <= 1500 + 8 * count;
				pul_22 <= 1600;
				pul_23 <= 1400;
				pul_41 <= 1500 - 8 * count;
				pul_42 <= 1400;
				pul_43 <= 1600;
				pul_51 <= 1500 + 8 * count;
				pul_52 <= 1500 - 4 * count;
				pul_53 <= 1500 + 4 * count;
			end
			if (count >= 25 && count < 50)
			begin
				pul_11 <= 1100 + 8 * count;
				pul_12 <= 1600;
				pul_13 <= 1400;
				pul_21 <= 1900 - 8 * count;
				pul_22 <= 1700 - 4 * count;
				pul_23 <= 1300 + 4 * count;
				pul_41 <= 1100 + 8 * count;
				pul_42 <= 1300 + 4 * count;
				pul_43 <= 1700 - 4 * count;
				pul_51 <= 1900 - 8 * count;
				pul_52 <= 1400;
				pul_53 <= 1600;
			end
			if (count >= 50 && count < 75)
			begin
				pul_11 <= 1100 + 8 * count;
				pul_12 <= 1600;
				pul_13 <= 1400;
				pul_21 <= 1900 - 8 * count;
				pul_22 <= 1300 + 4 * count;
				pul_23 <= 1700 - 4 * count;
				pul_41 <= 1100 + 8 * count;
				pul_42 <= 1700 - 4 * count;
				pul_43 <= 1300 + 4 * count;
				pul_51 <= 1900 - 8 * count;
				pul_52 <= 1400;
				pul_53 <= 1600;
			end
			if (count >= 75 && count <100)
			begin
				pul_11 <= 2300 - 8 * count;
				pul_12 <= 1900 - 4 * count;
				pul_13 <= 1100 + 4 * count;
				pul_21 <= 700 + 8 * count;
				pul_22 <= 1600;
				pul_23 <= 1400;
				pul_41 <= 2300 - 8 * count;
				pul_42 <= 1400;
				pul_43 <= 1600;
				pul_51 <= 700 + 8 * count;
				pul_52 <= 1100 + 4 * count;
				pul_53 <= 1900 - 4 * count;
			end
			if (count == 99)
			begin
				count <= 0;
			end
		end
	end
end


endmodule
