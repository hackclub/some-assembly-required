##
# Assembler used:           Clang
# Assembly syntax:          x86 Intel
# CPU architecture:         Intel x86-64
# Platform architecture:    PC
# OS architecture:          Linux
##
# Program to demonstrate the SystemV AMD64 ABI while interfacing with the C library
# Will print out command-line arguments and argument count
# 
# Compile with: clang -fPIE -s test.s
# 
# Author: @theonekevin on GitHub
##

.intel_syntax noprefix
.global main
.global printf
.global exit

.text

main:
    int 3                       # Set breakpoint
    push    rbp                 # Set up stack frame
    mov     rbp, rsp            # Stack frame looks like:
                                # +0x0000: junk values          <- rsp,rbp
                                # +0x0008: old rbp
                                # +0x0010: main return address
                                # +0x0018: argv**
                                # +0x0020: argc
                                ##
                                # Note: We should only use r12-r14 and ebx (callee saved regs)
                                # See https://www.uclibc.org/docs/psABI-x86_64.pdf Fig3.4
    mov     r12, [rbp+0x20]     # r12 = argc
    mov     r13, [rbp+0x18]     # r13 = argv
                                ##
    shr     r12, 32             # Take upper 32-bits, since argc is an int
    dec     r12                 # Skip first argv, argc = argc-1
                                ##
    lea     rdi, [rip+msg1]     # rdi = arg1, address of msg
    mov     rsi, r12            # rsi = arg2, argc
    mov     al, 0               # Since we're using vardiac arguments, the SystemV ABI
                                # requires us to set al = # of vector registers used = 0
    call    printf              # printf(msg1, argc)
                                ##
    mov     r14, 1              # i = r14 = 1
    add     r13, 8              # argv = &argv[1]

Lcompare:
    cmp     r12, r14
    jl      Lexit               # Goto Lexit if argc < i
    
Lloop:
    lea     rdi, [rip+msg2]
    mov     rsi, r14
    mov     rdx, [r13]
    mov     al, 0
    call    printf              # printf(msg2, i, *argv)
    
    inc     r14                 # i++
    add     r13, 8              # argv = &argv[1]
    jmp     Lcompare
    
Lexit:
    mov     rdi, 0
    call    exit                # exit(0)

.data

msg1: .asciz "Number of args: %d\n"
msg2: .asciz "Arg %d is \"%s\"\n"
