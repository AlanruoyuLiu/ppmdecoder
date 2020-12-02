module eof_received (
    Din, clk16, rst_n, eof_rcv_out
);

    input Din, clk16, rst_n;
    output eof_rcv_out;

    wire eof_rcv_out;

    reg [2:0] cnt_eof;

    reg Din_reg;

    reg start; //start to count.


    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            start <= 1'b0;
        end else if (!Din) begin
            start <= 1'b1;
        end
    end


    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           cnt_eof <= 3'b000;
       end else if (start) begin // only when the Din is low level, then start to count.
           cnt_eof <= cnt_eof + 3'b001;
       end 
    end

    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           Din_reg <= 1'b0;
       end else begin
           Din_reg <= (!Din); //将输入对齐时钟，哪怕是延迟了一拍也值得
       end 
    end

    // This is a combinational circuit, so eof_received will be 1, when cnt_eof is 7.
    assign eof_rcv_out = Din_reg && (cnt_eof == 3'b110);






    
endmodule