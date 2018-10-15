/* 
 *
 *
 * @file  datapath.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module datapath
(
     input logic         clk_i, rst_i,
     input logic [1:0]   reg_src_i,
     input logic         reg_write_i,
     input logic [1:0]   imm_src_i,
     input logic         alu_src_i,
     input logic [1:0]   alu_control_i,
     input logic         mem_to_reg_i, 
     input logic         pc_src_i,
    output logic [31:0]  alu_flags_o,
    output logic [31:0]  pc_o,
     input logic [31:0]  instr_i,
    output logic [31:0]  alu_result_o, write_data_o,
     input logic [31:0]  read_data_i
);
	logic [31:0] pc_next, pc_plus_4, pc_plus_8;
	logic [31:0] imm, src_a, src_b, result;
	logic [3:0]  ra1, ra2;
	
	// Next PC logic
	flip_flop #(32) pcreg(clk_i, rst_i, pc_next, pc_o);
	mux2      #(32) pcmux(pc_plus_4, result, pc_src_o, pc_next);
	adder     #(32) pcadd1(pc_o, 32'b100, pc_plus_4);
	adder     #(32) pcadd2(pc_plus_4, 32'b100, pc_plus_8);
	
	// Register file logic
	mux2 #(4)  ra1mux(instr_o[19:16], 4'b1111, reg_src_o[0], ra1);
	mux2 #(4)  ra2mux(instr_o[3:0], instr_o[15:12], reg_src_o[1], ra2);
	regfile    rf(clk_i, reg_write_i, ra1, ra2, instr_o[15:12], result, 
	              pc_plus_8, src_a, write_data_o);
	mux2 #(32) resmux(alu_result_o, read_data_i, mem_to_reg_i, result);
	extend     ext(instr_i[23:0], imm_src_i, imm);
	
	// ALU logic
	mux2 #(32) srcbmux(write_data_o, imm, alu_src_i, src_b);
	alu        alu(src_a, src_b, alu_control_i, alu_result_o, alu_flags_o);
endmodule
