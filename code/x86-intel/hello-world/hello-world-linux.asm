;; Hello World in x86 Intel syntax

; Assembler used: NASM
; Assembly syntax: x86 Intel
; CPU architecture: Intel x86-64
; Platform architecture: PC
; OS architecture: Linux

;; Intel Linux assembly instructions

; We have 3 steps to run our program.
; 1. assemble it into an object file
; 2. generate our executable
; 3. run our executable

;; 1. assemble it into an object file
; nasm is our assembler, -f flag is to specify our file format
; elf64 is our file format, used for linux executables
; this whole command creates an object file, which is machine code. view it in a hex editor like https://hexfiend.com/
; if you view it in a normal editor, it tries to convert the machine code to ascii, which makes it nonsensical
;
; nasm -f elf64 hello-world-linux.asm

;; 2. generate our executable
; this generates our executable by linking our object file to any libraries it needs
; it bundles everything together into machine code
; -o lets us specify what we want our executable to be called
;
; ld hello-world-linux.o -o hello-world-linux

;; 3. run our executable
; ./hello-world-linux

; Run this line to run all the commands from above:
; nasm -f elf64 hello-world-linux.asm && ld hello-world-linux.o -o hello-world-linux && ./hello-world-linux

;; System Call Codes used in this program are specific for Linux 64 bit architecture.
;; Find a list of them here: https://filippo.io/linux-syscall-table/

;; Assembly Code

; Section for read-only constants
section .data
    ; msg is a label
    ; db = Data Bytes
    ; saves the ASCII number equivalent of this msg into memory, retrievable later by its label
    ; 10 is ASCII for a newline
    msg: db "Hello, world!", 10

    ; Define an assemble-time constant, which is calculated during compilation
    ; Calculate len = string length.  subtract the address of the start of the string from the current position ($)
    .len: equ $ - msg

; Executable code goes in the .text section
section .text
  ; The linker looks for this symbol to set the process entry point, so execution start here
  global _start

_start:
    mov     rax, 1          ; system call for write. **linux specific** 
    mov     rdi, 1          ; Set output to stdout. 1 = stdout, which is normally connected to the terminal.
    mov     rsi, msg        ; address of string to output
    mov     rdx, msg.len    ; rdx holds the number of bytes to write. msg.len is the length of msg
    syscall                 ; invoke operating system to do the write

    mov     rax, 60         ; system call for exit. anything with 0x2 is mac specific
    mov     rdi, 0          ; exit code 0
    syscall                 ; invoke operating system to exit
