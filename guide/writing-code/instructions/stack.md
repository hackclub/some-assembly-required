# How It All Stacks Up

Computers allocate a chunk of memory to be the “stack”, a place where you can store bytes for later use. You can do 2 things with a stack:

1. **push** a value onto it, which goes on top of the previous values
1. **pop** a value off of it, which removes it from the top of the stack and puts it in a register

Need something at the bottom? Too bad! You gotta go through the top.

<p align="center">
  <br />
  <img height="375" src="https://cloud-ded5b376v-hack-club-bot.vercel.app/0stack.png">
  <br />
  <span>
    <em>
      Last in, first out!
    </em>
  </span>
</p>
<br />

In code, this looks like:

```asm
; X86-64 Intel Syntax Assembly
push rax
push rbx ; rbx is above rax
push rcx ; rcx is above rbx and rax
push rdx ; rdx is above rcx, rbx, and rax

; Pop them off in reverse
pop rdx ; rdx is at the top of the stack, pop it off first
pop rcx
pop rbx
pop rax
```

<br />

So now that we know what the stack is, let's talk about how it's working underneath. We have a special area of the memory sectioned off just for the values in the stack. The stack is accessed through a special register called the **stack pointer** (`%rsp`), which keeps track of the memory address that points to the top of the stack. So every time we `push` onto the stack, it automatically increments the pointer. Every time we `pop` off of the stack, it automatically decrements it.

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you'd be correct! However, we have a limited number of registers. Let's say we are doing some complicated math, and we need to store a few values away for a while while we work through a problem that uses different values. We can just `push` those values to save on the stack, and then when we're done with that math, we can `pop` them off and continue like nothing ever happened. Like this:

<br />

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

<br />

Why do we use the stack instead of just throwing values into random spots in memory? Well, the operating system keeps track of what programs are using what memory, so if we wanted to pick a random spot in memory to throw a value into, we'd need to first ask the operating system for an unused block of memory to use. This would take a bunch of extra instructions, as our program communicates with the OS (and waits for the OS to run its own instructions before answering).

Using the stack is much faster, because the memory in the stack was already sectioned off at the beginning of the program. Because of that, we know it's always safe to throw values into, so we can use it without all the extra OS work.

<br />

---

> #### Sidenote:
>
> Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It's named after this stack right here! You don't need to know this for the purposes of this guide, but while we're here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

---

<br />

<a href="/guide/writing-code/instructions/functions.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg">
    <img align="left" width="70" src="https://cloud-c4m75tmer-hack-club-bot.vercel.app/0back.svg" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/conventions.md">
        How conventional →
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
