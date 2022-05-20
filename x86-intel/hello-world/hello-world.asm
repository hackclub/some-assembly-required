;; Hello World in x86 Intel syntax

;; Intel mac assembly instructions

; We have 3 steps to run our program.
; 1. assemble it into an object file
; 2. generate our executable
; 3. run our executable

;; 1. assemble it into an object file
; nasm is our assembler, -f flag is to specify our file format
; macho64 is our file format, used for mac executables
; this whole command creates an object file, which is machine code. view it in a hex editor like https://hexfiend.com/
; if you view it in a normal editor, it tries to convert the machine code to ascii, which makes it nonsensical
;
; nasm -f macho64 hello-world.asm

;; 2. generate our executable
; this generates our executable by linking our object file to any libraries it needs
; it bundles everything together into machine code
; -o lets us specify what we want our executable to be called
;
; ld hello-world.o -o hello-world -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie

;; 3. run our executable
; ./hello-world

; Run this line to run all the commands from above:
; nasm -f macho64 hello-world.asm && ld hello-world.o -o hello-world.out -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./hello-world

;; Assembly Code

; Section for read-only constants
section .data
    ; msg is a label
    ; db = Data Bytes
    ; saves the ASCII number equivalent of this msg into memory, retrievable later by its label
    ; 10 is ASCII for a newline
    msg: db "Hello, world!", 10
    ; Define an assemble-time constant (not stored by itself in the output file, but will appear as an immediate operand in insns that use it)
    ; Calculate len = string length.  subtract the address of the start of the string from the current position ($)
    .len: equ $ - msg

; Executable code goes in the .text section
section .text
  ; The linker looks for this symbol to set the process entry point, so execution start here
  global _main

_main:
    mov     rax, 0x2000004 ; system call for write
    mov     rdi, 1 ; Set output to stdout. 1 = stdout, which is normally connected to the terminal.
    mov     rsi, msg ; address of string to output
    mov     rdx, msg.len ; rdx holds address of next byte to write. msg.len is the number of bytes to write
    syscall ; invoke operating system to do the write

    mov     rax, 0x2000001 ; system call for exit
    mov     rdi, 0 ; exit code 0
    syscall ; invoke operating system to exit
