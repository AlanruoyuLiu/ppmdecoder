module tb_databyte ();

    reg [2:0] data_3bits_in;
    reg clk16, rst_n, finish2bits;

    wire [7:0] Dout;
    wire onebyte_out;

initial begin
    clk16 = 1'b0;
    rst_n = 1'b1;
    data_3bits_in = 3'b100;
    finish2bits = 1'b0;
    #20
    rst_n = 1'b0;
    #20
    rst_n = 1'b1; 
    #20
    finish2bits = 1'b1;
    data_3bits_in = 3'b001;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b000;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b010;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b011;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b001;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b000;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b010;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
    #80
    finish2bits = 1'b1;
    data_3bits_in = 3'b011;
    #10
    finish2bits = 1'b0;
    data_3bits_in = 3'b100;
end

always #5 clk16 = ~clk16;

data_byte DUT (.data_3bits_in(data_3bits_in), .clk16(clk16), .rst_n(rst_n), .finish2bits(finish2bits), .Dout(Dout), .onebyte_out(onebyte_out));


endmodule