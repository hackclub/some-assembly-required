# x86-64 AT&T Syntax

### Code Examples

- [Hello World](/code/x86-AT&T/hello-world/hello-world.s)

---

There are many different assembly languages, depending on your processor you want to talk to. These code eamples specifcially are written in x86-64 AT&T syntax.

**X86** Is one of the most useful asembly languages, but is also one of the more complicated ones to write. Most modern desktop computers and game consoles use it. It's used for Intel processors, which have a lot of data!

The **86** is pulled from the model names of the Intel chips that use this assembly language, which all end in 86 (like the 8086 chip).

The **64** part is referring to the number of [bits](/guide/writing-code/data.md) that the processor registers hold. The original x86 processors were 32 bit, so we specify "-64" to know we're talking about the 64 bit version. You'll see some examples online that use the 32 bit version, and the registers they refer to are different. Usually 32 bit registers start with the letter `E`, whereas 64 bit registers usually start with the letter `R`.


## Pre-requisites

By default, most systems dont ship with the tools needed for compiling AT&T Assembly. You need the [`binutils` package](https://www.gnu.org/software/binutils) which installs the GNU Assembler and the linker!

**NOTE:** This does not work with the default `as` command. Both GNU Assembler and the default clangd-based assembler in MacOS have the same command (`as`) but are very different.

### For MacOS:

[Homebrew](https://brew.sh/) can be used to download these packages:
- Intel based Mac: [binutils](https://formulae.brew.sh/formula/binutils).
- Apple Silicon based Mac: [aarch64-elf-binutils](https://formulae.brew.sh/formula/aarch64-elf-binutils)


### For Linux:

Download the `binutils` package from your desired package manager.






