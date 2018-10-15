/* 
 *
 *
 * @file  extend.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module extend
(
	 input logic [23:0] instr_i,
	 input logic [1:0]  imm_src_i,
	output logic [31:0] imm_o
);
	always_comb
		case(imm_src_i)
			// 8-bit unsigned immediate
			2'b00:   imm_o = {24'b0, instr_i[7:0]};
		
			// 12-bit unsigned immediate
			2'b01:   imm_o = {20'b0, instr_i[11:0]};

			// 24-bit two's complement shifted branch
			2'b10:   imm_o = {{6{instr_i[23]}}, instr_i[23:0], 2'b00};
			default: imm_o = 32'bx; // undefined
		endcase
endmodule
