`timescale 10ms/10ms
module tb_clk16 ();

reg clk, rst_n;
wire clk_16_out;

initial begin
    clk = 1'b0;
    rst_n = 1'b1;
    #20 rst_n = 1'b0;
    #20 rst_n = 1'b1;
end

always #5 clk = ~clk;

clk16 DUT (.clk(clk), .rst_n(rst_n),.clk_16_out(clk_16_out));
    
endmodule