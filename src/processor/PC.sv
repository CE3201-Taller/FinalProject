/* 
 *
 *
 * @file  PC.sv
 * @autor Néstor Baltodano Durán
 * @date  14/10/2018
 */

module PC(
	input logic clk_i,
	input logic [31:0] PCin_i,
	output logic [31:0] PCout_o
	);
	
	initial begin
	PCout_o <= 0;
	end
	always @(posedge clk_i)
	begin
	PCout_o <= PCin_i;
	end
	
endmodule
