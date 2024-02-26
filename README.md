# N-bit ALU with 20 Instructions

Welcome to the N-bit ALU repository! Here, you'll find the VHDL code and documentation for a versatile Arithmetic Logic Unit (ALU) supporting 20 operations on N-bit operands. Designed to offer flexibility and efficiency, this ALU encompasses four distinct parts - A, B, C, and D - each contributing to the overall functionality of the unit.

## Overview

The N-bit ALU is structured to provide comprehensive arithmetic and logic capabilities for digital systems. It consists of four primary sections:

- **Part A:** This section of the ALU serves as the core arithmetic unit and supports a variety of instructions tailored to accommodate different arithmetic operations. By utilizing a modular approach, Part A ensures adaptability and scalability, enabling seamless integration with diverse systems. Part A supports 8 instructions.

- **Parts B, C, and D:** These sections offer specialized functionality, each catering to specific instruction sets and operation types. By distributing tasks across multiple parts, the ALU achieves optimal performance and resource utilization, maximizing efficiency in a variety of applications. Each of them support 4 instructions, thus combined with part A they give a total of 20 instructions.

## Instructions

The ALU supports a total of 20 instructions, encompassing a wide array of arithmetic and logic operations. The instructions supported are:
![ALU Instructions](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/ALU_instructions.PNG)

## Modular Design

### adder_Nbit

This module is the main component of part A and is the module responsible for performing N-bit arithmetic operations. To optimize performance and minimize propagation delay, this adder utilizes the carry select adder architecture. By dynamically adjusting the composition of CSA_4bit and FA modules to accomodate the N bits, the `adder_Nbit` achieves optimal resource utilization while minimizing latency and power consumption. It does so by assigning using as much of the 4bit Carry Select Adders as possible and if there are any left bits, it uses Full Adders for them.
Here is a photo of the a 16-bit version of the adder_Nbit:  
![adder_Nbit](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/adder_16bit.PNG)
#### Note: At first, A Ripple Carry Adder was used but then I opted that all 4-bit adders are CSA to enhance modularity and performance.  

### CSA_4bit

The `CSA_4bit` module embodies the principle of parallelism, facilitating rapid generation of sum and carry outputs for 4-bit addition operations. Employing a combination of carry lookahead and selection logic, this module delivers exceptional speed and efficiency, making it an indispensable component of the ALU's arithmetic capabilities. The CSA architecture is shown below:
![CSA](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/Carry_Select_Adder_Architecture.png)

### FA

The `FA` module, or Full Adder, complements the CSA_4bit architecture by providing support for lower-order bits in multi-bit addition operations. By seamlessly integrating with the `adder_Nbit` module, FA modules ensure comprehensive coverage of all bits in N-bit addition operations, guaranteeing accurate and reliable computation across a wide range of scenarios.

## Simulation Results

### ALU testbench
![ALU simulation](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/ALU_tb%20output.PNG)

## Synthesis

### part A
![part A synthesis](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/PartA%20RTL%20synthesis.PNG)

### ALU
![ALU synthesis](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/ALU%20RTL%20synthesis.PNG)

#### Individual simulation results for each entity on its own can be found under the screenshots directory.
