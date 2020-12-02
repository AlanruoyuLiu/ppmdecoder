quit -sim


project compileall

vopt +acc tb_databyte -o tb_databyte_opt
vsim tb_databyte_opt
add wave -position insertpoint sim:/tb_databyte/DUT/*

run 1900