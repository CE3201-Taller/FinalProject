/* 
 * @file  input_controller_tb.sv
 * @autor Arturo Mora
 * @date  26/10/2018
 */

module input_controller_tb ();
    logic        clk, rst;
    logic        mode_i;
    logic [8:0]  data_i;
    logic        funct_1_i, funct_2_i, exec_i;
    logic        w_ena_o;
    logic [31:0] w_data_o, w_addr_o;

    input_controller uut(clk, rst, mode_i, data_i, funct_1_i, funct_2_i, 
                         exec_i, w_ena_o, w_data_o, w_addr_o);
    initial begin
        #0  
        rst <= 1;
        funct_1_i <= 1'b0;
        funct_2_i <= 1'b0;
        exec_i    <= 1'b0;
        mode_i    <= 1'b0;
        
        #10
        rst <= 0;
        data_i    <= 9'd10;
        funct_1_i <= 1'b1;

        #20
        funct_1_i <= 1'b0;

        #30
        data_i    <= 9'd15;
        exec_i    <= 1'b1;

        #40
        exec_i    <= 1'b0;
     end
     
     always begin
        #5 clk <= 1;
        #5 clk <= 0;
    end
endmodule
