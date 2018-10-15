/* 
 * @file  extend_tb.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 */
 
 module extend_tb();
 
	logic [23:0] instr_i;
	logic [1:0]  imm_src_i;
	logic [31:0] imm_o;
	
	extend dut(instr_i,imm_src_i,imm_o);
	
	initial begin 
		instr_i=24'b111000000000101001100001;//random instruction 
		imm_src_i=2'b00;
		

		//imm_src_i=2'b01;
		

		//imm_src_i=2'b10;
		
		
		
	end
endmodule
