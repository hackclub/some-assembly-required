;; x86 Intel syntax
; nasm -f macho64 cmdargs-baseline.asm && ld cmdargs-baseline.o -o cmdargs-baseline -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./cmdargs-baseline

section .data

section .text
    global _main

_main:
  call .exit

.exit:
  mov rax, 0x2000001 ; system call for exit
  mov rdi, 0  ; exit code 0
  syscall     ; invoke operating system to exit
