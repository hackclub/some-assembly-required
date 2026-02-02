# Jumping For Joy

Assembly code executes sequentially, meaning that after executing an instruction, the computer moves to the next instruction to execute. The computer is able to keep track of which line of code it's executing with something called **the instruction pointer**.

## The Instruction Pointer

The CPU has many specialized registers, which we don't access directly. One of them is the **instruction pointer** (referenced as `rip`), also known as the **program counter**.

When an assembly program is ran, each instruction is stored into memory next to each other.

The instruction pointer register stores the **memory address** of the current line of the program it's executing, and updates itself automatically.

For example, let's say we're running an assembly program that has an instruction for adding two numbers together. Once that instruction finishes running, the instruction pointer increments to point at the next instruction of the program.

Like everything in assembly, the actual process of incrementing the instruction pointer is a little complicated and depends on the processor, so we're going to fictionalize a high level example of how this works.

Let's say for a  64-bit machine, each instruction ends up being 8 bytes (64 bits / 8 bits per byte = 8 bytes), and each memory address represents a byte of data. That would mean that each time an instruction finishes, the instruction pointer adds 8 to itself.

So let's say our first instruction is at memory address `0x00000001`. If we incremented to `0x00000002`, that would be **1 byte** of data, or **8 bits**. If we want to increment by an instruction's amount of data (**8 bytes**), we'd increment to `0x00000009`, since that's 8 bytes after `0x00000001`.

<p align="center">
  <br />
  <img height="375" src="https://cdn.hackclub.com/019c1ebf-cfa3-72cf-a3b0-399a99c91881/image.png">
</p>
<br />

---

Remember how I said we don't access the instruction pointer directly? That stands true, however we can change where the instruction pointer is pointing with a jump instruction. Jumps are a way to move to another area of your assembly code.

```asm
; X86-64 Intel Syntax Assembly
mov rcx, 10
jmp .addNumbers
sub rcx, 11 ; This line will be skipped since we are jumping to .addNumbers

.addNumbers
  mov rax, 3
  mov rbx, 1
  add rax, rbx
```

<br />

`.addNumbers` is a **label**. When assembled to machine code, labels assemble to memory addresses that point to the first instruction after the label.

In our example, when the program sees the `jmp` instruction, the instruction pointer would update so that it points to the line after `.addNumbers`, which is `mov rax, 3`.

As a note, memory addresses are in <a href="/guide/math/number-systems.md">hexadecimal</a> format, so the memory address `0x00000011` you see on the third instruction below actually maps to `17` in decimal, which is how we usually talk about numbers. For now, it's totally OK to hand wave this - we'll explain hexadecimal a little bit later.

<p align="center">
  <br />
  <img height="275" src="https://cdn.hackclub.com/019c1ec0-c2fe-73b8-96b5-60cd69001d3e/image.png">
  <br />
  <br />
  <span>
    <em>After jumping, your instruction pointer register will contain the memory address of the first instruction below the label</em>
  </span>
</p>

<br />

---

<a href="/guide/writing-code/instructions/math.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/conditionals.md">
        Conditionals →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cdn.hackclub.com/019c1b71-2582-7e9c-9125-3792c8a88142/image.png"><br/>
    Made with love by Hack Club
  </a>
</p>
