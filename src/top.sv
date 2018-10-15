/* 
 * @file  top.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 * Based on code found in Harris, D., & Harris, S. Digital design and computer architecture. Elsevier. 2012.
 */
 
 module top 
 (
     input logic clk_i, rst_i,
    output logic [31:0] write_data_o, dat_address_o,
    output logic mem_write_o
);
    logic [31:0] pc,instr, read_data;
    processor arm(clk_i, rst_i, pc, instr, mem_write_o,
                  dat_address_o, write_data_o, read_data) ;
    
    imem imem(pc, instr);
    dmem dmem(clk_i, mem_write_o, dat_address_o, write_data_o, read_data);
endmodule
