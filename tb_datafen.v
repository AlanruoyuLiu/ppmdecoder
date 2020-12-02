module tb_datafen ();

reg Din, clk, rst_n;
wire F_en;

initial begin
    clk = 1'b0;
    rst_n = 1'b1;
    Din = 1'b1;
    #20 rst_n = 1'b0;
    #20 rst_n = 1'b1;
    #20 
    Din = 1'b0;
    #10
    Din = 1'b1;
    #40
    Din = 1'b0;
    #10
    Din = 1'b1;
end
    

always #5 clk = ~clk;

data_fen DUT (.Din(Din), .clk(clk), .rst_n(rst_n), .F_en(F_en));

endmodule