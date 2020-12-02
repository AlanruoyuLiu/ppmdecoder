quit -sim


project compileall

vopt +acc tb_eofreceived -o tb_eofreceived_opt
vsim tb_eofreceived_opt
add wave -position insertpoint sim:/tb_eofreceived/DUT/*

run 900