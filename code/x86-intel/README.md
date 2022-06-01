# x86-64 Intel Syntax

### Code Examples

- [Hello World](/code/x86-intel/hello-world/hello-world.asm)
- [Uppercaser](/code/x86-intel/uppercaser/uppercaser.asm)

---

There are many different assembly languages, depending on the processor you want to talk to.

x86 is one of the most useful assembly languages, but is also one of the more complicated ones to write. It's used for Intel processors, which have to process a lot of data!

The `86` is pulled from the model names of the Intel chips that use this assembly language, which all end in `86` (like the `8086` chip).

The `64` is referring to the number of [bits](/) that the processor registers hold. The original x86 processors were 32 bit, so we specify `-64` to know we're talking about the 64 bit version. You'll see some examples online that use the 32 bit version, and the registers they refer to are different. Usually 32 bit registers start with the letter `E`, whereas 64 bit registers usually start with the letter `R`.

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
