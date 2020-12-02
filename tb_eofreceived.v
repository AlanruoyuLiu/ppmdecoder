module tb_eofreceived ();

reg Din, clk16, rst_n;
wire eof_rcv_out;

initial begin
    clk16 = 1'b0;
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
    #20 


    Din = 1'b1;
    #60
    Din = 1'b0;
    #10
    Din = 1'b1;
end
    

always #5 clk16 = ~clk16;

eof_received DUT (.Din(Din), .clk16(clk16), .rst_n(rst_n), .eof_rcv_out(eof_rcv_out));

endmodule