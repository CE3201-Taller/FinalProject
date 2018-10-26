n/* 
 * @file  controller_tb.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 */
 
 module controller_tb();
 
    logic         clk_i, rst_i;
    logic [31:12] instr_i;
    logic [3:0]   alu_flags_i;
    logic [1:0]   reg_src_o;
    logic         reg_write_o;
    logic [1:0]   imm_src_o;
    logic         alu_src_o;
    logic [1:0]   alu_control_o;
    logic         mem_write_o, mem_to_reg_O;
    logic         pc_src_o;
    
	 controller dut(clk_i, rst_i,
                    instr_i,
                    alu_flags_i,
                    reg_src_o,
                    reg_write_o,
                    imm_src_o,
                    alu_src_o,
                    alu_control_o,
                    mem_write_o,mem_to_reg_o,
                    pc_src_o);
	 
	 
	initial begin 
        clk_i=1;
        rst_i=1;
        alu_flags_i=4'b0111;
        #20
        rst_i=0;
        instr_i=32'b11100000000010100110000100000111;//add 
        #200
        instr_i=32'b01010100000000000001000101000111;//add 
    end
    
    always #20 clk_i = ~clk_i;
    
endmodule
