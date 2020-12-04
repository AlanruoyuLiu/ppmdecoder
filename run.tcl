gui_start

set target_library { /home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/T180/synopsys/typical.db }
set link_library   { * /home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/T180/synopsys/typical.db }
set symbol_library { /home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/T180/symbols/synopsys/tsmc18.sdb }

read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/clk16.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/sof_received.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/Data_gen2bits.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/data_byte.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/data_den.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/data_fen.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/eof_received.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/control_unit.v}
read_file -format verilog {/home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/ppm_decoder.v}

set_operating_conditions -library typical typical

set all_in_ex_clk [remove_from_collection [all_inputs] [get_ports clk]]
set all_in_ex_clk_rst_n [remove_from_collection $all_in_ex_clk [get_ports rst_n]]
set_driving_cell -lib_cell INVX8 -library typical $all_in_ex_clk_rst_n

set_fanout_load 2 [all_outputs]
set_wire_load_model -name tsmc18_wl10 -library typical

create_clock -name "clk" -period 10 -waveform { 0.000 5  }  { clk  }
set_dont_touch_network  [ find clock clk ]

set_input_delay -max 4 -clock clk $all_in_ex_clk_rst_n
set_output_delay -max 4 -clock clk [all_outputs]

compile -exact_map

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
uplevel #0 { report_area -nosplit }

write -hierarchy -format ddc
write -hierarchy -format verilog -output /home/ic/ic2019210416/ic_design_hw/decoder_ppmV2/library/ppm_decoder_post.v
write_sdf ppm_decoder.sdf
write_sdc ppm_decoder.sdc

