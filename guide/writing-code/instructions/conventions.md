# How Conventional

When I was learning this, I was like wow - we have a lot of places we can save things! We have a bunch of general-purpose registers we can use, and we have access to the stack. How do I know what to choose and when?

Every assembly language has its own set of **conventions** that dictate where a program expects things to be.

Let's take this JavaScript code, for example, where we're doing our handy dandy slope-intercept equation like before.

<p align="center">
  <br />
  <img height="200" src="https://cloud-jnidfb52p-hack-club-bot.vercel.app/0graph.png">
  <br />
</p>
<p align="center">
  <span>
    $y = mx + b$
  </span>
</p>
<br />

```js
// JavaScript
const y = getSlopeIntercept(3, 5, 2);

function getSlopeIntercept(m, x, b) {
    return ( m * x ) + b;
}
```

This code has a few things going on! We have three **arguments**, and we have a **return value**.

So far, we've been throwing everything into random general purpose registers (usually `rax` - `rdx`). Let's talk about some basic [conventions in x86-64](https://en.wikipedia.org/wiki/X86_calling_conventions#List_of_x86_calling_conventions):

1. Arguments get pushed on the stack to "pass" into the "function"
1. Arguments get popped off the stack and into registers to access inside of our "function"
1. "Return" values get saved in `rax`
1. General purpose registers can be "callee-owned" or "caller-owned" (more on this later)

<br />

```asm
; X86-64 Intel Syntax Assembly
push 3 ; m
push 5 ; x
push 2 ; b

; The stack is now (top) b, x, m (bottom)

call .getSlopeIntercept ; after this call, rax will contain our return value (17)

.getSlopeIntercept:
  ; arguments are popped in reverse order they were pushed on
  pop r8 ; b
  pop r9 ; x
  pop r10 ; m
  ; registers r8-r10 are "callee-owned"

  mul r10, r9
  add r10, r8

  ; return values go into rax
  mov rax, r10

  ret
```

## Caller-owned vs Callee-owned
General purpose registers have a convention where they're marked as **caller-owned** or **callee-owned**.

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  call .buzz ; callee
```

Let's take this code for example. If the function `fizz` calls function `buzz`, we refer to `fizz` as the **caller** and `buzz` as the **callee**.

One register that is **callee-owned** is our return value register, `rax`.

That means that the **callee** (`buzz`) can freely use `rax`, overwriting existing values without taking any precautions.

However, if `rax` holds a value the **caller** (`fizz`) wants to retain, the **caller** (`fizz`) must copy the value into another register before making a `call`.

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  push rax ; Save rax value since it's callee-owned and .buzz can overwrite it
  call .buzz ; callee
  mov rbx, rax ; Save .buzz return value into new register
  pop rax ; Retrieve our rax value that we pushed on the stack previously

.buzz
  mov rax, 1 ; Use our callee-owned rax register to return a value
```

In contrast, if the **callee** (`buzz`) intends to use a **caller-owned** register, it must first preserve its value, and then restore it at the end before exiting the `call`. Let's take the **caller-owned** register `rbx`, for example:

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  mov rbx, 1 ; Use a caller-owned register to store a value
  call .buzz ; callee
  add rbx, 2 ; We can expect our previous rbx value to be there and do whatever we want with it

.buzz
  push rbx ; Save caller-owned register value so we don't overwrite it
  mov rbx, 1 ; Do whatever code we want to do with rbx, this example is contrived
  pop rbx ; Return caller-owned register value for caller to use
```

---

<br />

If this is overwhelming, that's totally OK! I am still overwhelmed by it. That being said, you don't have to memorize or even know any of these conventions to write assembly. These are just good things to keep in mind if you're writing larger assembly programs, or you're collaborating with other people on writing assembly. When I was learning, I just used whatever registers I wanted, which is totally valid for you to do as well!

<br />

---

<a href="/guide/writing-code/instructions/stack.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/uppercaser.md">
        Let's see this all in a real example →
      </a>
    </b>
  </em>
</p>
