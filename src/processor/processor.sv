/* 
 *
 *
 * @file  processor.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module processor
(
     input logic        clk_i, rst_i,
    output logic [31:0] pc_o,
     input logic [31:0] instr_i,
    output logic        mem_write_o,
    output logic [31:0] alu_result_o, write_data_o,
     input logic [31:0] read_data_i
);

    logic [3:0] alu_flags;
    logic       reg_write, alu_src, mem_to_reg, pc_src;
    logic [1:0] reg_src, imm_src, alu_control;

    // =========================== Controller ===========================
    controller c(.clk_i(clk_i),
                 .rst_i(rst_i),
                 .instr_i(instr_i[31:12]),
                 .alu_flags_i(alu_flags),
                 .reg_src_o(reg_src),
                 .reg_write_o(reg_write),
                 .imm_src_o(imm_src),
                 .alu_src_o(alu_src),
                 .alu_control_o(alu_control),
                 .mem_write_o(mem_write_o),
                 .mem_to_reg_o(mem_to_reg),
                 .pc_src_o(pc_src));

    // ============================  Datapath  ===========================
    datapath dp(.clk_i(clk_i),
                .rst_i(rst_i),
                .reg_src_i(reg_src),
                .reg_write_i(reg_write),
                .imm_src_i(imm_src),
                .alu_src_i(alu_src),
                .alu_control_o(alu_control),
                .mem_to_reg_i(mem_to_reg),
                .pc_src_i(pc_src),
                .alu_flags_o(alu_flags),
                .pc_o(pc_o),
                .instr_i(instr_i),
                .alu_result_o(alu_result_o),
                .write_data_o(write_data_o),
                .read_data_i(read_data_i));
endmodule
