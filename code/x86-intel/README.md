# x86-64 Intel Syntax

### Code Examples

- [Hello World](/code/x86-intel/hello-world/hello-world.asm)
- [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm)

---

There are many different assembly languages, depending on the processor you want to talk to. These code examples specifically are written in x86-64 Intel syntax.

**X86** is one of the most useful assembly languages, but is also one of the more complicated ones to write. Most modern desktop computers and game consoles use it. It's used for Intel processors, which have to process a lot of data!

The **86** is pulled from the model names of the Intel chips that use this assembly language, which all end in 86 (like the 8086 chip).

The **64** part is referring to the number of [bits](/guide/writing-code/data.md) that the processor registers hold. The original x86 processors were 32 bit, so we specify "-64" to know we're talking about the 64 bit version. You'll see some examples online that use the 32 bit version, and the registers they refer to are different. Usually 32 bit registers start with the letter `E`, whereas 64 bit registers usually start with the letter `R`.

## Pre-requisites

By default, macOS doesn't ship with developer tools, since most computer users aren't writing code. In order to compile these examples, you'll need to [download Xcode](https://developer.apple.com/xcode/) and their [command line tools](https://developer.apple.com/library/archive/technotes/tn2339/_index.html).

If you have [homebrew](https://brew.sh/) installed, you can also download the [nasm package](https://formulae.brew.sh/formula/nasm).

## Running programs

We will use the [Hello World](/code/x86-intel/hello-world/hello-world.asm) program as our example for this, but you will see the same steps for the [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm) program.

For a Mac (both Intel and Apple Silicon), these are the instructions to compile and run the code. We have 3 steps to run our program:
1. Assemble it into an object file
1. Generate our executable
1. Run our executable

### 1. Assemble our program into an object file
```
$ nasm -f macho64 hello-world.asm
```

This whole command creates an object file, which is machine code. You can view it in a [hex editor](https://hexfiend.com/). If you view it in a normal text editor, it tries to convert the machine code to ASCII, which makes it nonsensical.

`nasm` is our assembler, `-f` flag is to specify our file format. `macho64` is our file format, used for Mac executables.


### 2. Generate our executable
```
$ ld hello-world.o -o hello-world -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie
```

This generates our executable by linking our object file to any libraries it needs. It bundles everything together into machine code, `-o` lets us specify what we want our executable to be called.

### 3. Run our executable
```
$ ./hello-world
```

> Note: For the [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm) program, you'll have to pass command line arguments (eg. `words to uppercase`) so your command might look like `./uppercaser words to uppercase`

### All together now!
```
$ nasm -f macho64 hello-world.asm && ld hello-world.o -o hello-world -macosx_version_min 12.4 -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem -no_pie && ./hello-world
```

## Anatomy of a program

We will use the [Hello World](/code/x86-intel/hello-world/hello-world.asm) program as our example for this, but you will see a similar setup in the [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm) program as well.

First thing you'll see is a [section for read-only constants](https://github.com/hackclub/some-assembly-required/blob/3e47d24b7b2492faea8dc2c0efcfcddc7d87a342/code/x86-intel/hello-world/hello-world.asm#L33-L43).

This is used in our Hello World program for setting up our string data, but if you look in the [Uppercaser](https://github.com/hackclub/some-assembly-required/blob/0b1c6f2d1e96c08960bbea816b7ff039c38238a6/code/x86-intel/uppercaser/uppercaser.asm#L12) program, that section is empty because we don't need to set up any constants for it.

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

We start our program in _main, where we [write "Hello World" out to the terminal](https://github.com/hackclub/some-assembly-required/blob/70ea2d8d882a58eebfb02a6ec516599f78e745c4/code/x86-intel/hello-world/hello-world.asm#L50-L55).

```asm
_main:
    mov     rax, 0x2000004 ; system call for write. anything with 0x2 is mac specific
    mov     rdi, 1 ; Set output to stdout. 1 = stdout, which is normally connected to the terminal.
    mov     rsi, msg ; address of string to output
    mov     rdx, msg.len ; rdx holds address of next byte to write. msg.len is the number of bytes to write
    syscall ; invoke operating system to do the write
```

We then [exit our program](https://github.com/hackclub/some-assembly-required/blob/70ea2d8d882a58eebfb02a6ec516599f78e745c4/code/x86-intel/hello-world/hello-world.asm#L57-L59).
```asm
  mov     rax, 0x2000001 ; system call for exit. anything with 0x2 is mac specific
  mov     rdi, 0 ; exit code 0
  syscall ; invoke operating system to exit
```

## Common Instructions

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

#### The "Getting Started Writing Assembly Language" series
  - https://blog.devgenius.io/getting-started-writing-assembly-language-8ecc116f3627
  - https://blog.devgenius.io/finding-an-efficient-development-cycle-for-writing-assembly-language-be2092e6db6a
  - https://blog.devgenius.io/writing-an-x86-64-assembly-language-program-648b6005e8e (ESPECIALLY this one, since it had a lot of the command line arg info, although some of it works differently on mac)

#### Guides
  - https://cs61.seas.harvard.edu/site/2018/Asm1/
  - https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture
  - https://github.com/0xAX/asm
  - https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html

#### Hello World
  - https://gist.github.com/FiloSottile/7125822
  - https://death-of-rats.github.io/posts/yasm-hello-world/
  - https://dev.to/tomassirio/hello-world-in-asm-x8664-jg7
  - https://jameshfisher.com/2018/03/10/linux-assembly-hello-world/
  - https://cs.lmu.edu/~ray/notes/nasmtutorial/
  - https://0xax.github.io/asm_1/
  - https://rderik.com/blog/let-s-write-some-assembly-code-in-macos-for-intel-x86-64/

#### Command line params
  - https://www.dreamincode.net/forums/topic/285550-nasm-linux-getting-command-line-parameters/
  - https://stackoverflow.com/questions/53555298/how-to-get-arguments-from-the-command-lineassembly-nasm-ubuntu-32bit

#### Syscalls
  - https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/
  - http://dustin.schultz.io/mac-os-x-64-bit-assembly-system-calls.html

#### Debugging
  - https://stackoverflow.com/questions/52830484/nasm-cant-link-object-file-with-ld-on-macos-mojave
