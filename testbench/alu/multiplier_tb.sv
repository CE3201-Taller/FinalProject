/* 
 * @file  multiplier_tb.sv
 * @autor Victor Montero
 * @date  24/10/2018
 *
 */
 
 
 module multiplier_tb();
		logic [3:0] a,b;
		logic [7:0] p;
		
		
		multiplier #(4) dut(a,b,p);
		
		initial begin 
		a=4'b0011;
		b=4'b1100;
		//a=8'b00110011;
		//b=8'b11001100;
		

		
		
	end
 
 endmodule