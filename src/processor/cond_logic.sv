/* 
 *
 *
 * @file  cond_logic.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module cond_logic
(
     input logic       clk_i, rst_i,
     input logic [3:0] cond_i, 
     input logic [3:0] alu_flags_i,
     input logic [1:0] flag_write_i,
     input logic       pc_src_i, reg_write_i, mem_write_i,
    output logic       pc_src_o, reg_write_o, mem_write_o
);
    logic [1:0] flag_write;
    logic [3:0] flags;
    logic       cond_ex;

    // =========================== Flip Flop1 ===========================
    flip_flop #(2) flagreg1(.clk_i(clk_i), 
                            .rst_i(rst_i), 
                            .ena_i(flag_write[1]),
                            .d_i(alu_flags_i[3:2]), 
                            .q_o(flags[3:2]));

    // =========================== Flip Flop2 ===========================
    flip_flop #(2) flagreg0(.clk_i(clk_i), 
                            .rst_i(rst_i), 
                            .ena_i(flag_write[0]),
                            .d_i(alu_flags_i[1:0]), 
                            .q_o(flags[1:0]));

    // =========================== Cond Check ===========================
    cond_check cc(.cond_i(cond_i),
                  .flags_i(flags),
                  .cond_o(cond_ex));
    
    assign flag_write  = flag_write_i & {2{cond_ex}};
    assign reg_write_o = reg_write_i & cond_ex;
    assign mem_write_o = mem_write_i & cond_ex;
    assign pc_src_o    = pc_src_i    & cond_ex;
endmodule
