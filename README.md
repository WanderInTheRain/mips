# Simple MIPS CPU Design using Verilog

This project implements a basic MIPS (Microprocessor without Interlocked Pipeline Stages) CPU using Verilog. The goal is to provide a simple and educational example of a MIPS processor in hardware description language.

## Features

- Basic MIPS architecture
- Supports a subset of MIPS instructions
- Simple pipeline structure

## Prerequisites

- Verilog compiler (e.g., Icarus Verilog)
- FPGA board or simulator (e.g., ModelSim)

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/mips-cpu-verilog.git
   ```

2. Navigate to the project directory:

   ```bash
   cd mips-cpu-verilog
   ```

3. Compile the Verilog code:

   ```bash
   iverilog -o mips_cpu_tb mips_cpu_tb.v mips_cpu.v
   ```

4. Run the simulation:

   ```bash
   vvp mips_cpu_tb
   ```

5. View simulation results and waveform using a waveform viewer (e.g., GTKWave).

## MIPS Instructions

The MIPS CPU in this project supports a subset of MIPS instructions. Refer to the [MIPS Instruction Set](https://www.mips.com/documentation/) for details on supported instructions.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests for any improvements or bug fixes.
