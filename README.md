# Multi-Clock Domain Subsystem using Asynchronous FIFO

## Overview

This project demonstrates the implementation and simulation of a **Multi-Clock Domain (MCD) Subsystem** using an **Asynchronous FIFO** in Verilog. It illustrates how data can be transferred safely between two independent clock domains using FIFO-based Clock Domain Crossing (CDC).

The design is simulated using **Verilator**, and signal waveforms are analyzed using **GTKWave**.

---

## Objectives

* Design independent write and read clock domains.
* Implement an asynchronous FIFO for safe Clock Domain Crossing (CDC).
* Simulate the design using Verilator.
* Visualize timing and data transfer using GTKWave.
* Understand synchronization challenges in multi-clock digital systems.

---

## Project Architecture

```
          +------------------+
          |   Producer       |
          | (Write Domain)   |
          +--------+---------+
                   |
              wr_data, wr_en
                   |
                   v
          +------------------+
          | Asynchronous FIFO|
          +------------------+
                   |
              rd_data, rd_en
                   |
                   v
          +------------------+
          |   Consumer       |
          |  (Read Domain)   |
          +------------------+

 Write Clock (wr_clk)      Read Clock (rd_clk)
```

---

## Project Structure

```
multi_clk_domain_subsystem/
│
├── block_a.v          # Producer module
├── block_b.v          # Consumer module
├── async_fifo.v       # Asynchronous FIFO
├── top_module.v    # Top-level integration
├── multi_clk_tb.v     # Testbench
├── run.sh             # Simulation script
├── dump.vcd           # Generated waveform (after simulation)
└── README.md
```

---

## Module Description

### Producer (`block_a.v`)

* Generates an 8-bit incrementing counter.
* Operates in the write clock domain.
* Writes data into the FIFO whenever it is not full.

---

### Consumer (`block_b.v`)

* Operates in the read clock domain.
* Reads data whenever the FIFO is not empty.

---

### Asynchronous FIFO (`async_fifo.v`)

Implements a simple asynchronous FIFO featuring:

* Independent write and read clocks
* Separate write/read resets
* Circular memory buffer
* FIFO full detection
* FIFO empty detection

> **Note:** This implementation is intended for educational purposes. Industrial asynchronous FIFOs typically use Gray-code pointers and synchronizer flip-flops to safely transfer pointer information across clock domains and avoid metastability.

---

### Top Module

Connects:

* Producer
* Asynchronous FIFO
* Consumer

into a complete multi-clock subsystem.

---

## Simulation

The testbench creates two independent clocks:

| Signal | Period |
| ------ | ------ |
| wr_clk | 10 ns  |
| rd_clk | 14 ns  |

Simulation includes:

* Independent resets
* Producer data generation
* FIFO write/read operations
* Waveform dumping (`dump.vcd`)

---

## Prerequisites

Install:

* Verilator
* GTKWave
* GNU Make
* GCC/G++

Example (Ubuntu):

```bash
sudo apt update
sudo apt install verilator gtkwave make g++
```

---

## Running the Simulation

Make the script executable:

```bash
chmod +x run.sh
```

Run:

```bash
./run.sh
```

The script will:

1. Compile the Verilog design.
2. Build the simulation executable.
3. Run the simulation.
4. Generate `dump.vcd`.
5. Launch GTKWave.

---

## Expected Waveforms

Observe the following signals:

* `wr_clk`
* `rd_clk`
* `wr_data`
* `rd_data`
* `wr_en`
* `rd_en`
* `wr_full`
* `rd_empty`
* `wr_ptr`
* `rd_ptr`

Expected behavior:

* Producer continuously generates incrementing data.
* FIFO stores data in the write clock domain.
* Consumer reads data in the read clock domain.
* FIFO status signals (`wr_full`, `rd_empty`) control write/read operations.

---

## Learning Outcomes

This project helps in understanding:

* Clock Domain Crossing (CDC)
* Asynchronous FIFO operation
* Multi-clock digital system design
* Verilog RTL modeling
* Simulation with Verilator
* Waveform debugging using GTKWave

---

## Future Improvements

* Gray-code read/write pointers
* Pointer synchronization using two-stage flip-flops
* Configurable FIFO depth
* Almost Full / Almost Empty flags
* Parameterized data width and depth
* Randomized verification testbench
* SystemVerilog assertions
* Functional coverage

---

## Tools Used

* Verilog HDL
* Verilator
* GTKWave
* GNU Make
* Bash

---

## License

This project is intended for educational and learning purposes.
