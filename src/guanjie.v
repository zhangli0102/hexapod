`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:12 04/21/2017 
// Design Name: 
// Module Name:    guanjie 
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
module guanjie(
    input CLK,
    input [15:0] pul_len,
    output reg CTL
    );

parameter CLK_F = 50;

reg [15:0] prescaler = 0;
reg [15:0] count = 0;

always @ (posedge CLK)
begin
	prescaler <= prescaler + 1;
	if (prescaler == CLK_F -1)
	begin
		prescaler <= 0;
		count <= count + 1;
		CTL <= (count < pul_len);
		if (count == 19999)
		begin
			count <= 0;
		end
	end
end 

endmodule
