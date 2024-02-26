# N-bit ALU with 20 Instructions

Welcome to the N-bit ALU repository! Here, you'll find the VHDL code and documentation for a versatile Arithmetic Logic Unit (ALU) supporting 20 operations on N-bit operands. Designed to offer flexibility and efficiency, this ALU encompasses four distinct parts - A, B, C, and D - each contributing to the overall functionality of the unit.

## Overview

The N-bit ALU is structured to provide comprehensive arithmetic and logic capabilities for digital systems. It consists of four primary sections:

- **Part A:** This section of the ALU serves as the core arithmetic unit and supports a variety of instructions tailored to accommodate different arithmetic operations. By utilizing a modular approach, Part A ensures adaptability and scalability, enabling seamless integration with diverse systems. Part A supports 8 instructions.

- **Parts B, C, and D:** These sections offer specialized functionality, each catering to specific instruction sets and operation types. By distributing tasks across multiple parts, the ALU achieves optimal performance and resource utilization, maximizing efficiency in a variety of applications. Each of them support 4 instructions, thus combined with part A they give a total of 20 instructions.

## Instructions

The ALU supports a total of 20 instructions, encompassing a wide array of arithmetic and logic operations. The instructions supported are:
![ALU Instructiosn](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/ALU_instructions.PNG)

## Modular Design

### adder_Nbit

This module is the main component of part A and is the module responsible for performing N-bit arithmetic operations. To optimize performance and minimize propagation delay, this adder utilizes the carry select adder architecture. By dynamically adjusting the composition of CSA_4bit and FA modules to accomodate the N bits, the `adder_Nbit` achieves optimal resource utilization while minimizing latency and power consumption. It does so by assigning using as much of the 4bit Carry Select Adders as possible and if there are any left bits, it uses Full Adders for them.

### CSA_4bit

The `CSA_4bit` module embodies the principle of parallelism, facilitating rapid generation of sum and carry outputs for 4-bit addition operations. Employing a combination of carry lookahead and selection logic, this module delivers exceptional speed and efficiency, making it an indispensable component of the ALU's arithmetic capabilities. The CSA architecture is shown below:
![ALU Instructiosn](https://github.com/alhusseingamal/N-bit-ALU/blob/main/screenshots/Carry_Select_Adder_Architecture.png)

### FA

The `FA` module, or Full Adder, complements the CSA_4bit architecture by providing support for lower-order bits in multi-bit addition operations. By seamlessly integrating with the `adder_Nbit` module, FA modules ensure comprehensive coverage of all bits in N-bit addition operations, guaranteeing accurate and reliable computation across a wide range of scenarios.

## Usage

Integrating the N-bit ALU into your digital design project is straightforward:

1. Clone this repository to your local machine.
2. Open the VHDL files in your preferred development environment (e.g., ModelSim, Quartus Prime).
3. Simulate and verify the functionality of the ALU using testbench simulations.
4. Customize the ALU configuration and instruction set to suit the specific requirements of your project.
5. Integrate the ALU into your larger digital design project, leveraging its powerful arithmetic and logic capabilities to enhance system performance and functionality.

## Contributors

- [Your Name](https://github.com/yourusername) - Lead Developer

## License

This project is licensed under the [MIT License](LICENSE), granting you the freedom to use, modify, and distribute the code for both personal and commercial purposes. Contributions are welcomed and encouraged, as we strive to continually enhance the capabilities and versatility of the N-bit ALU for the benefit of the broader digital design community.
