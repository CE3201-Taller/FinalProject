/* 
 *
 *
 * @file  cond_logic_tb.sv
 * @autor Victor Montero
 * @date  14/10/2018
 * @fix   15/10/2018
 * @autor Luis Arturo Mora
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

 
module cond_logic_tb();
    logic       clk_i, rst_i;
    logic [3:0] cond_i; 
    logic [3:0] alu_flags_i;
    logic [1:0] flag_write_i;
    logic       pcs_i, reg_write_i, mem_write_i;
    logic       pcs_src_o, reg_write_o, mem_write_o;
    cond_logic dut(.clk_i(clk_i),
                   .rst_i(rst_i),
                   .cond_i(cond_i),
                   .alu_flags_i(alu_flags_i),
                   .flag_write_i(flag_write_i),
                   .pcs_i(pcs_i), 
                   .reg_write_i(reg_write_i), 
                   .mem_write_i(mem_write_i),
                   .pcs_src_o(pcs_src_o),
                   .reg_write_o(reg_write_o),
                   .mem_write_o(mem_write_o));
	initial begin 
		clk_i=1;
		rst_i=1;
		pcs_i=1;
		reg_write_i=1; 
		mem_write_i=1;
		flag_write_i=4'b11;
		#20
		rst_i=0;
		
		cond_i=4'b0000;//eq
		alu_flags_i=4'b0010;//z
		#20
		alu_flags_i=4'b0000;//~z
		
		#20
		cond_i=4'b1000;//not eq
		alu_flags_i=4'b0000;//~z
		#20
		alu_flags_i=4'b0010;//z
		
		#20
		cond_i=4'b0100;//carry ser/unsngd hi or same
		alu_flags_i=4'b0100;//c
		#20
		alu_flags_i=4'b0000;//~c
		
		#20
		cond_i=4'b1100;//carry clr / unsgnd lo
		alu_flags_i=4'b0000;//~c
		#20
		alu_flags_i=4'b0100;//c
		
		#20
		cond_i=4'b0010;//negative
		alu_flags_i=4'b0001;//n
		#20
		alu_flags_i=4'b0000;//~n
		
		#20
		cond_i=4'b1010;//positive or 0
		alu_flags_i=4'b1000;//~n
		#20
		alu_flags_i=4'b0000;//n
		
		
		#20
		cond_i=4'b0110;//overflow
		alu_flags_i=4'b1000;//v
		#20
		alu_flags_i=4'b0000;//~v
		
		
		#20
		cond_i=4'b1110;//no overflow
		alu_flags_i=4'b1000;//v
		#20
		alu_flags_i=4'b0000;//~v
		
		#20
		cond_i=4'b0001;//unsgnd hi
		alu_flags_i=4'b0110;//z c
		#20
		alu_flags_i=4'b0000;// ~z ~c
		
		#20
		cond_i=4'b1001;//unsngnd lo or same
		alu_flags_i=4'b0110;//z c
		#20
		alu_flags_i=4'b0000;// ~z ~c
		
		#20
		cond_i=4'b0101;//sngd > or eq
		alu_flags_i=4'b1001;//n v
		#20
		alu_flags_i=4'b1000;// ~n v
		
		#20
		cond_i=4'b1101;//sgnd < 
		alu_flags_i=4'b1001;//n v  
		#20
		alu_flags_i=4'b1000;// ~n v
		
		#20
		cond_i=4'b0011;//sgnd >
		alu_flags_i=4'b1000;//~n ~z v
		#20
		alu_flags_i=4'b0011;//n z ~v
		
		#20
		cond_i=4'b1011;//sgnd < or eq 
		alu_flags_i=4'b0011;//n z ~v 
		#20
		alu_flags_i=4'b1000;//~n ~z v 
		
		#20
		cond_i=4'b0111;//allways
		alu_flags_i=4'b1000;//xxxx
		
		


		
		
	end
	
	always #20 clk_i = ~clk_i;
	
		
endmodule