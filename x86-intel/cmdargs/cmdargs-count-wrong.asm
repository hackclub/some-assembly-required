;; x86 Intel syntax
; nasm -f macho64 cmdargs.asm && ld cmdargs.o -o cmdargs -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./cmdargs
; yasm -f macho64 cmdargs.asm && ld cmdargs.o -o cmdargs -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem && ./cmdargs

; some register info, probably put this somewhere else
;
; rax - used to tell the OS what syscall we want to call
; rdi - used to pass 1st argument to syscalls
; rsi - used to pass 2nd argument to syscalls
; rdx - used to pass 3rd argument to syscalls
; rcx - used to pass 4th argument to syscalls
; r8 - used to pass 5th argument to syscalls
; r9 - used to pass 6th argument to syscalls

; ./cmdargs arg1 arg2 arg3
; +---------+
; |  STACK  |
; +---------+
; | 4       |
; | cmdargs |
; | arg1    |
; | arg2    |
; | arg3    |
; +---------+

section .data

section .text
    global _main

; SUPPOSEDLY, at the beginning of _main:
; rdi - contains argc
; rsi - contains **argv (*argv[], so a memory address pointing to the memory address of the first character of the first command line argument)
_main:
  call .printNumberOfArgs
  call .printNewline
  call .exit

.printNumberOfArgs:
  ; When we start a function, the top of the stack contains the address of the calling function (in this case, _main).
  ; Here, we pop it off so we can get to the next item in the stack.
  ; We pop it into a register (rbx) so we can use it later.
  pop rbx

  ; The next word in the stack contains the number of command-line args that were passed.
  ; Here, we pop it off into a register so we can work with it.
  ;
  ; So, after this line, we have important values in two registers:
  ; rbx - Contains the address of _main
  ; rcx - Contains the number of command-line args that were passed.
  pop rcx

  ; This converts us from a single-digit number to the ASCII representation of that number.
  ; It works because the character '0' is 48 in the ASCII table, so if rcx contains 0, adding 48 will change it from
  ; containing 0 to 48 ('0' in ASCII). Similarly, 1 + 48 = 49 ('1' in ASCII), 2 + 48 = 50 ('2'), etc.
  ;
  ; Fun experiment: try passing 9 command line arguments (which will be 10 including the executable name), then check
  ; the ASCII table and try to figure out what happened!
  add rcx, 48

  ; Push the ASCII-converted value back on the stack so it can be printed.
  push rcx

  ; Store the value of the stack pointer (which is a MEMORY ADDRESS that currently points to our ASCII-converted
  ; command-line args count) in rsi.
  ;
  ; sys_write (the system call that prints stuff to your terminal) looks in rsi for a pointer to the first character of
  ; your string.
  ;
  ; Note: rsi is actually argument 2 to sys_write. Argument 1 specifies where sys_write should write _to_. In the print
  ; function, we'll be setting that to stdout.
  mov rsi, rsp

  ; sys_write will use this to determine how many bytes to print. Since we're only printing 1 character, we only want
  ; to print 1 byte.
  mov rdx, 1

  ; If you scroll back up to the beginning of this function, you'll remember that we stored the address of _main in rbx.
  ; Now that we've converted the command-line arguments count from a real number to an ASCII number and put it back on
  ; the stack, we can put the address of _main back on top of it, just like it was at the beginning of this function.
  push rbx

  ; Print our number!
  call .print

  ; clean up the newline character pushed onto the stack. Retaining the return
  ; address currently on top of stack
  pop rbx
  pop rcx
  push rbx

  ret

.printNewline:
  ; Again, when we start a function, the top of the stack contains the address of the calling function.
  ; Here, we pop it off so we can get to the next item in the stack.
  ; We pop it into a register (rbx) so we can use it later.
  pop rbx

  ; 10 is the ASCII code for a newline.
  ; Push it onto the stack so we can get a memory address for it below.
  push 10

  ; Store the value of the stack pointer (which is a MEMORY ADDRESS that currently points to our newline character) in
  ; rsi, so that sys_write will print it later (see the explanation in .printNumberOfArgs for more info).\
  mov rsi, rsp

  ; sys_write will use this to determine how many bytes to print. Since we're only printing 1 character, we only want
  ; to print 1 byte.
  mov rdx, 1

  ; Again, put the address of the calling function back on the stack (on top of the newly-added newline character).
  push rbx

  ; Print our newline!
  call .print

  ; clean up the newline character pushed onto the stack.
  ; Retaining the return address currently on top of stack
  pop rbx
  pop rcx
  push rbx

  ret

.print:
  ; Specify that we want syscall to call sys_write
  mov rax, 0x2000004

  ; Set argument 1 to sys_write. This tells sys_write that we want to write to stdout.
  ; Argument 2 (the memory address of the start of the string to print) is in rsi and should've been set by the .print caller.
  ; Argument 3 (the length of the string to print) is in rdx and should've also been set by the caller.
  mov rdi, 1

  ; rax(rdi, rsi, rdx, ...) which translates to:
  ; sys_write(rdi, rsi, rdx)
  syscall

  ret

.exit:
  mov rax, 0x2000001 ; system call for exit
  mov rdi, 0  ; exit code 0
  syscall     ; invoke operating system to exit
