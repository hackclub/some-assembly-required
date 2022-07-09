# Intel 8085

<p align="justify">If you are someone who is getting starte with Assembly Level Programming, probabaly Intel 8085 Microprocessor is best for you. It is an 8-bit microprocessor designed by Intel in 1977 using NMOS technology. It was introduced in March 1976. It was an update of 8080 microprocessor. The 8080 Processor was updated with Enable/Disable instruction pins and Interrupt Pins to form the 8085 microprocessor.</p><br><br>
It has following configuration :-
<ul>
    <li>8-bit data bus</li>
    <li>16-bit address bus</li>
    <li>16-bit program counter</li>
    <li>6 8-bit registers arraged in pairs: BC, DE, HL</li>
</ul>

<br>
<p align="justify">It has a 40-pin dual in line package. The Address and Data bus are multiplexed in this processor which helps in providing more control signals. It has 1 non-maskable interrupt and 3 maskable interrupts. it provides serial interfacing w9ith Serial Input Data (SID) and Serial Output Data(SOD).<br><br></p>

## Functional Units of Intel-8085


### Accumulator
<p align="justify">It is an 8-bit register used to perform arithmetic, logical, I/O & LOAD/STORE operations. It is connected to internal data bus & ALU.</p>

### Arithmetic Logic Unit
<p align="justify">It performs arithmetic and logical operations like Addition, Subtraction, AND, OR, etc. on 8-bit data.</p>

### General Purpose Register
<p align="justify">There are 6 general purpose registers in 8085 processor, i.e. B, C, D, E, H & L. Each register can hold 8-bit data. These registers work as 16-bit registers when they work in pairs like B-C, D-E, and H-L. W and Z are Reserved Registers. They can't be used for arithmetic operations. They are used as temporary registers for simple tasks like swapping 2 numbers.</p>

### Program Counter
<p align="justify">It is a 16-bit register used to store the memory address location of the next instruction to be executed. Microprocessor increments the program whenever an instruction is being executed, so that the program counter points to the memory address of the next instruction that is going to be executed.</p>

