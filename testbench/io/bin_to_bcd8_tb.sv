/* 
 * @file  bin_to_bcd8_tb.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 
 module bin_to_bcd8_tb();
 
		logic [7:0] A;
	   logic [3:0] unit,tens;
	   logic [1:0] hundreds;
 
		bin_to_bcd8 dut(A,unit,tens,hundreds);
		
		initial begin
			A=8'b11010111;
		
		end
endmodule