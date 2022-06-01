# Registers

Now that we know about data, we should talk about storing data. In our brief mention of registers previously, we learned that registers are available for short term data storage on the CPU.

<p align="center">
  <br />
  <img height="600" src="https://cloud-1dple0n1y-hack-club-bot.vercel.app/0screen_shot_2022-06-01_at_10.49.40_am.png">
  <br />
  <span>
    <em>
      Commonly used x86-64 registers
    </em>
  </span>
</p>
<br />

From [Stanford CS107](https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html), the table above lists the commonly used registers. Each register is 64 bits.

Some registers are designated for a certain purpose, such as `%rsp` being used as the stack pointer or `%rax` for the return value from a function.

## The Program Counter
The CPU has many specialized registers, which we don't access directly. One of them is the **program counter** (`%rip`), also known as the **instruction pointer**, which keeps track of what code it's executing. This register stores the memory address of the current line of the current program it's executing, and updates itself automatically. For example, let’s say we are running an assembly program. There's an instruction for adding two numbers together. Once that instruction finishes running, the program counter increments to the memory address of the next instruction of the program.

However, besides just incrementing by one, the program counter itself can be changed with a JUMP instruction.

```asm
  jmp .placeToJump
```

In this case, the program would change the program counter so that it points to the line `.placeToJump`, leading the next line of instruction run to be the line at `.placeToJump`. When compiled to machine code, `.placeToJump` would be a specific address in the RAM with the next instruction.

## The Stack Pointer

Computers allocate a chunk of memory in the RAM to be the “stack”, a place where you can store bytes for later use. You can do 2 things with a stack: push values onto it, which go on top of the previous values, and pop values off of it, which grabs from the top of the stack. Need something at the bottom? Too bad! You gotta go through the top.

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you’d be correct! However, we have a limited number of registers. Let’s say we are doing some complicated math, and we need to store a few amounts away for a while while we work through a problem. We can just push those values to save on the stack, and then when we’re done with that math, we can pop them off and continue like nothing ever happened. Very convenient!

So now that we know about the stack, the **stack pointer** (`%rsp`) is a special register the CPU has that keeps track of where the top of the stack is. So every time we push onto the stack, it automatically increments the pointer. Every time we pop off of the stack, it automatically decrements it. This pointer is actually pointing to the address of where this value lives in memory, since we have a special area of the memory sectioned off just for our stack.

Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It’s named after this stack right here! You don’t need to know this for the purposes of this guide, but while we’re here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

## Caller-owned vs Callee-owned

Other registers are all-purpose, but have a conventional use depending on whether **caller-owned** or **callee-owned**.

For example, if the function `function1` calls `function2`, we refer to `function1` as the **caller** and `function2` as the **callee**. The registers used for the first 6 arguments and return value are all **callee-owned**.

That means that the **callee** can freely use those registers, overwriting existing values without taking any precautions. If `%rax` holds a value the **caller** wants to retain, the caller must copy the value to a "safe" location before making a call. The **callee-owned** registers are ideal for _scratch/temporary_ use by the **callee**.

In contrast, if the **callee** intends to use a **caller-owned** register, it must first _preserve its value_ and _restore it_ before exiting the call. The **caller-owned** registers are used for _local state_ of the **caller** that needs to preserved across further function calls.

<br />

---

<a href="/guide/writing-code/data.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions.md">
        Let's boss this computer around →
      </a>
    </b>
  </em>
</p>
