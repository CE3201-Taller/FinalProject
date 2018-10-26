/* 
 *
 *
 * @file  cond_check.sv
 * @autor Luis Arturo Mora Granados
 * @date  14/10/2018
 * @src   Based on code found in Harris, D., & Harris, S. 
 *        Digital design and computer architecture. Elsevier. 2012.
 */

module cond_check
(
     input logic [3:0] cond_i,  
     input logic [3:0] flags_i,
    output logic       cond_o
);
    logic neg_flag, zero_flag, carry_flag, overflow_flag, ge_flag;
    assign {neg_flag, zero_flag, carry_flag, overflow_flag} = flags_i;
    assign ge_flag = (neg_flag == overflow_flag);
    always_comb
        case(cond_i)
            4'b0000: cond_o =   zero_flag;
            4'b0001: cond_o = ~ zero_flag;
            4'b0010: cond_o =   carry_flag;
            4'b0011: cond_o = ~ carry_flag;
            4'b0100: cond_o =   neg_flag;
            4'b0101: cond_o = ~ neg_flag;
            4'b0110: cond_o =   overflow_flag;
            4'b0111: cond_o = ~ overflow_flag;
            4'b1000: cond_o =   carry_flag & ~zero_flag;
            4'b1001: cond_o = ~(carry_flag & ~zero_flag);
            4'b1010: cond_o =   ge_flag;
            4'b1011: cond_o = ~ ge_flag;
            4'b1100: cond_o =   ~zero_flag & ge_flag;
            4'b1101: cond_o = ~(~zero_flag & ge_flag);
            4'b1110: cond_o =   1'b1;
            default: cond_o =   1'bx;
        endcase
endmodule
