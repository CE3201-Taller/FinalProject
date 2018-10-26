/* 
 * @file  testbench.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 * Based on code found in Harris, D., & Harris, S. Digital design and computer architecture. Elsevier. 2012.
 */
 
 /*
 module testbench();
	
	logic clk_i,rst_i;
	logic [31:0] write_data_o,dat_address_o;
	logic mem_write_o;
	
	top dut(	clk_i,rst_i,
				write_data_o,dat_address_o,
				mem_write_o);
	
	initial begin
		rst_i <=1; #22;rst_i=0;
	end
	
	always begin
		clk_i<=1; #5;clk_i<=0 #5;
	end
	
	always @(negedge clk_i) begin
		if (mem_write_o) begin
			if (dat_address_o === 100 & write_data_o ===7) begin
				$display("Simulation succeded");
				$stop;	
			end
		end
	end
endmodule
*/
	