/* 
 * @file  input_controller.sv
 * @autor Arturo Mora
 * @date  26/10/2018
 */

module input_controller
(
     input logic        clk_i, rst_i,
     input logic        mode_i,
     input logic [8:0]  data_i,
     input logic        funct_1_i, funct_2_i, exec_i,
    output logic        w_ena_o,
    output logic [31:0] w_data_o, w_addr_o
);
    logic [1:0] funct_counter, exec_counter;
    logic       funct_ena, exec_ena;
    counter#(2) cnt_funt(.clk_i(clk_i),
                         .rst_i(funct_1_i || funct_2_i),
                         .ena_i(funct_ena),
                         .q_o(funct_counter));
    counter#(2) cnt_exec(.clk_i(clk_i),
                         .rst_i(exec_i),
                         .ena_i(exec_ena),
                         .q_o(exec_counter));
    always_ff @(posedge clk_i) begin
        w_ena_o = funct_1_i | funct_2_i | exec_i;
        case(funct_counter)
            2'b00: begin
                funct_ena = 1'b1;
                w_addr_o = 32'd2;
                w_data_o = {funct_1_i, mode_i};
            end
            2'b01: begin
                w_addr_o = 32'd3;
                w_data_o = data_i;
            end
            2'b10: begin
                funct_ena = 1'b0;
            end
        endcase
        case(exec_counter)
            2'b00: begin
                exec_ena = 1'b1;
                w_addr_o = 32'd1;
                w_data_o = 32'd1;
            end
            2'b01: begin
                w_addr_o = 32'd4;
                w_data_o = data_i;
            end
            2'b10: begin
                exec_ena = 1'b0;
            end
        endcase
    end
endmodule
