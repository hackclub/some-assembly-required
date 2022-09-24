# Conditionals

Let's say you're writing some code, and you want something to happen _only_ if something else is true.

```js
// JavaScript
if (a < b) {
  // do some code
}
```

In JavaScript and other high level languages, we'd traditionally use an `if` statement to conditionally execute some code. In assembly, we'd use conditional jumps.

```asm
; X86-64 Intel Syntax Assembly
mov rax, 3
mov rbx, 1

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; We only get to this line if the jump is not executed

.jumpToHere
  ; do some code
```

In this code example, we are ultimately checking if the contents of `rax` are less than the contents of `rbx`, and jumping if so. Here's how it's working.

The `cmp` instruction compares two values, and records which one is greater (or if they're equal) in a special register called the `eflags` register. We'll get into the details of `eflags` soon, but for now, just remember that after running the `cmp` instruction, the result of the comparison is saved into `eflags`.

In our example, we are comparing the value of `rax` with the value of `rbx`, and that gets saved into `eflags`.

For our conditional jump, we are using `jl`, which stands for "Jump if Less Than". The `jl` instruction checks the `eflags` register. If `eflags` says that the first argument to `cmp` was less than the second (`rax < rbx`), it jumps to the specified label. If `rax >= rbx`, this instruction does nothing.

Back to our example:

```asm
; X86-64 Intel Syntax Assembly
mov rax, 3
mov rbx, 1

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; We only get to this line if the jump is not executed

.jumpToHere
  ; do some code
```
<details>
<summary><i>In this example, will the jump be executed?</i></summary>

<br />
<i>The jump <strong>will not</strong> be executed, because the value of <code>rax</code> (<code>3</code>) is greater than the value of <code>rbx</code> (<code>1</code>).</i>

</details>

For another example:

```asm
; X86-64 Intel Syntax Assembly
mov rax, 2
mov rbx, 4

cmp rax, rbx
jl .jumpToHere
add rbx, 1 ; We only get to this line if the jump is not executed

.jumpToHere
  ; do some code
```
<details>
<summary><i>In this example, will the jump be executed?</i></summary>

<br />
<i>The jump <strong>will</strong> be executed, because the value of <code>rax</code> (<code>2</code>) is less than the value of <code>rbx</code> (<code>4</code>).</i>

</details>

## Flags

When talking about conditional jumps, we should talk about flags. As we briefly mentioned, flags are stored in another special register, `eflags`, that we don't access directly. The flags get automatically set for us for many reasons, like when instructions perform arithmetic and logical operations, or when we use the `cmp` instruction.

There are 5 flags on an x86-64 processor, but let's talk about the zero flag, or `ZF`.

After an operation, if the result **is** `0`, the `ZF` flag gets set to `1`. If the result **is not** `0`, the flag gets set to `0`.

This might seem counter-intuitive, but when talking about the binary digits of `1` and `0`:
- `1` also stands for **true**
- `0` also stands for **false**

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

Another case:

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

<a href="/guide/writing-code/instructions/jumps.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/loops.md">
        Loop de loop →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cloud-l0g1cgz4b-hack-club-bot.vercel.app/0h.png"><br/>
    Made with love by Hack Club
  </a>
</p>
