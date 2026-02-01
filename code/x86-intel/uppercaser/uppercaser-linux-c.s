##
# Assembler used:           Clang
# Assembly syntax:          x86 Intel
# CPU architecture:         Intel x86-64
# Platform architecture:    PC
# OS architecture:          Linux
##
# Program to demonstrate the SystemV AMD64 ABI while interfacing with the C library
# Will print out command-line arguments and argument count
# and convert each argument string to uppercase in-place before printing
# 
# Compile with: clang -fPIE -no-pie uppercaser-linux-c.s -o uppercaser-linux-c
# 
# Author: @theonekevin on GitHub
##
.intel_syntax noprefix
.global main
.extern printf
.extern exit

.text

main:
    push    rbp
    mov     rbp, rsp

    # System V AMD64 ABI:
    #   rdi = argc (int, zero-extended to 64 bits)
    #   rsi = argv (char **)
    mov     r12, rdi            # r12 = argc
    mov     r13, rsi            # r13 = argv

    # Ignore argv[0], so we count only "real" arguments
    dec     r12                 # effective_argc = argc - 1

    # printf("Number of args: %d\n", effective_argc)
    lea     rdi, [rip+msg1]     # 1st argument: format string
    mov     rsi, r12            # 2nd argument: effective_argc
    xor     eax, eax            # no vector registers in use (required for varargs)
    call    printf

    # Loop over each argument starting at argv[1]
    mov     r14, 1              # i = 1
    add     r13, 8              # argv = &argv[1]

Lcompare:
    cmp     r12, r14
    jl      Lexit               # if i > effective_argc → exit

Lloop:
    # Uppercase argv[i] in-place before printing
    mov     r8, [r13]          # r8 = char *p = argv[i]

UpperLoop:
    mov     al, byte ptr [r8]  # load *p
    test    al, al             # check for '\0'
    je      DoneUpper

    cmp     al, 'a'
    jb      NotLower
    cmp     al, 'z'
    ja      NotLower
    sub     al, 32             # convert 'a'..'z' → 'A'..'Z'
    mov     byte ptr [r8], al  # store back

NotLower:
    inc     r8                 # p++
    jmp     UpperLoop

DoneUpper:
    # printf("Arg %d is \"%s\"\n", i, argv[i])
    lea     rdi, [rip+msg2]    # format string
    mov     rsi, r14           # i
    mov     rdx, [r13]         # argv[i] (now uppercased)
    xor     eax, eax
    call    printf

    inc     r14                # i++
    add     r13, 8             # argv++
    jmp     Lcompare

Lexit:
    xor     edi, edi            # return code = 0
    call    exit                # does not return

.data

msg1: .asciz "Number of args: %d\n"
msg2: .asciz "Arg %d is \"%s\"\n"
