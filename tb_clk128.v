`timescale 10ms/10ms
module tb_clk128 ();

reg clk, rst_n;
wire clk_128_out;

initial begin
    clk = 1'b0;
    rst_n = 1'b1;
    #20 rst_n = 1'b0;
    #20 rst_n = 1'b1;
end

always #5 clk = ~clk;

clk128 DUT (.clk(clk), .rst_n(rst_n),.clk_128_out(clk_128_out));
    
endmodule