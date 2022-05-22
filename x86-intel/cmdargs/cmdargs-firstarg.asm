;; x86 Intel syntax
; yasm -f macho64 cmdargs-firstarg.asm && ld cmdargs-firstarg.o -o cmdargs-firstarg -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem && ./cmdargs-firstarg

section .data

section .text
    global _main

; In an x86-64 System V processor, at the beginning of _main:
; rdi - contains argc, which is the name in C for the integer number of command-line arguments that were passed.
; rsi - contains argv[][], which is the name in C for the array of command-line arguments. This will be explained
;       more below.
; **argv
_main:
  ; As described above, in an x86-64 System V processor, the rsi register starts out with argv[][] in it.
  ; However, .print looks in rsi for a pointer to the first character it should print, so we're going to be using that
  ; register a bunch.
  ; Let's keep its value safe by pushing it onto the stack.
  push rsi

  ; Run our program!
  call .printNumberOfArgs
  call .printNewline
  call .printFirstArg
  call .printNewline
  call .exit

.printNumberOfArgs:
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

  ; Print our number!
  ; Note: call automatically pushes our caller memory address (that's us!) onto
  ; the stack
  ; ret is called in .print, which cleans up for us by popping our mem address off the stack
  call .print

  ; Let's clean up after ourselves. We're done with the ASCII character we pushed onto the stack for printing, so let's
  ; pop it off so the stack isn't messy for future callers.
  pop rcx

  ; Return back to _main (which is the memory address that is currently on the top of the stack).
  ret


.printNewline:
  ; 10 is the ASCII code for a newline.
  ; Push it onto the stack so we can get a memory address for it below.
  push 10

  ; Store the value of the stack pointer (rsp) (which is a MEMORY ADDRESS that currently points to our newline character) in
  ; rsi, so that sys_write will print it later (see the explanation in .printNumberOfArgs for more info on sys_write)
  mov rsi, rsp

  ; sys_write will use this to determine how many bytes to print. Since we're only printing 1 character, we only want
  ; to print 1 byte.
  mov rdx, 1
  ; Print our newline!
  ; Note: call automatically pushes our caller memory address (that's us!) onto
  ; the stack
  ; ret is called in .print, which cleans up for us by popping our mem address off the stack
  call .print

  ; Clean up the newline character pushed onto the stack.
  ; Retaining the return address currently on top of stack
  ; Let's clean up after ourselves. We're done with the newline we pushed onto the stack for printing, so let's
  ; pop it off so the stack isn't messy for future callers.
  pop rcx

  ; Return back to _main (which is the memory address that is currently on the top of the stack).
  ret

.printFirstArg:
  ; As we explained at the beginning of _main, in an x86-64 System V processor, the rsi register starts out with
  ; argv[][] in it (this will be explained more below).
  ; However, .print looks in rsi for a pointer to the first character it should print, so we've already overwritten rsi
  ; with other stuff.
  ; Luckily, we pushed the value of rsi onto the stack at the beginning of _main to keep it safe! That means it's
  ; currently on the stack, right below the memory address of _main (which `call .printFirstArg` put there).
  ;
  ; So, first we'll pop the memory address of _main into rbx (so we can use it for `ret` at the end of this function).
  pop rbx

  ; And now, we'll pop argv[][] into rcx.
  ;
  ; What's argv[][]?
  ;
  ; In C, a string is really just an array of characters, which looks like char[]. That means, if you want an array of
  ; strings in C, you actually need an array of arrays (specifically, an array of char[], or char[][]). So, as you'd
  ; probably imagine, our command-line arguments are passed as an array of strings, which in C is named argv[][].
  pop rcx

  ; Now, what actually _is_ an array at the assembly level? The answer is really simple: it's just a memory address
  ; pointing to the first element in the array.
  ;
  ; For example, if you had an array of integers that looked like this:
  ; +-----------+-----+
  ; |  address  | val |
  ; +-----------+-----|
  ; | 0x03a8000 | 919 |
  ; | 0x03a8040 |  30 |
  ; | 0x03a8080 | 245 |
  ; | 0x03a80c0 | 689 |
  ; +-----------+-----|
  ; The array would just be represented by the value 0x03a8000. If you wanted to read the array, you'd need to *follow*
  ; this address into memory, asking your computer for the value stored at this address (in the above example, 919).
  ;
  ; How do we follow an address into memory? In assembly, you surround it with []s. Below, when we write [rcx], we're
  ; saying "we don't want the value stored in the rcx register, we want a value stored in MEMORY, and the rcx register
  ; contains the memory address we want you to go to to grab that value."
  ;
  ; Finally, the qword part is necessary just because we're on a 64-bit system. If we were on a 32-bit system, we'd
  ; write dword [rcx] instead, and if we were on a 16-bit system, we could just write [rcx] with nothing in front.
  ;
  ; So, with all that in mind, we follow rcx into memory and move the value (which is our first command-line arg) into
  ; rcx so that the sys_write syscall can write it when we call .print below.
  mov rsi, qword [rcx]

  ; Currently, we're just going to print the first 18 characters of the first argument, because the first argument is
  ; just the name of the program, and the name of this program was "./cmdargs-firstarg" (18 characters) at the time of
  ; this writing.
  ;
  ; Dynamically calculating the actual length of a string is not very hard, don't worry! We're just leaving it for the
  ; next step.
  mov rdx, 18

  ; Put our argv[][] and _main pointer values back on the stack where they started, in case .print wants to use the
  ; registers they're in.
  push rcx
  push rbx

  ; Print our first command-line arg!
  call .print

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

  ; return back to whatever called .print
  ret

.exit:
  mov rax, 0x2000001 ; syscall for exit
  mov rdi, 0         ; exit code 0
  syscall
