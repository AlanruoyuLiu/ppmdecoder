quit -sim


project compileall

vopt +acc tb_sofreceived -o tb_sofreceived_opt
vsim tb_sofreceived_opt
add wave -position insertpoint sim:/tb_sofreceived/DUT/*

run 900