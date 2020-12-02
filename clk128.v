module clk128 (
    clk, rst_n, clk_128_out
);
    input clk, rst_n;
    output clk_128_out;

    reg [7:0] cnt_128;
    wire clk_128_out;

assign clk_128_out = (cnt_128 > 8'd127)? 1'b1 : 1'b0;
/* this is a dff, so there is a clk delay
    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           clk_128_out <= 1'b0;
       end else begin
           clk_128_out <= cnt_128 > 4'd7 ? 1'b1: 1'b0;
       end 
    end
*/
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt_128 <= 8'b0000_0000;
        end else begin
            cnt_128 <= cnt_128 + 8'b0000_0001;
        end 
    end
endmodule