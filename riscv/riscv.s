## Examples of basic RISC-V instructions being used

# To run this, paste the file contents into a RISC-V interpreter, like:
# https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/

# Basic RISC-V tutorial:
# https://medium.com/swlh/risc-v-assembly-for-beginners-387c6cd02c49

# Instruction set:
# https://github.com/jameslzhu/riscv-card/blob/master/riscv-card.pdf

## Saving numbers to registers
# There's no way to directly store a value in a register
# So we add 0 to a number, and add it to a register
# zero is another way to reference register x0, which
# always stays as 0

# I stands for immediate, meaning we are working with
# a numerical value for one of the args, instead of
# retrieving both from registers

## Add immediate
# Save the value 1 into register 18
# x18 = 1
ADDI x18, zero, 1

## Add immediate
# Save the value of register 18 + 2 into register 19
# x19 = 3
ADDI x19, x18, 2

## Add
# Add values from registers 18 & 19 and save them into 20
# x20 = 4
ADD x20, x18, x19

## Subtract
# Subtract value in register 19 from register 20 and save it into 21
# x21 = 1
SUB x21, x20, x19

# Memory addresses are in hexadecimal
# The RISC-V interpreter is showing the memory addresses in word increments
# Words are 32 bits or 4 bytes

## Store byte
# Store byte from register 20 into memory address 0, specifying no offset
# 0x00000000 = 4
SB x20, 0(zero)
# The argument that’s in the parenthesis is the offset, saying how many bytes we’ll
# be saving together

## Load byte
# Load byte from memory address 0 into register 22
# x22 = 4
LB x22, 0(zero)

## AND
# Run AND on x22 and x23 and save the output into x24
# x24 = 0
AND x24, x22, x23

## AND
# Run AND on x21 and x18 and save the output into x25
# x25 = 1
AND x25, x21, x18

## Add immediate
# Add x22 + 3 and save to x26
# x26 = 7
ADDI x26, x22, 3

## AND immediate
# Run bitwise AND operation on x26 and 14 and save the output into x27
# 0111 (7)
# 1110 (14)
# 0110 (6)
# x27 = 6
ANDI x27, x26, 14

## OR immediate
# Run bitwise OR operation on x27 and 12 and save the output into x18
# 0110 (6)
# 1100 (12)
# 1110 (14)
# x18 = 14
ORI x18, x27, 12

## XOR immediate
# Run bitwise XOR operation on x18 and 10 and save the output into x19
# 1110 (14)
# 1010 (10)
# 0100 (4)
# x19 = 4
XORI x19, x18, 10

## Set less than immediate
# Check if x19 is less than 5
# Return 1 if true, 0 if false
# x20 = 1
SLTI x20, x19, 5

## Set less than immediate
# Check if x19 is less than 3
# x21 = 0
SLTI x21, x19, 3

# Arithmetic shifts are used for signed numbers
# The sign is stored in the most significant bit, 1 for negative, 0 for positive

## Shift right logical immediate
# Unsigned number shift to the right
# 0100 (4)
# 0010 (2)
# x22 = 2
SRLI x22, x19, 1

## Shift left logical immediate
# Unsigned number shift to the left
# 0100 (4)
# 1000 (8)
# x23 = 8
SLLI x23, x19, 1

## Immediate values passed to ADDI can only go up to 12 bits
# We use ADDI to load registers with numbers
# If we want a number that’s higher than 2^12 (4,095)
# We would use LUI to load the upper 20 bits that are left
# x24 = 5000
ADDI x24, zero, 4095
LUI x24, 5

## Branch if equal
# If values in registers 18 and 19 are equal, jump to current Program Counter + 12
# An instruction is 4 bytes long
# Jumping by 12 means we are jumping 3 instructions forward, skipping the next 2 instructions
# BEQ x18, x19, 12

# Setting up for a loop below
ADDI x18, zero, 0
ADDI x19, zero, 10
ADDI x20, zero, 0

# We can also branch to a label
## Branch not equal
BNE x18, x19, loop

# Prove we branch to loop instead of ever hitting this instruction
ADDI x18, zero, 333

## Label
# by the end of the loop:
# x18 = 10
# x19 = 10
# x20 = 20
loop:
	# increment our counter
	ADDI x18, x18, 1
	# increment another value for fun
	ADDI x20, x20, 2
	# Branch less than
	BLT x18, x19, loop

# Prove we’ve left the loop
# x21 = 66
ADDI x21, zero, 66

## Jump and link
# The first arg is the register to save the return address to
# The second arg is how many bytes to move
# 4 would bring us to the next instruction
# 8 skips an instruction
JAL x24, 8

# Skip this since we're jumping ahead
ADDI x22, zero, 50

# Jump to here
ADDI x23, zero, 25

## Branch greater or equal to
# BGE
