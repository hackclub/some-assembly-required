# Jumping For Joy

Assembly code executes sequentially, meaning that after executing an instruction, the computer moves to the next instruction to execute. The computer is able to keep track of which line of code it's executing with something called **the instruction pointer**.

## The Instruction Pointer

The CPU has many specialized registers, which we don't access directly. One of them is the **instruction pointer** (referenced as `rip`), also known as the **program counter**.

When an assembly program is ran, each instruction is stored into memory next to each other.

The instruction pointer register stores the **memory address** of the current line of the program it's executing, and updates itself automatically.

For example, let's say we're running an assembly program that has an instruction for adding two numbers together. Once that instruction finishes running, the instruction pointer increments to point at the next instruction of the program.

For x86-64 machines that are 64-bit, that would mean that each time an instruction finishes, the instruction pointer adds 8. This is because, as you may remember, 64 bits is 8 bytes (64 bits / 8 bits per byte = 8 bytes). Each memory address represents a byte of data. Each instruction is stored as 8 bytes.

So let's say our first instruction is at memory address `0x00000001`. If we incremented to `0x00000002`, that would be **1 byte** of data, or **8 bits**. If we want to increment by an instruction's amount of data (**8 bytes**), we'd increment to `0x00000009`, since that's 8 bytes after `0x00000001`.

_Insert drawn diagram of a program, its memory address next to it, and showing the instruction pointer_

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

_Insert drawn diagram of a jmp, its memory address next to it, and showing the instruction pointer_

## Conditionals

Let's say you're writing some code, and you want some code to execute _only_ if something else is true.

```js
// JavaScript
if (a == 0) {
  // do some code
}
```

In JavaScript and other high level languages, we'd traditionally use an `if` statement to conditionally execute some code. In assembly, we'd use conditional jumps.

### Flags

In order to talk about conditional jumps, we have to talk about flags. Flags are stored in another special register (`eflags`) that we don't access directly, but gets automatically set for us. Flags get set for many reasons, one of them being when instructions perform arithmetic and logical operations.

There are 5 flags on an x86-64 processor, but let's talk about the zero flag, or `ZF`.

After an operation, if the result **is** `0`, the `ZF` flag gets set to `1`. If the result **is not** `0`, the flag gets set to `0`.

This might seem counter-intuitive, but we have to remember that when talking about the binary digits of `1` and `0`:
- `1` stands for **true**
- `0` stands for **false**

So if we're checking if the result of our operation is `0`, and that ends up being the case, that means that the `ZF` register being set to `1` is saying that it's **true** that our result is `0`.

For example, lets take the following instruction:

```asm
; X86-64 Intel Syntax Assembly
mov rax, 3;
add rax, 1;
```
_In assembly, we're adding `1` to the contents of the register `rax`. At the end of this, `rax` will contain the value `4`._

<details>
<summary><i>In this example, what do you think the value of the <code>ZF</code> flag will be?</i></summary>

<br />
<i>Since the result of the proceeding arithmetic operation was <code>4</code>, <code>ZF</code> is <code>0</code>.</i>
</details>
<br />

And in the other case:

```asm
; X86-64 Intel Syntax Assembly
mov rax, 1;
sub rax, 1;
```
_In assembly, we're subtracting `1` to the contents of the register `rax`. At the end of this, `rax` will contain the value `0`._

<details>
<summary><i>In this example, what do you think the value of the <code>ZF</code> flag will be?</i></summary>

<br />
<i>Since the result of the proceeding arithmetic operation was <code>0</code>, <code>ZF</code> is <code>1</code>.</i>
</details>
<br />

---

<br />

---

<a href="/guide/writing-code/registers.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/math.md">
        What else can we do? →
      </a>
    </b>
  </em>
</p>
