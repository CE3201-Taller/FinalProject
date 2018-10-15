/* 
 * @file  cond_check_tb.sv
 * @autor Néstor Baltodano Durán
 * @date  14/10/2018
 */
 
 module decoder_tb();
	logic [1:0] op, flag_write, imm_src, reg_src, alu_control;
	logic [5:0] funct;
	logic [3:0] read_data;
	logic pcs, reg_write, mem_write, mem_to_reg, alu_src, clk;
	
	decoder dut(op, funct, read_data, flag_write, pcs, reg_write, mem_write, mem_to_reg, alu_src, imn_src, reg_src, alu_control);
	
	initial begin
	clk = 0;
	op = 2'b00;
	funct = 6'b000001;
	read_data = 4'b0010;
	#8
	op = 2'b01;
	funct = 6'b111101;
	read_data = 4'b1110;
	#8
	op = 2'b11;
	funct = 6'b111000;
	read_data = 4'b0011;	
	#8
	op = 2'b10;
	funct = 6'b111000;
	read_data = 4'b0011;		
	end
	always #1 clk=~clk;
endmodule

 