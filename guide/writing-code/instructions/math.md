# In Addition

Let's do a little bit of math. I swear it won't be bad!!

First, we'll talk about the `add` instruction.

```js
// JavaScript
let a = 3;
a = a + 1;
```
_In JavaScript, we're adding `1` to the contents of the variable `a`. At the end of this, `a` will contain the value `4`._

```asm
; X86-64 Assembly
mov rax, 3;
add rax, 1;
```
_In assembly, we're adding `1` to the contents of the register `rax`. At the end of this, `rax` will contain the value `4`._

The `add` instruction adds the value on the right side (`1`) to the contents of the register on the left side (`rax`, which contains `3`). It then takes the sum of these two numbers and, like our `mov` instruction, stores the value _into_ the register on the left side (`rax`).

---

Just like our `mov` instruction, the `add` instruction can use the contents of second register to operate on the first register.

```js
// JavaScript
let a = 3;
let b = 1;

a = a + b;
```
_In JavaScript, we're adding the contents of `b` to the contents of `a`. At the end of this, `a` will contain the value `4`._

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, 1;

add rax, rbx;
```
<details>
<summary><i>In this example, what do you think the value of <code>rax</code> will be?</i></summary>

<br />
<i>We're adding the contents of <code>rbx</code> to the contents of <code>rax</code>. At the end of this, <code>rax</code> will contain the value <code>4</code>.</i>

</details>

## Subtraction

Subtraction works the same way as addition!

```js
// JavaScript
let a = 3;
let b = 1;

a = a - b;
```
_In JavaScript, we're minusing the contents of `b` from the contents of `a`. At the end of this, `a` will contain the value `2`._

```asm
; X86-64 Assembly
mov rax, 3;
mov rbx, 1;

sub rax, rbx;
```
<details>
<summary><i>In this example, what do you think the value of <code>rax</code> will be?</i></summary>

<br />
<i>We're minusing the contents of <code>rbx</code> from the contents of <code>rax</code>. At the end of this, <code>rax</code> will contain the value <code>2</code>.</i>

</details>

The `sub` instruction subtracts the contents of the register (`rbx`, which contains `1`) on the right side to the contents of the register on the left side (`rax`, which contains `3`). It then takes the difference of these two numbers and stores the value _into_ the register on the left side (`rax`).

## Multiplication

Not all assembly languages have multiplication or division, but x86-64 does! Yay for us!

```js
// JavaScript
let a = 2;
let b = 3;

a = a * b;
```
_In JavaScript, we're multiplying the contents of `b` with the contents of `a`. At the end of this, `a` will contain the value `6`._

```asm
; X86-64 Assembly
mov rax, 2;
mov rbx, 3;

mul rax, rbx;
```
<details>
<summary><i>In assembly, we're multiplying the contents of <code>rbx</code> with the contents of <code>rax</code>. At the end of this, <code>rax</code> will contain the value <code>6</code>. Can you guess how the <code>mul</code> instruction works?</i></summary>

<br />
<i>The <code>mul</code> instruction multiplies the contents of the register (<code>rbx</code>, which contains <code>3</code>) on the right side to the contents of the register on the left side (<code>rax</code>, which contains <code>2</code>). It then takes the product of these two numbers and stores the value _into_ the register on the left side (<code>rax</code>).</i>

</details>

## Putting it together

Now that we have some basic math under our belt, let's try to map a real equation to assembly! You may remember the slope-intercept equation from school. If you're anything like me and don't remember it, it looks like:

> $y = mx + b$

We don't need to get into great detail about this equation, but this is the formula to find the equation of a straight line.

TODO: Fill in more about this equation

<p align="center">
  <br />
  <img height="200" src="http://www.mathscore.com/math/practice/Graphs%20to%20Linear%20Equations/img_664.gif">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

```asm
; X86-64 Assembly
mov rax, 2; rax will contain m
mov rbx, 3; rbx will contain x
mov rcx, 4; rcx will contain b

mul rax, rbx; m*x, store in rax
add rax, rcx; mx + b, store in rax. rax now contains y!
```

<br />

---

<a href="/guide/writing-code/instructions/mov.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/jumps.md">
        Jumping for joy →
      </a>
    </b>
  </em>
</p>
