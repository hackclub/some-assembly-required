# Instructions

_Note: These examples are written in X86-64 Intel syntax assembly language_

### Comments

```asm
  ; Note: Anything that comes after a semicolon is considered a comment.
  ;       A comment in code means that the compiler will ignore it, so you have
  ;       a place to jot down notes, TODOs, etc.
```

### Basic math

```asm
  add rdi, 3
```

```asm
  sub rdi, 2
```

## Jumps and Conditionals

This is not an exhaustive list, but a list of some examples of instructions to
demonstrate the kinds of conditionals assembly provides us.

A conditional is something that relies on a condition being met to execute it.

_Note: Check out http://unixwiz.net/techtips/x86-jumps.html for a list of conditional jumps for X86 Intel._

### Jump if Not Equal

```asm
  jne .placeToJump
```

### Jump if Greater

```asm
  jg .goHere
```

### Jump if Less

```asm
  jl .doSomeMath
```

### Label

```asm
  _main:
    call .performAddition
    ; ret will return here and keep executing!

  .performAddition:
    add rdi, 3
    ret ; returns back to where you left off in _main!
```

### Program counter
The CPU has many specialized registers, which we don't access directly. One of them is the program counter, which keeps track of what code it's executing. This register stores the memory address of the current line of the current program it's executing, and updates itself automatically. For example, let’s say we are running an assembly program. There's an instruction for adding two numbers together. Once that instruction finishes running, the program counter increments to the memory address of the next instruction of the program.

However, besides just incrementing by one, the program counter itself can be changed with a JUMP instruction (both conditional adn unconditional as shown above) An example of an unconditional jump os written in X86-64 assembly code:
```asm
  jmp .placeToJump
```

In this case, the program would change the program counter so that it points to the line `.placeToJump`, leading the next line of instruction run to be the line at `.placeToJump`. When compiled to machine code, `.placeToJump` would be a specific address in the RAM with the next instruction.

### The Stack

Computers allocate a chunk of memory in the RAM to be the “stack”, a place where you can store bytes **(COMMENT 🐣: would using the term data be easier to understand? readers might not completely wrap their minds around bytes yet...)** for later use. You can do 2 things with a stack: push values onto it, which go on top of the previous values, and pop values off of it, which grabs from the top of the stack. Need something at the bottom? Too bad! You gotta go through the top.

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you’d be correct! However, we have a limited number of registers. Let’s say we are doing some complicated math, and we need to store a few amounts away for a while while we work through a problem. We can just push those values to save on the stack, and then when we’re done with that math, we can pop them off and continue like nothing ever happened. Very convenient!

So now that we know about the stack, the stack pointer is a special register the CPU has that keeps track of where the top of the stack is. So every time we push onto the stack, it automatically increments the pointer. Every time we pop off of the stack, it automatically decrements it. This pointer is actually pointing to the address of where this value lives in memory, since we have a special area of the memory sectioned off just for our stack.

Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It’s named after this stack right here! You don’t need to know this for the purposes of this guide, but while we’re here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

**(COMMENT 🐣: I found this section on the stack a little hard to wrap my head around... i think an explaination and example of when a stack is used could be useful. Also, do we need to discuss other parts of the RAM like the heap? I feel like this is a little too detailed for a general overview of how the CPU works haha cuz then we might need to explain memory allocation...)**

<br />

---

<a href="/guide/writing-code/registers.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="55" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/math/number-systems.md">
        This next section definitely has absolutely nothing to do with math I promise →
      </a>
    </b>
  </em>
</p>
