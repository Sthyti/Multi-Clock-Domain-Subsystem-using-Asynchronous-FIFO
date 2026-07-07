#!/bin/bash

#Step-1: Compile RTL and Testbench using verilator

verilator --binary -j 0 -Wall block_a.v block_b.v async_fifo.v top_module.v multi_clk_tb.v --top multi_clk_tb --timing --trace --CFLAGS "-std=c++20"

#Step-2: Build directory

cd obj_dir || { echo "Error: obj_dir not found"; exit 1; }

#Step-3: Build simulation executable

make -f Vmulti_clk_tb.mk Vmulti_clk_tb || { echo "Error: Compilation failed"; exit 1; }

#Step-4: Run simulation

./Vmulti_clk_tb || { echo "Error: Simulation failed"; exit 1; }

#Step-5: Open Waveform

gtkwave dump.vcd
