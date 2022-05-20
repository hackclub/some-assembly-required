;; x86 Intel syntax
; nasm -f macho64 program.asm && ld program.o -o program -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./program

section .data
    msg: db "Sanity", 10
    .len: equ $ - msg

section .text
  global _main

_main:
  call DisplayArg

Print: ; print expects the calling location to be at top of stack
  mov     rax, 0x2000004 ; system call for write
  mov     rdi, 1 ; Set output to stdout. 1 = stdout, which is normally connected to the terminal.
  syscall ; invoke operating system to do the write
  ret

DisplayArg:
  add rsp, 770 ; for some reason we have to add 770 to our stack pointer to get to where our argument is
  mov rsi, rsp  ; contents of memory address of stack pointer
  mov rdx, 5    ; how long is the message?

  call Print

Sanity:
  mov     rsi, msg ; address of string to output
  mov     rdx, msg.len ; rdx holds address of next byte to write. msg.len is the number of bytes to write
  call Print

Exit:
  mov     rax, 0x2000001 ; system call for exit
  mov     rdi, 0 ; exit code 0
  syscall ; invoke operating system to exit
