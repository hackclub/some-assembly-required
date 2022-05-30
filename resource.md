https://www.youtube.com/watch?v=JsTptu56GM8

https://www.youtube.com/watch?v=AkFi90lZmXA&t=128s

questions
- what type of data can a RAM contain?

notes
- in ram the data could contain opcode and address OR pure data (this is distinguished when computer decodes it)
- programme counter
  - starts at 0, after each cycle increments by one.
  - unless using jump instruction where you can go to a new address (how you make loops)
- there are conditional jumps that allow you to make the program halt
  - eg. jump neg
- ALU
  - does the math stuff
  - has outputs and flags
  - flags tell the computer what to do given a condition
    - each flag is a wire that has a certain condition and turns on and off depending on if it's true
  - outputs is number or letter or data smth
  - (not necessary): uses temp register for input B (as buses can only share one number each time) while input A comes from BUs
- data in RAM is stored as binary
- instructions in RAM are normally 8 bits but can be 32 or 64 bits, or it can be variable
- more instructions set size = computer can do more things, faster
- clocks
  - keeps everything in sync
  - modern cpus gigahertz (turns on billion times per second)
- RAM
  - address and data
  - data could be instruction or number or letter (displayed in 0s and 1s as a character code)
- Instruction Set
  - each CPU has a set of instruction that it understands
  - eg. load, add, store, compare, jump if etc. also has HALT ALSO out and in instruction (to and from external device like mouse, each input/output has a port address which is also in RAM)
- flow of data
  - program counter 0, retrieves first instruction from RAM, decodes it and follows instruction, maybe save to register
  - then program counter goes to 1 and next instruction is fetched, decoded, and executed. here fetch address 2 and add to register a.
  - counter 3: fetch address 3 and add to register b
  - counter 4: add register a and b and sent to register c which is then load to memory address 7
  - counter 5:
- electricity stuff
  - everything is connected by wires and 0s and 1s are on and off of electricity
  - bus: group of wires that connected multiple components
- registers
  - store numbers between operations
- normally after a compare instruction there's a jump if instruction (allows for loops, more than one path)


to include
- talk about clock (one action per tick)
- programme counter
- instruction register
- registers (a, b, c, d, etc.)
- types of instructions
  - links to assembly code

https://www.youtube.com/watch?v=cNN_tTXABUA