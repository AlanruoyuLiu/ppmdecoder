module clk16 (
    clk, rst_n, clk_16_out
);
    input clk, rst_n;
    output clk_16_out;

    reg [3:0] cnt_16;
    wire clk_16_out;

    reg first, sec;

    wire clk16_old;

assign clk16_old = (cnt_16 > 4'd7)? 1'b1 : 1'b0;
/* this is a dff, so there is a clk delay
    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           clk_16_out <= 1'b0;
       end else begin
           clk_16_out <= cnt_16 > 4'd7 ? 1'b1: 1'b0;
       end 
    end
*/
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt_16 <= 4'b0000;
        end else begin
            cnt_16 <= cnt_16 + 4'b0001;
        end 
    end

// The first DFF
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            first <= 1'b0;
        end else begin
            first <= clk16_old;
        end
    end
/*
// The second DFF
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sec <= 1'b0;
        end else begin
            sec <= first;
        end
    end
*/
// clc
assign clk_16_out = ~first && clk16_old;


endmodule