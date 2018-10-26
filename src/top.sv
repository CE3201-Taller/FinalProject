/* 
 * @file  top.sv
 * @autor Arturo Mora
 * @autor Victor Montero
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */
 
 module top
 (
     input logic        clk_i, rst_i,
     input logic [8:0]  data_i,
     input logic        mode_i,
     input logic        funct_1_i, funct_2_i, exec_i,
    output logic [6:0]  display_1_o, display_2_o, display_3_o
);
    logic [31:0] w1_data, w2_data, addr_1, addr_2;
    logic [31:0] pc, instr, read_data;
    logic        w1_ena, w2_ena;
    
    processor arm(.clk_i(clk_i), 
                  .rst_i(rst_i), 
                  .pc_o(pc), 
                  .instr_i(instr), 
                  .mem_write_o(w1_ena),
                  .alu_result_o(addr_1), 
                  .write_data_o(w1_data), 
                  .read_data_i(read_data));

    instruction_memory imem(.a_i(pc), 
                            .read_data_o(instr));
                            
    data_memory dmem(.clk_i(clk_i),
                     .w1_ena_i(w1_ena),
                     .w2_ena_i(w2_ena),
                     .addr_1_i(addr_1),
                     .addr_2_i(addr_2),
                     .w1_data_i(w1_data),
                     .w2_data_i(w2_data),
                     .read_data_o(read_data));
                     
    display_decoder dd(.data_i(read_data[7:0]),
                       .display_1_o(display_1_o),
                       .display_2_o(display_2_o),
                       .display_3_o(display_3_o));
							  
	 input_controller ic(.clk_i(clk_i),
								.mode_i(mode_i),
								.data_i(data_i),
								.funct_1_i(funct_1_i),
								.funct_2_i(funct_2_i),
								.exec_i(exec_i),
								.w_ena_o(w2_ena),
								.w_data_o(w2_data), 
								.w_addr_o(addr_2));
endmodule
