; https://rderik.com/blog/let-s-write-some-assembly-code-in-macos-for-intel-x86-64/

; Generate an object file using yasm
; yasm -f macho64 x86-intel.asm

; Use the linker to link to the system's dylibs (dynamic libraries)
; ld -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -o x86-intel x86-intel.o

  section  .data
message: db    "Hello, World!", 0Ah, 00h
  global  _main
  section  .text
_main:
  mov    rax, 0x02000004    ; system call for write
  syscall                   ; execute syscall (exit)
