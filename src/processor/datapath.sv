/* 
 *
 *
 * @file  datapath.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module datapath
(
     input logic        clk_i, rst_i,
     input logic [1:0]  reg_src_i,
     input logic        reg_write_i,
     input logic [1:0]  imm_src_i,
     input logic        alu_src_i,
     input logic [1:0]  alu_control_i,
     input logic        mem_to_reg_i, 
     input logic        pc_src_i,
    output logic [31:0] alu_flags_o,
    output logic [31:0] pc_o,
     input logic [31:0] instr_i,
    output logic [31:0] alu_result_o, write_data_o,
     input logic [31:0] read_data_i
);
	logic [31:0] pc_next, pc_plus_4, pc_plus_8;
	logic [31:0] imm, src_a, src_b, result;
	logic [3:0]  read_addr_1, read_addr_2;
	
	// Next PC logic
	flip_flop #(32)  pcreg(.clk_i(clk_i),
	                       .rst_i(rst_i),
	                       .ena_i(1'b1),
	                       .d_i(pc_next),
	                       .q_o(pc_o));
	muX       #(32) pcmux (.bus_a_i(pc_plus_4),
	                       .bus_b_i(result),
	                       .select_i(pc_src_i),
	                       .bus_o(pc_next));
	adder     #(32) pcadd1(.bus_a_i(pc_o), 
	                       .bus_b_i(32'b100),
	                       .bus_o(pc_plus_4));
	adder     #(32) pcadd2(.bus_a_i(pc_plus_4),
	                       .bus_b_i(32'b100),
	                       .bus_o(pc_plus_8));
	
	// Register file logic
	muX #(4)  ra1mux(.bus_a_i(instr_i[19:16]),
	                 .bus_b_i(4'b1111),
	                 .select_i(reg_src_i[0]),
	                 .bus_o(read_addr_1));
	muX #(4)  ra2mux(.bus_a_i(instr_i[3:0]), 
	                 .bus_b_i(instr_i[15:12]),
	                 .select_i(reg_src_i[1]),
	                 .bus_o(read_addr_2));
	regfile   rf(.clk_i(clk_i),
	             .write_enable_i(reg_write_i), 
	             .read_addr_1_i(read_addr_1),
	             .read_addr_2_i(read_addr_2),
	             .write_addr_i(instr_i[15:12]),
	             .write_data_i(result), 
	             .r_15_i(pc_plus_8),
	             .read_data_1_o(src_a),
	             .read_data_2_o(write_data_o));
	muX #(32) resmux(.bus_a_i(alu_result_o),
	                 .bus_b_i(read_data_i),
	                 .select_i(mem_to_reg_i),
	                 .bus_o(result));
	extend    ext   (.instr_i(instr_i[23:0]),
	                 .imm_src_i(imm_src_i),
	                 .imm_o(imm));
	
	// ALU logic
	muX #(32) srcbmux(.bus_a_i(write_data_o),
	                  .bus_b_i(imm),
	                  .select_i(alu_src_i),
	                  .bus_o(src_b));
	alu       alu(.bus_a_i(src_a),
	              .bus_b_i(src_b),
	              .control_i(alu_control_i),
	              .bus_s_o(alu_result_o),
	              .flags_o(alu_flags_o));
endmodule
