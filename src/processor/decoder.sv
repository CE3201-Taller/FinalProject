/* 
 *
 *
 * @file  decoder.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module decoder
(
     input logic [1:0] op_i,
     input logic [5:0] funct_i,
     input logic [3:0] read_data_i,
    output logic [1:0] flag_write_o,
    output logic       pc_src_o, reg_write_o, mem_write_o,
    output logic       mem_to_reg_o, alu_src_o,
    output logic [1:0] imm_src_o, reg_src_o, alu_control_o);

    logic [9:0] controls;
    logic branch, alu_op;

    // Main Decoder
    always_comb
        casex(op_i)
            2'b00: if(funct_i[5]) controls = 10'b0000101001; // data processing immediate
                   else           controls = 10'b0000001001; // data processing register
            2'b01: if(funct_i[0]) controls = 10'b0001111000; // ldr
                   else           controls = 10'b1001110100; // str
            2'b10:                controls = 10'b0110100010; // b
            default:              controls = 10'bx;          // unimplemented
    endcase

    assign {reg_src_o, imm_src_o, alu_src_o, mem_to_reg_o, 
            reg_write_o, mem_write_o, branch, alu_op} = controls;

    always_comb
        if(alu_op) begin
            case(funct_i[4:1])
                4'b0100: alu_control_o = 2'b00; // ADD
                4'b0010: alu_control_o = 2'b01; // SUB
                4'b0000: alu_control_o = 2'b10; // MUL
                4'b1100: alu_control_o = 2'b11; // DIV
                default: alu_control_o = 2'bx;  // unimplemented
            endcase
            flag_write_o[1] = funct_i[0];
            flag_write_o[0] = funct_i[0] & 
                              (alu_control_o == 2'b00 | alu_control_o == 2'b01);
        end 
        else begin
            alu_control_o = 2'b00;
            flag_write_o  = 2'b00;
        end
    assign pc_src_o = ((read_data_i == 4'b1111) & reg_write_o) | branch;
endmodule
