/* 
 *
 *
 * @file  datapath.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 */

module datapath
(
	clk_i, rst_i, reg_src, reg_write,
	imm_src,
	alu_src,
	alu_control,
	mem_to_reg,
	pc_src,
	alu_flags,
	pc,
instr,
ALUResult, WriteData,
ReadData);
PCNext, PCPlus4, PCPlus8;
ExtImm, SrcA, SrcB, Result;
RA1, RA2;
// next PC logic
mux2 #(32)
pcmux(PCPlus4, Result, PCSrc, PCNext);
flopr #(32) pcreg(clk, reset, PCNext, PC);
adder #(32) pcadd1(PC, 32'b100, PCPlus4);
adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);
// register file logic
mux2 #(4) ra1mux(Instr[19:16], 4'b1111, RegSrc[0], RA1);
mux2 #(4) ra2mux(Instr[3:0], Instr[15:12], RegSrc[1], RA2);
regfile
rf(clk, RegWrite, RA1, RA2,
Instr[15:12], Result, PCPlus8,
SrcA, WriteData);
mux2 #(32) resmux(ALUResult, ReadData, MemtoReg, Result);
extend
ext(Instr[23:0], ImmSrc, ExtImm);
// ALU logic
mux2 #(32) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
alu
alu(SrcA, SrcB, ALUControl, ALUResult, ALUFlags);
endmodule