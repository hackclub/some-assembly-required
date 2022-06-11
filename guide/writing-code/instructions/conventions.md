# How Conventional

When I was learning this, I was like wow - we have a lot of places we can save things! We have a bunch of general-purpose registers we can use, and we have access to the stack. How do I know what to choose and when?

Every assembly language has its own set of **conventions** that dictate where a program expects things to be.

Let's take this JavaScript code, for example, where we're doing our handy dandy slope-intercept equation that we used earlier.

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

General purpose registers have a convention where they're marked as **caller-owned** or **callee-owned**. This refers to whether or not the caller is expected to overwrite the values in a given register.

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  call .buzz ; callee
```

Let's take this code for example, where the function `fizz` calls function `buzz`. In this case, we refer to `fizz` as the **caller** and `buzz` as the **callee**. With this in mind:

- If a **caller** wants to use a **caller-owned register**, it's able to do so freely!

- If a **caller** wants to use a **callee-owned register**, they are responsible for saving its value by pushing it onto the stack before calling the callee. Otherwise, this register can be overridden by the callee, which will cause the caller to lose the value.

Let's take the **callee-owned** register `rax` for example, which is traditionally used for return values:

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  mov rax, 1 ; We're using rax to save a value in .fizz
  push rax ; Save rax value since it's callee-owned and .buzz can overwrite it
  call .buzz
  mov rbx, rax ; Save .buzz return value into new register
  pop rax ; Retrieve our rax value that we pushed on the stack previously
  ret

.buzz ; callee
  mov rax, 2 ; Use our callee-owned rax register to return a value
  ret
```

In contrast,

- If a **callee** wants to use a **caller-owned register**, they must first save its value by pushing it onto the stack. Then, before the callee returns, they must restore the register to its original value by popping it off the stack and back into the register.

- If a **callee** wants to use a **callee-owned register**, it's able to do so freely!

Let's take the **caller-owned** register `rbx`, for example:

```asm
; X86-64 Intel Syntax Assembly
.fizz ; caller
  mov rbx, 1 ; Use a caller-owned register to store a value
  call .buzz
  add rbx, 3 ; We can expect our previous rbx value to be there and do whatever we want with it
  ret

.buzz ; callee
  push rbx ; Save caller-owned register value so we don't overwrite it
  mov rbx, 2 ; Do whatever code we want to do with rbx, this example is contrived
  pop rbx ; Return caller-owned register value for caller to use
  ret
```

---

<br />

If this is overwhelming, that's totally OK! I am still overwhelmed by it. That being said, you don't have to memorize or even know any of these conventions to write assembly. These are just good things to keep in mind if you're writing larger assembly programs, or you're collaborating with other people on writing assembly. When I was learning, I just used whatever registers I wanted, which is totally valid for you to do as well!

It's important to note that **none of these conventions are actually enforced anywhere**. Nothing is stopping your assembly code from modifying any of the general purpose registers, and sometimes breaking these conventions can allow you to write faster programs that can do the same work in fewer instructions. It's one of the things that can make assembly even faster than C!

The C compiler follows these conventions _all_ the time, even when it could safely skip them to make things faster. You're a human being, which means you're much smarter than any compiler, so you can identify places where it's safe to break these conventions in order to save unnecessary instructions, and end up writing code that's faster than anything a compiler could write. Isn't that cool?

However, if you break these conventions too often, you'll end up overwriting values by mistake and causing bugs that are hard to track down. If you follow these conventions the majority of the time, your assembly code will have fewer bugs and will be much easier to follow.

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
