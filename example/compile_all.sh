#!/bin/bash
ghdl -a --ieee=synopsys full_adder.vhd
ghdl -a --ieee=synopsys ripple_carry_adder.vhd
ghdl -a --ieee=synopsys example_file_io_tb.vhd

ghdl -r --ieee=synopsys example_file_io_tb