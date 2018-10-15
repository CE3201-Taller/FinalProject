/* 
 * @file  data_memory.sv
 * @autor Victor Montero
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */
 
 module data_memory
 (
     input logic clk_i, write_ena_i,
     input logic [31:0] a_i, wd_i,
    output logic [31:0] read_data_o
);
    logic [31:0] RAM [63:0];
    assign read_data_o = RAM [a_i[31:2]];
    always_ff @(posedge clk_i)
        if (write_ena_i) RAM[a_i[31:2]] <= wd_i;
endmodule
