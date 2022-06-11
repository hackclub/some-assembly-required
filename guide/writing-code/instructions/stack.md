# How It All Stacks Up

Computers allocate a chunk of memory to be the “stack”, a place where you can store bytes for later use. You can do 2 things with a stack:

1. **push** a value onto it, which goes on top of the previous values
1. **pop** a value off of it, which removes it from the top of the stack and puts it in a register

Need something at the bottom? Too bad! You gotta go through the top.

<p align="center">
  <br />
  <img height="200" src="https://holycoders.com/content/images/wordpress/2020/04/Stack-data-structure.png">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you'd be correct! However, we have a limited number of registers. Let's say we are doing some complicated math, and we need to store a few values away for a while while we work through a problem that uses different values. We can just `push` those values to save on the stack, and then when we're done with that math, we can `pop` them off and continue like nothing ever happened. Very convenient!

So now that we know what the stack is, let's talk about how it's working underneath. We have a special area of the memory sectioned off just for the values in the stack. The stack is accessed through a special register called the **stack pointer** (`%rsp`), which keeps track of the memory address that points to the top of the stack. So every time we `push` onto the stack, it automatically increments the pointer. Every time we `pop` off of the stack, it automatically decrements it.

```asm
; X86-64 Intel Syntax Assembly
mov rax, 1
mov rbx, 2
mov rcx, 3
mov rdx, 4

; we want to calculate the sum of rax and rbx, but we don't want to lose the
; value that used to be stored in rax, so we push it onto the stack first.
push rax
add rax, rbx

; similarly, we want to calculate the sum of rcx and rdx without losing the
; value that used to be stored in rcx.
push rcx
add rcx, rdx

; at this point, the values in our registers look like:
;
; rax: 3 (1+2)
; rbx: 2
; rcx: 7 (3+4)
; rdx: 4
;
; and our stack looks like:
;
; 3 <--- the top of the stack
; 1

; ~~~
; imagine we do some cool stuff with the newly-calculated values in rax and rcx here.
; ~~~

; now that we're done working with these sums, let's restore rax and rcx to their old
; values, maybe so we can use them again for future calculations.
pop rcx ; we have to pop rcx first, since we pushed it last. Remember, the last item added to a stack is the first item that gets removed!
pop rax
```

## Conventions

When I was learning this, I was like wow - we have a lot of places we can save things! We have a bunch of general-purpose registers we can use, and we have access to the stack. How do I know what to choose and when?

Every assembly language has its own set of conventions that dictate where a program expects things to be. Let's take this JavaScript code, for example, where we're doing our handy dandy slope-intercept equation like before.

```js
// JavaScript
const y = getSlopeIntercept(3, 5, 2);

function getSlopeIntercept(m, x, b) {
    return ( m * x ) + b;
}
```

This code has a few things going on! We have three arguments, and we have a return value.

So far, we've been throwing everything into random general purpose registers (usually `rax` - `rdx`). Let's talk about some basic [conventions in x86-64](https://en.wikipedia.org/wiki/X86_calling_conventions#List_of_x86_calling_conventions).

Arguments get `push`ed on the stack before we `call` our label, which is effectively a "function".

When we're in our "function", we `pop` those arguments off the stack and into general purpose registers. We're using `r8` - `r10` because these general purpose registers have a convention of being "callee-owned". Don't worry about this for now, we will explain it after.

When we finish doing our math and we're ready to "return" a value from our "function", the convention is to place that value into register `rax`.

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

  mul r10, r9
  add r10, r8

  ; return values go into rax
  mov rax, r10

  ret
```

---

<br />

> #### Sidenote:
>
> Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It's named after this stack right here! You don't need to know this for the purposes of this guide, but while we're here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

<br />

---

<a href="/guide/writing-code/instructions/functions.md">
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
