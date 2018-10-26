/* 
 * @file  dmem.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 * Based on code found in Harris, D., & Harris, S. Digital design and computer architecture. Elsevier. 2012.
 */
 
 /*
 
 module dmem (	input logic clk_i,we
					input logic [31:0]a,wd,
					output logic [31:0] rd);
					
	logic [31:0] RAM [63:0];
	
	assign rd= RAM [a[31:2]];
	
	always_ff@(posedge clk_i)
		if (we) RAM[a[31:2]]<=wd;
endmodule
*/