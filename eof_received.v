module eof_received (
    Din, clk16, rst_n, eof_rcv_out ,cnt_sof_in
);

    input Din, clk16, rst_n;
    input [2:0] cnt_sof_in;
    output eof_rcv_out;

    reg eof_rcv_out;

    wire [2:0] cnt_eof;

    reg Din_reg;

    assign cnt_eof = cnt_sof_in;


    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           Din_reg <= 1'b0;
       end else begin
           Din_reg <= (!Din); //将输入对齐时钟，哪怕是延迟了一拍也值得
       end 
    end

    // This is a combinational circuit, so eof_received will be 1, when cnt_eof is 7.
//    assign eof_rcv_out = Din_reg && (cnt_eof == 3'b110);

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            eof_rcv_out <= 1'b0;
        end else begin
            eof_rcv_out <= Din_reg && (cnt_eof == 3'b110); 
        end
    end






    
endmodule