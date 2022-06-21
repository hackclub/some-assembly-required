## Hello World in x86 AT&T syntax

## AT&T Linux assembly instructions

# We have 3 steps to run our program.
# 1. assemblt iut into an obeject file
# 2. generate our executable
# 3. run our executable

## 1. assemblt it into an object file
# GNU Assembler is our assembler. It is available with the `binutils` package
# It can be called with `as`
# this whole command creates an object file, which is our machine code. view it in a hex editor like https://hexfiend.com/
# if you view it in a normal editor, it tries to convert the machine code to ascii, which makes it nonsensical
# -o lets us specify what we want our executable to be called
#
# as hello-world.s

## 2. generate our executable
# this generates out executable by linking our object file to any libraries it needs
# it bundles everything together into machine code
# Again, -o lets us specify what we want our executable to be called
#
#
# ld hello-world.o -o hello-world

## 2. run our executable
# ./hello-world

# RUn this line to run all the commands from above:
# as helplo-world.s -o hello-world && ld hello-world.o -o hello-world && ./hello-world

## System Call COdes used in this program are specific for Linux 64 bit architecture.
## FInd a list of them here: https://filippo.io/linux-syscall-table/

## Assembly Code

# Section for read-only constants
.data
    # msg is a label
    msg:
        # .ascii saves the ASCII number equivalent of this msg into memory, retrievable later by its label
        .ascii  "Hello, world!\n"      

        # Define an assemblt-time constant, which is calculated during compilation
        # Calculate len = string length. subtract the address of the start of the string (.) from the current position (msg)
        len = . - msg                  

# Executable code goes in the .text section
.text
    # The link looks for this symbol to set the process entry point, so execution starts here
    .global _start

_start:
        mov    $len, %rdx     # rdx holds the address of next byte to write. len is the number of bytes to write
        mov    $msg, %rsi     # address of the string to output
        mov    $1,   %rdi	  # set output to stdout. 1 = stdout, which is normally connected to the terminal.
        mov    $1,   %rax	  # system call for write. **linux specific**
        syscall

        mov    $0,   %rdi     # exit code 0 
        mov    $60,  %rax     # system call for exit. **linux specific** 
        syscall               # invoke operating system to exit

