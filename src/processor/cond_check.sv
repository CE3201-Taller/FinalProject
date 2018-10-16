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
    logic neg, zero, carryy, overflow, ge;
    assign {neg, zero, carryy, overflow} = flags_i;
    assign ge = (neg == overflow);
    always_comb
        case(cond_i)
            // EQ
            4'b0000: cond_o = zero;
            // NE
            4'b0001: cond_o = ~zero;
            // CS
            4'b0010: cond_o = carryy;
            // CC
            4'b0011: cond_o = ~carryy;
            // MI
            4'b0100: cond_o = neg;
            // PL
            4'b0101: cond_o = ~neg;
            // VS
            4'b0110: cond_o = overflow;
            // VC
            4'b0111: cond_o = ~overflow;+
            // HI
            4'b1000: cond_o = carryy & ~zero;
            // LS
            4'b1001: cond_o = ~(carryy & zero);
            // GE
            4'b1010: cond_o = ge;
            // LT
            4'b1011: cond_o = ~ge;
            // GT
            4'b1100: cond_o = ~zero & ge;
            // LE
            4'b1101: cond_o = ~(~zero & ge);
            // Always
            4'b1110: cond_o = 1'b1;
            // undefined
            default: cond_o = 1'bx;
        endcase
endmodule
