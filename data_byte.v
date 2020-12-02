module data_byte (
    data_3bits_in, clk16, rst_n, finish2bits, Dout, onebyte_out
);

    input [2:0] data_3bits_in;
    input clk16, rst_n, finish2bits;

    output [7:0] Dout;
    wire [7:0] Dout;

    output onebyte_out;
    wire onebyte_out;

    reg [2:0] cnt_byte;

    reg [1:0] q0;
    reg [1:0] q1;
    reg [1:0] q2;
    reg [1:0] q3;

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            cnt_byte <= 3'b000;
        end else if (finish2bits) begin
            cnt_byte <= cnt_byte + 3'b001;            
            if (cnt_byte == 3'b100) begin
                cnt_byte <= 3'b001;
            end
        end
    end

    assign onebyte_out = (cnt_byte == 3'b100);

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            q0 <= 2'b00;
            q1 <= 2'b00;
            q2 <= 2'b00;
            q3 <= 2'b00;
        end else if (finish2bits) begin
            q0 <= data_3bits_in[1:0];
            q1 <= q0;
            q2 <= q1;
            q3 <= q2;
        end
    end

    assign Dout = {q0, q1, q2, q3};
    
endmodule