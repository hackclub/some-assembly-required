# Registers

Now that we know about data, we should talk about storing data. In our brief mention of registers previously, we learned that registers are available for short term data storage on the CPU.

We'll be talking about the **x86-64** registers here, but the concepts apply to other processors as well.

<p align="center">
  <br />
  <img height="600" src="https://cloud-1dple0n1y-hack-club-bot.vercel.app/0screen_shot_2022-06-01_at_10.49.40_am.png">
  <br />
  <span>
    <em>
      Commonly used registers from <a href="https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html">Stanford CS107</a>
    </em>
  </span>
</p>
<br />

## Register data

The amount of [bits](/guide/writing-code/data.md) a register can hold depends on the processor.

Have you heard of **32-bit** or **64-bit**? That's referring to the size of the registers in the processor! So a 64-bit processor has twice the room in a single register as 32-bit processors, which looks like:

```
0000101011111000011000110101000100001010111110000110001101010001
```

The original x86 processors were 32-bit, so we specify the "-64" in "x86-64" to know we're talking about the 64-bit version. You'll see some examples online that use the 32-bit version, and the registers they refer to are different. Usually 32-bit registers start with the letter `E`, whereas 64-bit registers usually start with the letter `R`.

Since a register holds **64 bits**, that can also be translated to **8 bytes** (64 _(bits)_ divided by 8 _(bits in a byte)_).

Just like we have **bytes** to refer to groups of **bits**, we have **words** to refer to groups of **bytes**.

- A **single word** is **2 bytes**, which is 16 bits (2 _(bytes) multiplied by 8 _(bits per byte)_).

- A **double word** is **4 bytes**, which is 32 bits (4 _(bytes) multiplied by 8 _(bits per byte)_).

- A **quadruple word** is **8 bytes**, which is 64 bits (8 _(bytes) multiplied by 8 _(bits per byte)_).

So, another way to refer to the register size is as a quadruple word, or **qword**.

## Return value

TODO: explain return values

## Arguments

TODO: explain argument registers

%rdi argc

%rsi argv[][]

## Caller-owned vs Callee-owned

TODO: Make this friendlier

Registers that are all-purpose have a conventions depending on whether **caller-owned** or **callee-owned**.

For example, if the function `function1` calls `function2`, we refer to `function1` as the **caller** and `function2` as the **callee**. The registers used for the first 6 arguments and return value are all **callee-owned**.

That means that the **callee** can freely use those registers, overwriting existing values without taking any precautions. If `%rax` holds a value the **caller** wants to retain, the caller must copy the value to a "safe" location before making a call. The **callee-owned** registers are ideal for _scratch/temporary_ use by the **callee**.

In contrast, if the **callee** intends to use a **caller-owned** register, it must first _preserve its value_ and _restore it_ before exiting the call. The **caller-owned** registers are used for _local state_ of the **caller** that needs to preserved across further function calls.

## The Instruction Pointer

The CPU has many specialized registers, which we don't access directly. One of them is the **instruction pointer** (`%rip`), also known as the **program counter**, which keeps track of what code it's executing. This register stores the memory address of the current line of the current program it's executing, and updates itself automatically. For example, let’s say we are running an assembly program. There's an instruction for adding two numbers together. Once that instruction finishes running, the program counter increments to the memory address of the next instruction of the program.

However, besides just incrementing by one, the program counter itself can be changed with a JUMP instruction.

```asm
  jmp .placeToJump
```

In this case, the program would change the program counter so that it points to the line `.placeToJump`, leading the next line of instruction run to be the line at `.placeToJump`. When compiled to machine code, `.placeToJump` would be a specific address in the memory with the next instruction.

## The Stack Pointer

Computers allocate a chunk of memory to be the “stack”, a place where you can store bytes for later use. You can do 2 things with a stack: **push** values onto it, which go on top of the previous values, and **pop** values off of it, which grabs from the top of the stack. Need something at the bottom? Too bad! You gotta go through the top.

<p align="center">
  <br />
  <img height="200" src="https://holycoders.com/content/images/wordpress/2020/04/Stack-data-structure.png">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you’d be correct! However, we have a limited number of registers. Let’s say we are doing some complicated math, and we need to store a few amounts away for a while while we work through a problem. We can just push those values to save on the stack, and then when we’re done with that math, we can pop them off and continue like nothing ever happened. Very convenient!

So now that we know about the stack, the **stack pointer** (`%rsp`) is a special register the CPU has that keeps track of where the top of the stack is. So every time we push onto the stack, it automatically increments the pointer. Every time we pop off of the stack, it automatically decrements it. This pointer is actually pointing to the address of where this value lives in memory, since we have a special area of the memory sectioned off just for our stack.

Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It’s named after this stack right here! You don’t need to know this for the purposes of this guide, but while we’re here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

## Flags

TODO: explain flags

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
