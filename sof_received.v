module sof_received (
    Din, clk16, rst_n, sof_rcv_out
);

    input Din, clk16, rst_n;
    output sof_rcv_out;

    wire sof_rcv_out;

    reg [2:0] cnt_sof;

    reg [4:0] shift_sof;

    wire zeroislow;

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
           cnt_sof <= 3'b000;
       end else if (start) begin // only when the Din is low level, then start to count.
           cnt_sof <= cnt_sof + 3'b001;
       end 
    end

    assign zeroislow = (!Din) && (cnt_sof == 3'b000);

    //shift registers to delay signal - zeroislow
    always @(posedge clk16 or negedge rst_n) begin
       if (!rst_n) begin
           shift_sof <= 5'd0;
       end else begin
           shift_sof <= {shift_sof[3:0], zeroislow};
       end 
    end

    // This is a combinational circuit, so sof_received will be 1, when cnt_sof is 5.
    assign sof_rcv_out = (shift_sof[4]) && ((!Din) && (cnt_sof == 3'b101));

    
endmodule