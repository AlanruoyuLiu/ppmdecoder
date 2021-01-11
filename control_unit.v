module control_unit (
    sof_rcv_in, eof_rcv_in, rst_n, dout_data, Dout, state, onebyte_in, clk
);
    input sof_rcv_in, eof_rcv_in, onebyte_in, clk;
    input rst_n;
    input [7:0] dout_data;
    
    output [7:0] Dout;
    reg [7:0] Dout;

    output state;
    reg state, nstate;


    parameter 
    sof_invalid = 1'b0,
    sof_received = 1'b1;

    //combinational logic for generating next state
    always @(state or sof_rcv_in or eof_rcv_in) begin
        case (state)
           sof_invalid : if (sof_rcv_in) begin
               nstate = sof_received;
           end else begin
               nstate = sof_invalid;
           end
           sof_received : if (eof_rcv_in) begin // Eof receiving.
               nstate = sof_invalid;
           end else begin
               nstate = sof_received;
           end
            default: nstate = 1'bx;
        endcase
    end

    //sequencial logic for changing state
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= sof_invalid;
        end else begin
            state <= nstate;
        end
    end

    //combinational logic for generating output
    
    always @(onebyte_in) begin
        case (state)
           sof_invalid : Dout = 8'd0;
           sof_received : Dout = dout_data;
           default: Dout = 8'bx;
        endcase        
    end
    

    //assign Dout = (state) ? dout_data : 1'b0;

endmodule