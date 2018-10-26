/* 
 * @file  data_memory.sv
 * @autor Victor Montero
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */
 
 module data_memory
 (
     input logic        clk_i, w1_ena_i, w2_ena_i,
     input logic [31:0] addr_1_i, addr_2_i, w1_data_i, w2_data_i,
    output logic [31:0] read_data_o
);
    logic [31:0] RAM [63:0];
    assign read_data_o = RAM [addr_1_i[31:2]];
    always_ff @(posedge clk_i) begin
    	if (w1_ena_i) RAM[addr_1_i[31:2]] <= w1_data_i;
        if (w2_ena_i) RAM[addr_2_i[31:2]] <= w2_data_i;
    end
endmodule
