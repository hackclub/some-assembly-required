;; x86 Intel syntax
; yasm -f macho64 cmdargs-count.asm && ld cmdargs-count.o -o cmdargs-count -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem && ./cmdargs-count

section .data

section .text
    global _main

; In an x86-64 System V, at the beginning of _main:
; rdi - contains the number of command-line arguments that were passed.
; rsi - contains **argv (*argv[], so a memory address pointing to the memory address of the first character of the first command line argument)
_main:
  call .printNumberOfArgs
  call .printNewline
  call .exit

.printNumberOfArgs:
  ; When we start a function, the top of the stack contains the address of the calling function (in this case, _main).
  ; Here, we pop it off so we can add things underneath where it was.
  ; We pop it into a register (rbx) so we can use it again later.
  pop rbx

  ; As mentioned above, rdi contains the number of command-line arguments that were passed. Here, we move this value
  ; into rcx so we can modify it without polluting the value for other potential callers.
  ;
  ; So, after this line, we have important values in two registers:
  ; rbx - Contains the address of _main
  ; rcx - Contains the number of command-line args that were passed.
  mov rcx, rdi

  ; This converts our argument count from a single-digit integer to the ASCII representation of that number.
  ; It works because the character '0' is 48 in the ASCII table, so if rcx contains 0, adding 48 will change it from
  ; containing 0 to 48 ('0' in ASCII). Similarly, 1 + 48 = 49 ('1' in ASCII), 2 + 48 = 50 ('2'), etc.
  ;
  ; Fun experiment: try passing 9 command line arguments (which will be 10 including the executable name), then check
  ; the ASCII table and try to figure out what happened!
  add rcx, 48

  ; Push the ASCII-converted value onto the stack so we can get a memory address for it.
  push rcx

  ; Store the value of the stack pointer (which is a MEMORY ADDRESS that currently points to our ASCII-converted
  ; command-line args count) in rsi.
  ;
  ; sys_write (the system call that prints stuff to your terminal) looks in rsi for a pointer to the first character of
  ; your string.
  ;
  ; Note: rsi is actually argument 2 to sys_write. Argument 1 specifies where sys_write should write _to_. See the
  ; .print function below for more info.
  mov rsi, rsp

  ; sys_write will use this to determine how many bytes to print. Since we're only printing 1 character, we only want
  ; to print 1 byte (8 bits).
  mov rdx, 1

  ; If you scroll back up to the beginning of this function, you'll remember that we stored the address of _main in rbx.
  ; We need to keep that value safe until we return from this function, but we're about to call another function, which
  ; could theoretically mess with rbx.
  ;
  ; To keep it safe, we'll push it onto the stack (assembly language ettiquette dictates that other functions should only
  ; pop what they push).
  push rbx

  ; Print our number!
  ; Note: call automatically pushes our caller memory address (that's us!) onto
  ; the stack
  ; ret is called in .print, which cleans up for us by popping our mem address off the stack
  call .print

  ; Now that our other function has returned, we can pop the memory address of _main back into rbx.
  pop rbx

  ; Let's clean up after ourselves. We're done with the ASCII character we pushed onto the stack for printing, so let's
  ; pop it off so the stack isn't messy for future callers.
  pop rcx

  ; Push the value of rbx (which, again, is the memory address of _main) back onto the stack so `ret` knows where we're
  ; returning to.
  push rbx

  ; Return back to _main (which is the memory address that is currently on the top of the stack).
  ret

.printNewline:
  ; Again, when we start a function, the top of the stack contains the address of the calling function.
  ; Here, we pop it off so we can add things underneath where it was.
  ; We pop it into a register (rbx) so we can use it later.
  pop rbx

  ; 10 is the ASCII code for a newline.
  ; Push it onto the stack so we can get a memory address for it below.
  push 10

  ; Store the value of the stack pointer (rsp) (which is a MEMORY ADDRESS that currently points to our newline character) in
  ; rsi, so that sys_write will print it later (see the explanation in .printNumberOfArgs for more info on sys_write)
  mov rsi, rsp

  ; sys_write will use this to determine how many bytes to print. Since we're only printing 1 character, we only want
  ; to print 1 byte.
  mov rdx, 1

  ; Again, put the address of the calling function back on the stack (on top of the newly-added newline character).
  push rbx

  ; Print our newline!
  ; Note: call automatically pushes our caller memory address (that's us!) onto
  ; the stack
  ; ret is called in .print, which cleans up for us by popping our mem address off the stack
  call .print

  ; Clean up the newline character pushed onto the stack.
  ; Retaining the return address currently on top of stack

  ; Now that our other function has returned, we can pop the memory address of _main back into rbx.
  pop rbx

  ; Let's clean up after ourselves. We're done with the newline we pushed onto the stack for printing, so let's
  ; pop it off so the stack isn't messy for future callers.
  pop rcx

  ; Push the value of rbx (which, again, is the memory address of _main) back onto the stack so `ret` knows where we're
  ; returning to.
  push rbx

  ; Return back to _main (which is the memory address that is currently on the top of the stack).
  ret

; In .print, we're going to make a syscall, which makes some assumptions about what's in our registers. Specifically:
;
; rax - used to tell the OS what syscall we want to call.
; rdi - used to pass 1st argument to syscalls.
; rsi - used to pass 2nd argument to syscalls.
; rdx - used to pass 3rd argument to syscalls.
; rcx - used to pass 4th argument to syscalls.
; r8  - used to pass 5th argument to syscalls.
; r9  - used to pass 6th argument to syscalls.
;
; In other words, when we call syscall, we're basically calling:
; rax(rdi, rsi, rdx, rcx, r8, r9)
.print:
  ; Specify that we want syscall to call sys_write.
  ; rax is used to tell the OS what syscall we want to call.
  ; 0x200000 is used to say we are on MacOSX.
  ; 4 is used to say we want to call sys_write.
  mov rax, 0x2000004

  ; Set argument 1 (rdi) to stdout. This tells sys_write that we want to write to stdout.
  ; Argument 2 (the memory address of the start of the string to print) is in rsi and should've been set by the .print caller.
  ; Argument 3 (the length of the string to print) is in rdx and should've also been set by the caller.
  mov rdi, 1

  ; syscall takes all of the stuff we've set up in registers and calls it accordingly.
  ; Here, we've set values on:
  ;
  ; rax, rdi, rsi, and rdx
  ;
  ; which translates to:
  ;
  ; sys_write(rdi, rsi, rdx)
  syscall

  ; Return back to whatever called .print
  ret

.exit:
  mov rax, 0x2000001 ; syscall for exit
  mov rdi, 0         ; exit code 0
  syscall
