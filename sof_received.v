module sof_received (
    Din, clk16, rst_n, sof_rcv_out, eof_rcv_in, cnt_sof, clk
);

    input Din, clk16, rst_n, eof_rcv_in, clk;
    output sof_rcv_out;
    output [2:0] cnt_sof;

    reg sof_rcv_out;
    reg q0; // to delay a clock for output at 8th clock.

    reg [2:0] cnt_sof;

    reg [4:0] shift_sof;

    reg Din_reg;
    wire zeroislow;
    wire fifthislow;

    reg start; //start to count.

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            start <= 1'b0;
        end else if ((!Din || eof_rcv_in) && clk16) begin
            start <= !eof_rcv_in;
        end
    end



    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           cnt_sof <= 3'b000;
       end else if (start && clk16) begin // only when the Din is low level, then start to count.
           cnt_sof <= cnt_sof + 3'b001;
       end else if (eof_rcv_in && clk16) begin
           cnt_sof <= 3'b000;
       end
    end
/*
//这种风格的代码是无法正常工作的，原因在于：
    //assign zeroislow = (!Din) && (cnt_sof == 3'b000);
    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           zeroislow <= 1'b0;
       end else begin
           zeroislow <= (!Din) && (cnt_sof == 3'b000); //**************原因在于 && 后面的cnt_sof是会随着clk的边沿变化的，所以，D触发器无法采集到正常的数，因为cnt_sof在边沿变化了。
       end 
    end

    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           fifthislow <= 1'b0;
       end else begin
           fifthislow <= (!Din) && (cnt_sof == 3'b101);
       end 
    end
*/
    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           Din_reg <= 1'b0;
       end else if (clk16) begin
           Din_reg <= (!Din); //将输入对齐时钟，哪怕是延迟了一拍也值得
       end 
    end

    assign zeroislow = Din_reg && (cnt_sof == 3'b000);
    assign fifthislow = Din_reg && (cnt_sof == 3'b101);


    //shift registers to delay signal - zeroislow
    always @(posedge clk or negedge rst_n) begin
       if (!rst_n) begin
           shift_sof <= 5'd0;
       end else if (clk16) begin
           shift_sof <= {shift_sof[3:0], zeroislow};
       end 
    end

    // This is a combinational circuit, so sof_received will be 1, when cnt_sof is 5.
//    assign sof_rcv_out = (shift_sof[4]) && (fifthislow);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sof_rcv_out <= 1'b0;
            q0 <= 1'b0;
        end else if (clk16) begin
            q0 <= (shift_sof[4]) && (fifthislow);
            sof_rcv_out <= q0;
        end
    end
    
endmodule