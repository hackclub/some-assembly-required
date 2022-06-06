# Let's Write Some Code

It's the moment you've been waiting for, folks. We're going to write some code.

```js
// JavaScript
let a = 5;
```

#### Wait. Is that JavaScript? I thought this was about assembly.

Why yes, it is! We're just going to be giving examples of higher-level equivalents to help explain assembly language. Ok, back to our example.

As we talked about earlier, in higher level programming, you'd use a variable to store data for later use. You can think of registers as the variables of assembly language.

```js
// JavaScript
let a = 5;
```
_In JavaScript, we're setting the value of a variable, `a`, to the number `5`._

```asm
; X86-64 Assembly
mov rax, 5;
```
_In assembly, we're setting the value of a register, `rax`, to the number `5`._

We're using a **mov** instruction here (short for "Move"). This moves the value on the right side (`5`) _into_ the register on the left side (`rax`).

**INSERT ILLUSTRATION OF THIS HERE**

---

Now, variables and registers are quite similar in this regard, but there are some key differences to remember.

With **variables**, you can create an _unlimited amount_ of them and _name them whatever you'd like_.

**Registers**, on the other hand, are _limited_ to a set determined by the processor. You also _can't name them_, they're like already set up variables that you can change the contents of.

```js
// JavaScript
let a = 3;
let b = a;
```
_At the end of this, `b` will contain the value `3`._

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, rax;
```
_In our previous assembly example, we set the value of the `rax` register to a number. In this example, we set the value one register to the value of another register. At the end of this, `rbx` will contain the value `3`._

---

One last `mov` example for you, just to drive the point home.

```js
// JavaScript
let a = 3;
let b = 5;

a = b;
```
_Even though we set `a` to `3` in the beginning, at the end of this example, `a` is `5` since we set `a` to the contents of `b`._

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, 5;

mov rax, rbx;
```

<details>
<summary><i>At the end of this example, what do you think the value of rax will be?</i></summary>

_Even though we set `rax` to `3` in the beginning, at the end of this example, `rax` is `5` since we set `rax` to the contents of `rbx`._

</details>

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
