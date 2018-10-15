/* 
 * @file  cond_check_tb.sv
 * @autor Néstor Baltodano Durán
 * @date  14/10/2018
 */

module cond_check_tb();
	logic [3:0] cond, flags;
	logic cond_o, clk;
	
	cond_check dut(cond, flags, cond_o);
	
	initial begin
	clk = 0;
	cond = 4'b0000;
	flags = 4'b0000;
	#4
	cond = 4'b0001;
	flags = 4'b0001;
	#4
	cond = 4'b0010;
	flags = 4'b0010;
	#4
	cond = 4'b0011;
	flags = 4'b0011;
	#4
	cond = 4'b0100;
	flags = 4'b0100;
	#4
	cond = 4'b0101;
	flags = 4'b0101;
	#4
	cond = 4'b0110;
	flags = 4'b0110;
	#4
	cond = 4'b0111;
	flags = 4'b0111;
	#4
	cond = 4'b1000;
	flags = 4'b1000;
	#4
	cond = 4'b1001;
	flags = 4'b1001;
	#4
	cond = 4'b1010;
	flags = 4'b1010;
	#4
	cond = 4'b1011;
	flags = 4'b1011;
	#4
	cond = 4'b1100;
	flags = 4'b1100;
	#4
	cond = 4'b1101;
	flags = 4'b1101;
	#4
	cond = 4'b1110;
	flags = 4'b1110;
	end
	always #2 clk = ~clk;
	
	
endmodule
