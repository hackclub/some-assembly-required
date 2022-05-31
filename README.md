# Some Assembly Required

### A playful guide about talking to your computer.

<p align="center">
  <img width="460" height="300" src="https://cdn.vox-cdn.com/uploads/chorus_asset/file/8688491/hiE5vMs.gif">
</p>

<p align="center">
  <em>Currently under construction. Read at your own risk!!</em>
</p>

<p align="center">
  <br />
  <img width="460" height="300" src="https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/reading-dictionary-2144-589c2a14cd49b0f704f41cfd9ee51ba4@1x.jpg">
  <br />
  <span>placeholder until we get a real cover!</span>
</p>

Since forever ago, I’ve wanted to try writing assembly, even if just to understand why the [Rollercoaster Tycoon creator would write 99% of the game](https://en.wikipedia.org/wiki/RollerCoaster_Tycoon_(video_game)#:~:text=Sawyer%20wrote%2099%25%20of%20the,%2C%20rendering%2C%20and%20paint%20programs.) in it.

Embarking on this quest, I quickly found a lot of scattered and difficult to understand resources. It took compiling a bunch of different materials together to come to a high level understanding of what’s happening in my computer.

I wanted to write down my learnings and make an approachable guide for people who are new to this part of their system (like me!), including working code examples. Enjoy!

[_Turn the page to the introduction ->_](/INTRO.md)

## Table of Contents

1. [The CPU](#the-cpu)
   - [The Instruction Cycle](#the-instruction-cycle)
     - [Fetch](#fetch)
     - [Decode](#decode)
     - [Execute](#execute)
     - [Modern Day](#modern-day)
1. [Communicating With The CPU](#communicating-with-the-cpu)
2. [Writing Code](#writing-code)
3. [The Math Section](#the-math-section)
   - [Binary](#binary)
   - [Boolean Logic](#boolean-logic)
   - [Hexadecimal](#hexadecimal)
4. [Resources](#resources)
5. [Contributors](#contributors)

## Code

1. RISC-V
   - [Examples of basic RISC-V instructions being used](/riscv/riscv.s)
1. X86-64 Intel Syntax
   - [Hello World](/x86-intel/hello-world/hello-world.asm)
   - [Uppercaser](/x86-intel/uppercaser/uppercaser.asm)
1. C (For comparison purposes)
   - [Hello World](/c/hello-world/hello-world.c)
   - [Uppercaser](/c/uppercaser/uppercaser.c)

## Contributors

- [@jessicard](https://github.com/jessicard)
- [@bellesea](https://github.com/bellesea)
- [@TheOneKevin](https://github.com/theonekevin)
- [@exu3](https://github.com/exu3)
- [@jakeboxer](https://github.com/jakeboxer)
