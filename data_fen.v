module data_fen (
    Din, clk, rst_n, F_en
);
    input Din, clk, rst_n;
    output F_en;

    wire F_en;

    reg [6:0] cnt_fen;

    reg [78:0] shift_fen;

    reg Din_reg;
    wire zeroislow;
    wire low_80;

    reg start; //start to count.


    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            start <= 1'b0;
        end else if (!Din) begin
            start <= 1'b1;
        end
    end



    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           cnt_fen <= 7'd0;
       end else if (start) begin // only when the Din is low level, then start to count.
           cnt_fen <= cnt_fen + 7'd1;
       end 
    end

    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           Din_reg <= 1'b0;
       end else begin
           Din_reg <= (!Din); //将输入对齐时钟，哪怕是延迟了一拍也值得
       end 
    end

    assign zeroislow = Din_reg && (cnt_fen == 8'd0);
    assign low_80 = Din_reg && (cnt_fen == 8'd79);


    //shift registers to delay signal - zeroislow
    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           shift_fen <= 79'd0;
       end else begin
           shift_fen <= {shift_fen[77:0], zeroislow};
       end 
    end

    // This is a combinational circuit, so sof_received will be 1, when cnt_fen is 79.
    assign F_en = (shift_fen[78]) && (low_80);


    
    
endmodule