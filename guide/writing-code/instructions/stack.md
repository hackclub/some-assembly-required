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

The purpose of the stack is to store things for later. Now you might say, hey wait a minute, we use registers for that! And you'd be correct! However, we have a limited number of registers. Let's say we are doing some complicated math, and we need to store a few values away for a while while we work through a problem that uses different values. We can just push those values to save on the stack, and then when we're done with that math, we can pop them off and continue like nothing ever happened. Very convenient!

So now that we know about the stack, the **stack pointer** (`%rsp`) is a special register the CPU has that keeps track of where the top of the stack is. So every time we push onto the stack, it automatically increments the pointer. Every time we pop off of the stack, it automatically decrements it. This pointer is actually pointing to the address of where this value lives in memory, since we have a special area of the memory sectioned off just for our stack.

Ever heard of a stack overflow? Or perhaps [stackoverflow.com](https://stackoverflow.com/)? It's named after this stack right here! You don't need to know this for the purposes of this guide, but while we're here, an overflow can happen for many reasons. One reason could be caused by accidentally writing an infinite loop, where we have a loop somewhere that never gets exited, and let's say that loop adds things onto the stack. Eventually, our stack runs out of room, and bam! Stack overflow error.

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
