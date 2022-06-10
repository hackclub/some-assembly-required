# Let's Get Functional

So now in assembly we can do a lot! We can save "variables", we can do math, we can jump around the code. But we don't have anything that resembles our dear friend, the [function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions). We can jump to a particular set of the code with `jmp` and things like it, but when we're finished executing that area of code, we can't get back to where we were when we called that code!

```js
// JavaScript

let result = addNumbers();
doSomethingElse(result);

function addNumbers() {
  return (3 + 1);
}

function doSomethingElse(result) {
  return (result + 1);
}
```

In Javascript, we could do something like we have here - call a function, and then once it's finished, go back to where that function finished and do other code.

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
