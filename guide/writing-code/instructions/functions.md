# Let's Get Functional

So now in assembly we can do a lot! We can save "variables", we can do math, we can jump around the code. But we don't have anything that resembles our dear friend, the [function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions). We can jump to a particular section of the code with `jmp` and other instructions like it, but when we're finished executing that area of code, we can't get back to where we were when we called that code!

```js
// JavaScript
let result = addNumbers();
doSomethingElse(result);

function addNumbers() {
  return 3 + 1;
}

function doSomethingElse(arg) {
  return arg + 1;
}
```

In Javascript, we could do something like we have here. We call a function, and then once it's finished, it automatically knows to go back to where that function was called, and continue executing the program.

In assembly, we don't have actual functions, but we can simulate them pretty well - enter the `call` and `ret` instructions.

```asm
; X86-64 Intel Syntax Assembly
call .addNumbers
call .doSomethingElse

.addNumbers
  mov rax, 3
  add rax, 1
  ret

.doSomethingElse
  add rax, 1
  ret
```

We can think of our labels as our function names. We don't have the ability to pass in arguments to our labels the same way that we can in functions, but we do have registers we can use! So here, we're using `rax` to hold our "return" value from each "function".

Our first instruction is the `call` instruction. We're calling the `.addNumbers` label, which jumps us down to the first instruction inside of the `.addNumbers` label, `move rax, 3`.

Remember our **instruction pointer**? As a reminder, it's a register that the CPU uses to keep track of which instruction it's fetching data for. The instruction pointer contains the memory address of the instruction currently being executed.

When we use the `call` instruction, it's similar to a jump (`jmp`) instruction, but it's actually executing multiple instructions underneath:

1. It executes an instruction called a `push` with what would be the next instruction onto something called the **stack**

1. It then updates the instruction pointer to point at the memory address of the first instruction inside of the `.addNumbers` label

Let's hand-wave the `push`ing onto the stack for now, as we'll talk about that in the next section. What you need to know right now is that it is saving where we currently are in memory for later.

At the end of our "function", we call `ret`, short for return. If you haven't guessed already, this returns us back to the next instruction after our original `call`!

It does this by `pop`ing our previous memory address off of the stack and into the instruction pointer.

Now, what the heck is this pushing and popping on the stack?

<br />

---

<a href="/guide/writing-code/instructions/loops.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/stack.md">
         How it all stacks up →
      </a>
    </b>
  </em>
</p>
