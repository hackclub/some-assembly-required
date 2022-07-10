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
<p align="justify">It is an 8-bit register used to perform arithmetic, logical, I/O and LOAD/STORE operations. It is connected to internal data bus and ALU.</p>

### Arithmetic Logic Unit
<p align="justify">It performs arithmetic and logical operations like Addition, Subtraction, AND, OR, etc. on 8-bit data.</p>

### General Purpose Register
<p align="justify">There are 6 general purpose registers in 8085 processor, i.e. B, C, D, E, H and L. Each register can hold 8-bit data. These registers work as 16-bit registers when they work in pairs like B-C, D-E, and H-L. W and Z are Reserved Registers. They can't be used for arithmetic operations. They are used as temporary registers for simple tasks like swapping 2 numbers.</p>

### Program Counter
<p align="justify">It is a 16-bit register used to store the memory address location of the next instruction to be executed. Microprocessor increments the program whenever an instruction is being executed, so that the program counter points to the memory address of the next instruction that is going to be executed.</p>

### Stack Pointer
<p align="justify">It is a 16-bit special register. Stack pointer works in a continuous and contiguous part of the memory. whereas Program Counter(PC) works in random memory locations. The content of the register is stored that is later used in the program.</p>

### Temporary Register
<p align="justify">It is an 8-bit register that holds data values during arithmetic and logical operations.</p>

### Flag Register
<p align="justify">It is an 8-bit register having five 1-bit flip-flops, which holds either 0 or 1 depending upon the result stored in the accumulator. There are 5-set of flip-flops :-<br>
<ul>
    <li>Sign(S)</li>
    <li>Zero(Z)</li>
    <li>Auxillary Carry(AC)</li>
    <li>Parity(P)</li>
    <li>Carry(C)</li>
</ul>
<br> It's bit position is shown in the following table :-
<table>
    <tr>
        <th>D7</th>
        <th>D6</th>
        <th>D5</th>
        <th>D4</th>
        <th>D3</th>
        <th>D2</th>
        <th>D1</th>
        <th>D0</th>
    </tr>
    <tr>
        <td>S</td>
        <td>Z</td>
        <td>-</td>
        <td>AC</td>
        <td>-</td>
        <td>P</td>
        <td>-</td>
        <td>CY</td>
    </tr>
</table>
</p>

### Instruction Register and Decoder
<p align="justify">It is an 8-bit register. After fetching instruction from memory, it is stored in instruction Register. Instruction decoder decodes the information present in the Instruction register.</p>

### Timing and control unit
<p align="justify">It provides timing and control signal to the microprocessor to perform operations.
    <ul>
        <li>Control Signals: READY, RD’, WR’, ALE</li>
        <li>Status Signals: S0, S1, IO/M’</li>
        <li>DMA Signals: HOLD, HLDA</li>
        <li>RESET Signals: RESET IN, RESET OUT</li>
    </ul>
</p>

### Address Bus and Data Bus
<p align="justify">Data bus carries the data to be stored. It is bidirectional, whereas address bus carries the location to where it should be stored and it is unidirectional. It is used to transfer the data and Address I/O devices.</p>

### Serial Input/output Control
<p align="justify">It controls the serial data communication by using these two instructions: SID (Serial input data) and SOD (Serial output data).</p>

### Interrupt Control
<p align="justify">Whenever a microprocessor is executing the main program and if suddenly an interrupt occurs, the microprocessor shifts the control from the main program to process the incoming request. After the request is completed, the control goes back to the main program. There are 5 interrupt signals in 8085 microprocessors: 
<ul>
    <li>INTR</li>
    <li>RST 7.5</li>
    <li>RST 6.5</li>
    <li>RST 5.5</li>
    <li>TRAP</li>
</ul>
</p>