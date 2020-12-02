module tb_Datagen2bits ();

    reg clk16, rst_n, Din, state;
    wire [2:0] data_3bits_out;
    wire finish2bits_out;

initial begin
    clk16 = 1'b0;
    rst_n = 1'b1;
    Din = 1'b1;
    state = 1'b0;
    #20 rst_n = 1'b0;
    #20 rst_n = 1'b1;
    #25
//00    
    state = 1'b1;
    Din = 1'b1;
    #10
    Din = 1'b0;
    #10
    Din = 1'b1;
    #60
//00

//01
    Din = 1'b1;
    #30
    Din = 1'b0;
    #10
    Din = 1'b1;
    #40
//01

//10
    Din = 1'b1;
    #50;
    Din = 1'b0;
    #10
    Din = 1'b1;
    #20
//10

//11
    Din = 1'b1;
    #70
    Din = 1'b0;
    #10
//11
    Din = 1'b1; // Nothing
end

always #5 clk16 = ~clk16;

Data_gen2bits DUT (.clk16(clk16), .rst_n(rst_n), .Din(Din), .state(state), .data_3bits_out(data_3bits_out), .finish2bits_out(finish2bits_out));

endmodule