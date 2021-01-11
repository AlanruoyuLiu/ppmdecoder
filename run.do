quit -sim


project compileall

vopt +acc tb_decoderPPM -o tb_decoderPPM_opt
vsim tb_decoderPPM_opt
add wave -position insertpoint sim:/tb_decoderPPM/DUT/*


add wave -noupdate tb_decoderPPM/DUT/u1/clk16_old
add wave -noupdate tb_decoderPPM/DUT/u1/first
add wave -noupdate tb_decoderPPM/DUT/u1/cnt_16

add wave -noupdate tb_decoderPPM/DUT/u2/cnt_2bits
add wave -noupdate tb_decoderPPM/DUT/u2/Din_reg
add wave -noupdate tb_decoderPPM/DUT/u2/shift_00
add wave -noupdate tb_decoderPPM/DUT/u2/shift_01
add wave -noupdate tb_decoderPPM/DUT/u2/shift_10
add wave -noupdate tb_decoderPPM/DUT/u2/data00
add wave -noupdate tb_decoderPPM/DUT/u2/data01
add wave -noupdate tb_decoderPPM/DUT/u2/data10

add wave -noupdate tb_decoderPPM/DUT/u8/state
add wave -noupdate tb_decoderPPM/DUT/u8/nstate

add wave -noupdate tb_decoderPPM/DUT/u3/onebyte_out

add wave -noupdate tb_decoderPPM/DUT/u5/cnt_sof
add wave -noupdate tb_decoderPPM/DUT/u5/start
add wave -noupdate tb_decoderPPM/DUT/u5/eof_rcv_in
add wave -noupdate tb_decoderPPM/DUT/u7/cnt_eof


run 900000ms