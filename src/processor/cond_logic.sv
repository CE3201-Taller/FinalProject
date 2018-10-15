/* 
 *
 *
 * @file  cond_logic.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module cond_logic
(
     input logic       clk_i, rst_i,
     input logic [3:0] cond_i, 
     input logic [3:0] alu_flags_i,
     input logic [1:0] flag_write_i,
     input logic       pcs_i, reg_write_i, mem_write_i,
    output logic       pc_src_o, reg_write_o, mem_write_o
);
    logic [1:0] flag_write;
    logic [3:0] flags;
    logic       cond;

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
    cond_check cc(cond_i, flags, cond);
    
    assign flag_write  = flag_write_i & {2{cond}};
    assign reg_write_o = flag_write_i & cond;
    assign mem_write_o = mem_write_i  & cond;
    assign pc_src_o    = pcs_i & cond;
endmodule
