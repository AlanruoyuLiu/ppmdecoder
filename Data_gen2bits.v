module Data_gen2bits (
    clk16, rst_n, Din, state, data_3bits_out, finish2bits_out
);
    input clk16, rst_n, Din, state;
    output [2:0] data_3bits_out;
    output finish2bits_out;

    wire [2:0] data_3bits_out; // The highest bit is indicating the valid of this data. 0: valid; 1: invalid.

    reg [2:0] cnt_2bits;
    reg Din_reg;

    reg [5:0] shift_00;
    reg [3:0] shift_01;
    reg [1:0] shift_10;

    wire data00;
    wire data01;
    wire data10;

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            cnt_2bits <= 3'b000;
        end else if (state) begin
            cnt_2bits <= cnt_2bits + 3'b001;
        end
    end
    
    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           Din_reg <= 1'b0;
       end else begin
           Din_reg <= (!Din); //将输入对齐时钟，哪怕是延迟了一拍也值得
       end 
    end  

    assign data00 = Din_reg && (cnt_2bits == 3'b010); // because cnt_2bits is 1, when state is high.
    assign data01 = Din_reg && (cnt_2bits == 3'b100);
    assign data10 = Din_reg && (cnt_2bits == 3'b110);

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            shift_00 <= 6'd0;
        end else begin
            shift_00 <= {shift_00[4:0], data00};  // the highest bit was shift out every clock. New bit is input at the lowest bit.
        end
    end

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            shift_01 <= 4'd0;
        end else begin
            shift_01 <= {shift_01[2:0], data01};  // the highest bit was shift out every clock. New bit is input at the lowest bit.
        end
    end

    always @(posedge clk16 or negedge rst_n) begin
        if (!rst_n) begin
            shift_10 <= 2'd0;
        end else begin
            shift_10 <= {shift_10[0], data10};  // the highest bit was shift out every clock. New bit is input at the lowest bit.
        end
    end

    assign data_3bits_out = (shift_00[5] == 1'b1)? 3'b000 : (shift_01[3] == 1'b1)? 3'b001 : (shift_10[1] == 1'b1)? 3'b010 : (Din_reg && (cnt_2bits == 3'b000)) ? 3'b011 : 3'b100;


    assign finish2bits_out = (shift_00[5] == 1'b1) || (shift_01[3] == 1'b1) || (shift_10[1] == 1'b1) || (Din_reg && (cnt_2bits == 3'b000));

endmodule