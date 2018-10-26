/* 
 * @file  top.sv
 * @autor Victor Montero
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */
 
 module top 
 (
     input logic        clk_i, rst_i,
    output logic [31:0] write_data_o, data_addr_o,
    output logic        mem_write_o
);
    logic [31:0] pc, instr, read_data;
    processor arm(.clk_i(clk_i), 
                  .rst_i(rst_i), 
                  .pc_o(pc), 
                  .instr_i(instr), 
                  .mem_write_o(mem_write_o),
                  .alu_result_o(data_addr_o), 
                  .write_data_o(write_data_o), 
                  .read_data_i(read_data));
    instruction_memory imem(.a_i(pc), 
                            .read_data_o(instr));
    data_memory dmem(.clk_i(clk_i),
                     .write_ena_i(mem_write_o),
                     .a_i(data_addr_o),
                     .write_data_i(write_data_o),
                     .read_data_o(read_data));
endmodule
