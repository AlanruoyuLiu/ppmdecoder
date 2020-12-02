module data_den (
    onebyte_in, clk, rst_n, D_en
);
    input onebyte_in, clk, rst_n;
    output D_en;

    wire D_en;

    reg q0, q1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q0 <= 1'b0;
            q1 <= 1'b0;
        end else begin
            q0 <= onebyte_in;
            q1 <= q0;
        end
    end

    assign D_en = q0 && (!q1);
endmodule