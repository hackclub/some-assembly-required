# Let's Write Some Code

It's the moment you've been waiting for, folks. We're going to write some code.

```js
// JavaScript
let x = 5;
```

#### Wait. Is that JavaScript? I thought this was about assembly.

Why yes, it is! We're just going to be giving examples of higher-level equivalents to help explain assembly language. Ok, back to our example.

As we talked about earlier, in higher level programming, you'd use a variable to store data for later use. You can think of registers as the variables of assembly language.

```js
// JavaScript
let myVar = 5;
```

- In JavaScript, we're setting the value of a variable, `myVar`, to the number `5`.

```asm
; X86-64 Assembly
mov rax, 5;
```

- In assembly, we're setting the value of a register, `rax`, to the number `5`.

We're using a **mov** instruction here (short for "Move"). This moves the value on the right side (`5`) _into_ the register on the left side (`rax`).

<<INSERT ILLUSTRATION OF THIS HERE>>

---

Now, variables and registers are quite similar in this regard, but there are some key differences to remember. You can create an unlimited amount of variables and name them whatever you'd like. Registers, on the other hand, are limited to a set determined by the processor. You also can't name them, they're like already set up variables that you can change the contents of.

```js
// JavaScript
let myVar = 3;
let anotherVar = myVar;
```

- In JavaScript, we're setting the value of variable `myVar` to 3.

- Then we're setting the value of variable `anotherVar` to the contents of `myVar`.

- At the end of this, both `myVar` and `anotherVar` will contain the value `3`.

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, rax;
```

- In assembly, we're setting the value of a register, `rax` to 3.

- Then we're setting the value of register `rbx`, to the contents of the register `rax`.

- At the end of this, both `rax` and `rbx` will contain the value `3`.

---

One last `mov` example for you, just to drive the point home.

```js
// JavaScript
let myVar = 3;
let anotherVar = myVar;

let newVar = 5;
let anotherVar = newVar;
```

- In JavaScript, we're setting the value of variable `myVar` to 3.

- Then we're setting the value of variable `anotherVar` to the contents of `myVar`.

- Then, we set the value of `newVar` to 5, and set the value of `anotherVar` to the contents of `newVar`.

- At the end of this, both `newVar` and `anotherVar` will contain the value `5`, and `myVar` will still be `3`.

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, rax;

mov rcx, 5;
mov rbx, rcx;
```

- In assembly, we're setting the value of a register, `rax` to 3.

- Then we're setting the value of register `rbx`, to the contents of the register `rax`.

- Then, we assign `rcx` to 5, and set the value of `rbx` to the contents of `rcx`.

- At the end of this, both `rbx` and `rcx` will contain the value `5`, and `rax` will still be `3`.


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
      <a href="/guide/math/number-systems.md">
        This next section definitely has absolutely nothing to do with math I promise →
      </a>
    </b>
  </em>
</p>
