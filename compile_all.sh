ghdl -a --ieee=synopsys --std=08 dwt.vhd
ghdl -a --ieee=synopsys --std=08 dwt_all.vhd
ghdl -a --ieee=synopsys --std=08 feature_extraction.vhd
ghdl -a --ieee=synopsys --std=08 hifp.vhd
ghdl -a --ieee=synopsys --std=08 hifp_file_tb.vhd

ghdl -r --ieee=synopsys --std=08 hifp_file_tb