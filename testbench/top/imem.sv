/* 
 * @file  imem.sv
 * @autor Victor Montero
 * @date  14/10/2018
 *
 * Based on code found in Harris, D., & Harris, S. Digital design and computer architecture. Elsevier. 2012.
 */
 
 
 mdoule imem(	input logic [31:0] a,
					output logic [31:0] rd);

	logic [31:0] RAM [63:0];
	
	initial 
		$readmem("memfile.dat",RAM);
		
	assign rd = RAM[a[31:2]];

endmodule
