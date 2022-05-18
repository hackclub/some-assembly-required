; nasm -f macho64 x86-intel.asm
; ld x86-intel.o -o x86-intel -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie
; ./x86-intel

; nasm -f macho64 x86-intel.asm && ld x86-intel.o -o x86-intel -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./x86-intel

section .data
    msg: db "Hello, world!", 10
    .len: equ $ - msg

section .text
    global _main

_main:
    mov     rax, 0x2000004 ; write
    mov     rdi, 1 ; stdout
    mov     rsi, msg
    mov     rdx, msg.len
    syscall

    mov     rax, 0x2000001 ; exit
    mov     rdi, 0
    syscall
