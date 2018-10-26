/* 
 *
 *
 * @file  controller.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module controller
(
     input logic         clk_i, rst_i,
     input logic [31:12] instr_i,
     input logic [3:0]   alu_flags_i,
    output logic [1:0]   reg_src_o,
    output logic         reg_write_o,
    output logic [1:0]   imm_src_o,
    output logic         alu_src_o,
    output logic [1:0]   alu_control_o,
    output logic         mem_write_o, mem_to_reg_o, 
    output logic         pc_src_o
);
    logic [1:0] flag_write;
    logic       pc_src, reg_write, mem_write;
    
    // =========================== Decoder =============================
    decoder dec(.op_i(instr_i[27:26]),
                .funct_i(instr_i[25:20]),
                .read_data_i(instr_i[15:12]),
                .flag_write_o(flag_write),
                .pc_src_o(pc_src),
                .reg_write_o(reg_write),
                .mem_write_o(mem_write),
                .mem_to_reg_o(mem_to_reg_o),
                .alu_src_o(alu_src_o),
                .imm_src_o(imm_src_o),
                .reg_src_o(reg_src_o),
                .alu_control_o(alu_control_o));

    // ========================== Cond Logic ===========================
    cond_logic c(.clk_i(clk_i),
                 .rst_i(rst_i),
                 .cond_i(instr_i[31:28]),
                 .alu_flags_i(alu_flags_i),
                 .flag_write_i(flag_write),
                 .pc_src_i(pc_src),
                 .reg_write_i(reg_write),
                 .mem_write_i(mem_write),
                 .pc_src_o(pc_src_o),
                 .reg_write_o(reg_write_o),
                 .mem_write_o(mem_write_o));
endmodule
