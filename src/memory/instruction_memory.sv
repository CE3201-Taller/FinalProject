/* 
 * @file  instruction_memory.sv
 * @autor Victor Montero
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */
 
 
module instruction_memory
(
     input logic [31:0] a_i,
    output logic [31:0] read_data_o
);

    logic [31:0] RAM [63:0];
    
    initial 
        $readmemh("memfile.dat", RAM);
    
    assign read_data_o = RAM[a_i[31:2]];

endmodule
