module data_fen (
    sof_rcv_in, clk, rst_n, F_en
);
    input sof_rcv_in, clk, rst_n;
    output F_en;

    wire F_en;

    reg q0_fen, q1_fen;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q0_fen <= 1'b0;
            q1_fen <= 1'b0;
        end else begin
            q0_fen <= sof_rcv_in;
            q1_fen <= q0_fen;
        end
    end

    assign F_en = q0_fen && (!q1_fen);
endmodule