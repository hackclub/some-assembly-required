# x86-64 Intel Syntax

### Code Examples

- [Hello World](/code/x86-intel/hello-world/hello-world.asm)
- [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm)

---

There are many different assembly languages, depending on the processor you want to talk to.

x86 is one of the most useful assembly languages, but is also one of the more complicated ones to write. It's used for Intel processors, which have to process a lot of data!

The `86` is pulled from the model names of the Intel chips that use this assembly language, which all end in `86` (like the `8086` chip).

The `64` is referring to the number of [bits](/guide/writing-code/data.md) that the processor registers hold. The original x86 processors were 32 bit, so we specify `-64` to know we're talking about the 64 bit version. You'll see some examples online that use the 32 bit version, and the registers they refer to are different. Usually 32 bit registers start with the letter `E`, whereas 64 bit registers usually start with the letter `R`.

## Anatomy of a program

We will use the [Hello World](/code/x86-intel/hello-world/hello-world.asm) program as our example for this, but you will see a similar setup in the [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm) program as well.

First thing you'll see is a [section for read-only constants](https://github.com/hackclub/some-assembly-required/blob/3e47d24b7b2492faea8dc2c0efcfcddc7d87a342/code/x86-intel/hello-world/hello-world.asm#L33-L43).

Our

```asm
; Section for read-only constants
section .data
    ; msg is a label
    ; db = Data Bytes
    ; saves the ASCII number equivalent of this msg into memory, retrievable later by its label
    ; 10 is ASCII for a newline
    msg: db "Hello, world!", 10

    ; Define an assemble-time constant, which is calculated during compilation
    ; Calculate len = string length.  subtract the address of the start of the string from the current position ($)
    .len: equ $ - msg
```

Next you'll see that the code that we actually want to execute on program launch [goes in the .text section](https://github.com/hackclub/some-assembly-required/blob/3e47d24b7b2492faea8dc2c0efcfcddc7d87a342/code/x86-intel/hello-world/hello-world.asm#L45-L48).

```asm
; Executable code goes in the .text section
section .text
  ; The linker looks for this symbol to set the process entry point, so execution start here
  global _main
```

We start our program in _main, where we [write "Hello World" out to the terminal]().

```asm
_main:
    mov     rax, 0x2000004 ; system call for write. anything with 0x2 is mac specific
    mov     rdi, 1 ; Set output to stdout. 1 = stdout, which is normally connected to the terminal.
    mov     rsi, msg ; address of string to output
    mov     rdx, msg.len ; rdx holds address of next byte to write. msg.len is the number of bytes to write
    syscall ; invoke operating system to do the write
```

We then [exit our program]().
```asm
  mov     rax, 0x2000001 ; system call for exit. anything with 0x2 is mac specific
  mov     rdi, 0 ; exit code 0
  syscall ; invoke operating system to exit
```

## Some common instructions explained

For more common instructions, check out the [Stanford CS107 list](https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html#common-instructions).

| Instruction | Arguments | Explanation           |
| ---         | ---       | ---                   |
| **mov**     | src, dst  | dst = src             |
| **add**     | src, dst  | dst += src            |
| **sub**     | src, dst  | dst -= src            |
| **cmp**     | a, b      | b-a set flags         |
| **jmp**     | label     | jump to label         |
| **je**      | label     | jump if equal (ZF=1)  |
| **jne**     | label     | jump not equal (ZF=0) |
| **jg**      | label     | jump > (ZF=0)         |
| **push**    | src       | add to top of stack   |
| **pop**     | dst       | remove top from stack |
| **call**    | fn        | push %rip, jmp to fn  |
| **ret**     |           | pop %rip              |

### mov
_Arguments: src, dst_

Explain mov here

### add
_Arguments: src, dst_

Explain add here

### sub
_Arguments: src, dst_

Explain sub here

### cmp
_Arguments: a, b_

Explain cmp here

### jmp
_Arguments: label_

Explain jmp here

### je
_Arguments: label_

Explain je here

### jne
_Arguments: label_

Explain jne here

### jg
_Arguments: label_

Explain jg here

### push
_Arguments: src_

Explain push here

### pop
_Arguments: dst_

Explain pop here

### call
_Arguments: fn_

Explain call here

### ret

Explain ret here

## Flags

TODO: Fill this out

## Registers

From [Stanford CS107](https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html), the table below lists the commonly used registers. Each register is 64 bits.

Some registers are designated for a certain purpose, such as `%rsp` being used as the stack pointer or `%rax` for the return value from a function.

Other registers are all-purpose, but have a conventional use depending on whether **caller-owned** or **callee-owned**.

For example, if the function `function1` calls `function2`, we refer to `function1` as the **caller** and `function2` as the **callee**. The registers used for the first 6 arguments and return value are all **callee-owned**.

That means that the **callee** can freely use those registers, overwriting existing values without taking any precautions. If `%rax` holds a value the **caller** wants to retain, the caller must copy the value to a "safe" location before making a call. The **callee-owned** registers are ideal for _scratch/temporary_ use by the **callee**.

In contrast, if the **callee** intends to use a **caller-owned** register, it must first _preserve its value_ and _restore it_ before exiting the call. The **caller-owned** registers are used for _local state_ of the **caller** that needs to preserved across further function calls.

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

## Resources
_Here are some resources I ended up using while writing the programs in this section._

- https://rderik.com/blog/let-s-write-some-assembly-code-in-macos-for-intel-x86-64/
- https://github.com/0xAX/asm
- https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html
- https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture
- The "Getting Started Writing Assembly Language" series
  - https://blog.devgenius.io/getting-started-writing-assembly-language-8ecc116f3627
  - https://blog.devgenius.io/finding-an-efficient-development-cycle-for-writing-assembly-language-be2092e6db6a
  - https://blog.devgenius.io/writing-an-x86-64-assembly-language-program-648b6005e8e (ESPECIALLY this one, since it had a lot of the command line arg info, although some of it works differently on mac)
- https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
- http://dustin.schultz.io/mac-os-x-64-bit-assembly-system-calls.html
- https://0xax.github.io/asm_1/
- https://github.com/0xAX/asm
- https://cs61.seas.harvard.edu/site/2018/Asm1/
- https://www.dreamincode.net/forums/topic/285550-nasm-linux-getting-command-line-parameters/
- https://stackoverflow.com/questions/53555298/how-to-get-arguments-from-the-command-lineassembly-nasm-ubuntu-32bit
- https://cs.lmu.edu/~ray/notes/nasmtutorial/
- https://www.figma.com/file/Uhd6Qe3lzmJ60bBQmkx7Ch/cpu
- https://gist.github.com/FiloSottile/7125822
- https://death-of-rats.github.io/posts/yasm-hello-world/
- https://dev.to/tomassirio/hello-world-in-asm-x8664-jg7
- https://jameshfisher.com/2018/03/10/linux-assembly-hello-world/
- https://stackoverflow.com/questions/52830484/nasm-cant-link-object-file-with-ld-on-macos-mojave
- https://medium.com/reverse-engineering-for-dummies/a-crash-course-in-assembly-language-695b07995b4d
