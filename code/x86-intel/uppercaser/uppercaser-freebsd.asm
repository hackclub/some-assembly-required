
; ==================================================================================
; UPPERCASER
;
; Uppercases your command line arguments and prints them out!
; Written as a working example of an x86 Intel syntax assembly language program
; ==================================================================================

; Assembler used: YASM
; Assembly syntax: x86 Intel
; CPU architecture: Intel x86-64
; Platform architecture: FreeBSD
; OS architecture: FreeBSD

;; To run on x86-64 processor, Intel syntax:
; yasm -f elf64 uppercaser-freebsd.asm && cc -o uppercaser-freebsd uppercaser-freebsd.o && ./uppercaser-freebsd

section .data

section .text
    global main

; In an x86-64 processor (System V) at the beginning of _main:
; rdi - contains argc, which is the name in C for the integer number of command-line arguments that were passed.
; rsi - contains argv[][], which is the name in C for the array of command-line arguments. This will be explained
;       more below.
main:
  ; As described above, rdi and rsi contain info about our command-line arguments. However, as described in
  ; https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html, these registers are "callee-owned",
  ; which means any functions we call may mess with their values and not clean them up.
  ;
  ; Let's keep their values safe by copying them into r12 and r13, which are caller-owned registers (also described in
  ; the link above). If assembly language etiquette is followed, if a function wants to use one of these registers, it
  ; must first push its value onto the stack, and then pop it back off into the register before returning. Of course,
  ; you could write a function that breaks these rules, which is part of why assembly language can be dangerous!
  mov r12, rdi ; argc
  mov r13, rsi ; argv[][]

  ; Uncomment the next two lines to print the argument count
  ; call .printNumberOfArgs
  ; call .printNewline

  ; Print all arguments, separated by newlines.
  ;
  ; We push argc and argv[][] (which will be explained more below) onto the stack here as arguments to .printAllArgs.
  ; If these 3 lines were compiled from C, the C function call would look like:
  ;
  ; printAllArgs(argc, argv[][]);
  push r13 ; argv[][]
  push r12 ; argc
  call .printAllArgs

  ; We're done! Exit our program.
  call .exit

.printNumberOfArgs:
  ; Since this is the first function we call, we know rdi still contains the number of command-line arguments that were
  ; passed. In future functions, we won't be able to make assumptions like this, but it's okay here.
  ;
  ; This line converts our argument count from a single-digit integer to the ASCII representation of that number.
  ; It works because the character '0' is 48 in the ASCII table, so if rdi contains 0, adding 48 will change it from
  ; containing 0 to 48 ('0' in ASCII). Similarly, 1 + 48 = 49 ('1' in ASCII), 2 + 48 = 50 ('2'), etc.
  ;
  ; Fun experiment: try passing 9 command line arguments (which will be 10 including the executable name), then check
  ; the ASCII table and try to figure out what happened!
  add rdi, 48

  ; Push the ASCII-converted value onto the stack so we can get a memory address for it.
  push rdi

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
  ; dispose of it. You may be expecting to see a `pop` instruction here, but `pop` also stores the value in a register,
  ; which we don't need to do here, since we're just disposing of it. Instead, we just add 8 to the stack pointer,
  ; which effectively removes the top value of the stack without putting it anywhere.
  add rsp, 8

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
  ; Note: call automatically pushes our caller memory address (that's us!) onto the stack.
  ; ret is called in .print, which cleans up for us by popping our memory address off the stack
  call .print

  ; Let's clean up after ourselves. We're done with the newline character we pushed onto the stack for printing, so
  ; let's dispose of it, just like we did in .printNumberOfArgs
  add rsp, 8

  ; Return back to the calling function (which is the memory address that is currently on the top of the stack).
  ret

.printAllArgs:
  ; Prior to calling this function in _main, we pushed two values onto the stack: the argument count first, then
  ; argv[][] (which, again, will be explained more below). We need both of these values in this function, so we pop
  ; them off into two callee-owned registers.
  ; First though, `call` put the memory address of the line it was on at the very top of the stack, so we need to pop
  ; it off before the other ones. After grabbing all the values we need, we can push that memory address back onto the
  ; stack so `ret` can use it at the end of the function.
  pop rbx  ; memory address of the line we were called from
  pop rdi  ; argc
  pop rcx  ; argv[][]
  push rbx ; memory address goes back on the stack

  ; rax will hold the counter for how many of our command-line args we've been through. We'll be incrementing this by 1
  ; every time we print a command-line arg.
  ;
  ; We will start at 1 since we are skipping our first command line argument,
  ; our program ("./uppercaser-freebsd.asm").
  mov rax, 1

  ; This is where we loop over the command-line args args!
  .printArgsLoopStart:
    ; First, remember: all 3 registers that we're using are callee-owned, so any functions we call might modify them.
    ; To keep them safe, we'll push them onto the stack before calling a function, then pop them back off afterwards.
    push rdi
    push rcx
    push rax

    ; Print a command-line arg and a newline!
    ; Before calling .printArg, we push rcx onto the stack so .printArg can grab it as an argument.
    ; As we said above, on the first iteration of this loop, rcx contains argv[][]. Scroll down to .printArg for our
    ; often-promised explanation of what argv[][] actually is.
    push rcx
    call .printArg
    call .printNewline

    ; Now that we've called .printArg, we can safely put our values back in their registers without worrying about them
    ; getting modified.
    pop rax
    pop rcx
    pop rdi

    ; Here, we increment two values: rax (by 1) and rcx (by 8).
    ; We increment rax by 1 because it's keeping track of how many command-line arguments we've printed so far.
    ; We increment rcx by 8 because rcx points to the beginning of an array of memory addresses. Remember, memory
    ; addresses are 8 bytes long, so we need to increment by 8 to get to the next one. For comparison, a pointer to an
    ; array of bytes (as described in .printArg) would only need to be incremented by 1 to get to the next element.
    inc rax
    add rcx, 8

    ; Here, we check if the command-line arg counter (rax) is equal to the number of command-line arguments that were
    ; passed (argc, currently stored in rdi).
    ;
    ; The cmp instruction compares two values, and records which one is greater (or if they're equal) in a special
    ; register called the EFLAGS register. Don't worry about the details of EFLAGS for now; just remember that, after
    ; running the cmp instruction, the result of the comparison is saved into EFLAGS.
    ; In this case, we are comparing rax (the number of command-line args printed so far) with rdi (the number of
    ; command-line args that were passed).
    cmp rax, rdi

    ; jl stands for "Jump if Less Than". The jl instruction checks the EFLAGS register we described above.
    ; If EFLAGS says that the first argument to cmp was less than the second, it jumps to the specified label.
    ; So, in this case, if rax < rdi, we jump back up to the beginning of the loop!
    ; If rax >= rdi, this instruction does nothing, which means the loop effectively ends. This is exactly what we
    ; want, because once the number of command-line args printed so far matches the number of command-line args that
    ; were passed, it means we've printed all the command-line args!
    jl .printArgsLoopStart

  ret

.printArg:
  ; Dig into the stack a little to get the string into rcx, but then put the return address back on the stack so we can
  ; return at the end of this function.
  pop rbx
  pop rcx
  push rbx

  ; Finally, the explanation you've all been waiting for:
  ; ====================
  ; = What's argv[][]? =
  ; ====================
  ;
  ; In C, a string is really just an array of characters, which looks like char[]. That means, if you want an array of
  ; strings in C, you actually need an array of arrays (specifically, an array of char[], or char[][]). So, as you'd
  ; probably imagine, our command-line arguments are passed as an array of strings, which in C is named argv[][].

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
  ; Finally, the qword part is necessary because, when we're following addresses into memory, we need to tell the
  ; computer what the size of the data we want back is. Since we're on a 64-bit system, our registers are 64 bits, so
  ; we need to ask for a qword (a 64-bit word) back. If we only wanted ot grab 32 bits out of memory, we'd write
  ; dword [rcx] instead, and if we just wanted to grab a single byte, we'd write byte [rcx] (we'll actually see this
  ; later).
  ;
  ; So, with all that in mind, we follow rcx into memory and move the value (which is our command-line arg) into rcx so
  ; that the sys_write syscall can write it when we call .print below.
  ;
  ; We are adding 8 to [rcx] so that we can skip 1 word, 8 bytes ahead.
  ;
  ; This brings us to our second command line argument in memory, which is
  ; the first thing you typed in after the program.
  ;
  ; If we didn't skip ahead, we'd also be printing out the program
  ; ("./uppercaser-freebsd.asm")
  mov rbx, qword [rcx + 8]

  ; Push the memory address of our command-line arg onto the stack twice.
  ; The first one is to keep the value safe, because we need it after our function call.
  ; The second one is to pass it as an argument to .strLen.
  push rbx
  push rbx

  ; We need to iterate over our characters to do a few things:
  ; - Calculate the length of our string so we can dynamically print it out
  ; - Uppercase letters
  call .iterate

  ; By convention, if functions have return values, they put them in rax, so we expect .strLen to have put the length
  ; of the string into rax. Move it into rdx so .print can use it.
  ;
  ; Fun point: one of the advantages of raw assembly language (over something more general-purpose like C) is that you
  ; can make little micro-optimizations to save instructions. For example, since we're using .strLen to calculate a
  ; length for .print, we could make a version of .strLen that puts its return value in rdx instead of rax so we don't
  ; have to do this extra move instruction!
  mov rdx, rax

  ; Pop the memory address of our command-line argument back into rsi so the sys_write syscall can get to it.
  pop rsi

  ; Print our command-line arg!
  call .print

  ret

.iterate:
  ; We need to iterate over our characters to do a few things:
  ; - Calculate the length of our string so we can dynamically print it out
  ; - Uppercase letters

  ; Dig into the stack a little to get the argument string into rsi, but then put
  ; the return address back on the stack so we can return at the end of this function.
  pop rbx
  pop rsi
  push rbx

  ; We can get the string length by iterating over the characters in memory until
  ; we hit a null (0) byte. Character arrays are terminated when you hit 0.

  ; rax will hold our string length counter. We'll be incrementing this as we run
  ; through the string. We start it at -1 because our loop always does at least
  ; one increment, even on a 0-length string.
  mov rax, -1

  ; This is where we loop over each character in the string!
  .iterateLoop:
    ; First, we increment the length counter. This is why we started it at -1: the loop always executes at least once,
    ; and rax will be incremented from -1 to 0 on the first iteration, which will give us a value of 0 on an empty
    ; string.
    inc rax

    ; Here, we check if the current character is 0 (null). Let's break this down a little bit:
    ;
    ; rsi contains a pointer to the first character in the string.
    ; rax contains the number of characters we've looked at so far (0 on the first iteration, 1 on the second, etc.)
    ;
    ; What's rsi + rax ?
    ; So, on the first iteration, rsi + rax = rsi + 0 = rsi (the memory address of the first character in the string).
    ; On the second iteration, rsi + rax = rsi + 1 (the memory address of the second character in the string).
    ; On the third iteration, rsi + rax = rsi + 2 (the memory address of the third character in the string).
    ; and so on.
    ;
    ; What's [rsi + rax] ?
    ; As we discussed in .printArg, surrounding a value with [] follows it into memory.
    ; So, while rsi + rax is a memory address, [rsi + rax] is the character AT that memory address.
    ;
    ; What's byte [rsi + rax] ?
    ; As we discussed in .printArg, when we follow an address into memory, we need to tell the computer how much
    ; memory we want to grab. Since we're working with characters (which are each a single byte), we only want to grab
    ; one byte from memory, so we prefix [rsi + rax] with the word "byte".
    ;
    ; What's cmp byte [rsi + rax], 0 ?
    ; The cmp instruction compares two values, and records which one is greater (or if they're equal) in a special
    ; register called the EFLAGS register. Don't worry about the details of EFLAGS for now; just remember that, after
    ; running the cmp instruction, the result of the comparison is saved into EFLAGS.
    ; In this case, we are comparing byte [rsi + rax] (the current character in the string, as described above) with 0
    ; (the null character).
    cmp byte [rsi + rax], 0

    ; jz stands for "Jump if Zero". The jz instruction checks the EFLAGS register we described above.
    ; If EFLAGS is zero, it jumps to the specified label.
    ; So, in this case, if the current character is null, we jump to a return statement!
    ; This is exactly what we want, because a null character indicates the end of a string, which means
    ; we're done counting!
    ;
    ; This is effectively an early return statement.
    jz .return

    call .uppercase
    call .iterateLoop

  .uppercase:
    ; Compare our current character to see if it's within the bounds of being
    ; a lower case letter
    ; 97 is the beginning of the lowercase ASCII characters
    cmp byte [rsi + rax], 97

    ; jl stands for "Jump if Lower". The jl instruction checks the EFLAGS register we described above.
    ; We want to return early if our current character is lower than where the lower case
    ; letters start, meaning it's not a character that's uppercase-able.
    jl .return

    ; Compare our current character to see if it's within the bounds of being
    ; a lower case letter
    ; 122 is the end of the lowercase ASCII characters
    cmp byte [rsi + rax], 122

    ; jg stands for "Jump if Greater". The jg instruction checks the EFLAGS register we described above.
    ; We want to return early if our current character is higher than where the lower case
    ; letters end, meaning it's not a character that's uppercase-able
    jg .return

    ; Subtracting 32 from our current character gives us the uppercase character
    ; in ASCII
    sub byte [rsi + rax], 32
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
  ; 4 is used to say we want to call sys_write.
  ;
  ; Also note: it's theoretically possible that our calling function had stored a value in rax that it wanted to use,
  ; and we're just overwriting it here without doing anything to keep it safe! However, by assembly convention (see
  ; https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html), that's okay; rax is a callee-owned
  ; register, meaning functions are free to overwrite it without keeping it safe. If a caller wants to use the value in
  ; rax, it's up to them to put it on the stack to keep it safe before calling other functions.
  ; This is also true for rdi below!
  mov rax, 4

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

; Labelled return that we can call when we are conditionally jumping around.
.return:
  ret

.exit:
  mov rax, 1 ; syscall for exit
  mov rdi, 0 ; exit code 0
  syscall

