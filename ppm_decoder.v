module ppm_decoder(
    Din, clk, rst_n, Dout, D_en, F_en
);
    input Din, clk, rst_n;
    output [7:0] Dout;
    output D_en, F_en;


    wire clk_16_out;

    wire state_out;
    wire [2:0] data_3bits_out;
    wire finish2bits_out;

    wire [7:0] dout_data_out;
    wire onebyte_out;

    wire sof_rcv_out;
    wire [2:0] cnt_sof_out;

    wire eof_rcv_out;

clk16 u1 (.clk(clk), .rst_n(rst_n),.clk_16_out(clk_16_out)); 

Data_gen2bits u2 (.clk16(clk_16_out), .rst_n(rst_n), .Din(Din), .state_in(state_out), .data_3bits_out(data_3bits_out), .finish2bits_out(finish2bits_out));

data_byte u3 (.data_3bits_in(data_3bits_out), .clk16(clk_16_out), .rst_n(rst_n), .finish2bits(finish2bits_out), .dout_data(dout_data_out), .onebyte_out(onebyte_out));

data_den u4 (.onebyte_in(onebyte_out), .clk(clk), .rst_n(rst_n), .D_en(D_en));


sof_received u5 (.Din(Din), .clk16(clk_16_out), .rst_n(rst_n), .sof_rcv_out(sof_rcv_out), .eof_rcv_in(eof_rcv_out), .cnt_sof(cnt_sof_out), .clk(clk));

data_fen u6 (.sof_rcv_in(sof_rcv_out), .clk(clk), .rst_n(rst_n), .F_en(F_en));

eof_received u7 (.Din(Din), .clk16(clk_16_out), .rst_n(rst_n), .eof_rcv_out(eof_rcv_out), .cnt_sof_in(cnt_sof_out));

control_unit u8 (.sof_rcv_in(sof_rcv_out), .eof_rcv_in(eof_rcv_out), .clk16(clk_16_out), .rst_n(rst_n), .dout_data(dout_data_out), .Dout(Dout), .state(state_out), .onebyte_in(onebyte_out));



endmodule
