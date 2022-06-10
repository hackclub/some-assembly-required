# Loop de Loop

Often in programming, we need to execute the same code over a set of values, or in a **loop**, changing something each time the loop runs.

This is best explained with an example. Like, what if we wanted to calculate the amount of possible numbers we could store in a **byte**?

As a reminder:
  - a bit has 2 possibilities, `1` or `0`
  - a byte is 8 bits
  - given that, $2^8$ is the number of possibilities you can store in a byte

So what would that look like in JavaScript?

```js
// JavaScript
let base = 2;
let exponent = 8;
let result = 1; # since our index is starting at 0, we start our result at 2^0, which is 1

for (i = 0; i < exponent; i++) {
  result *= base
}
```

We use a [`for` loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration) to make this work, which sets an index variable to `0`. While our index is less than our exponent (`8`), we continue looping. On each loop, we increment the index by `1`.

Inside the loop, we take the result we're calculating, and we multiply it by our base (`2`). That would look like, on each loop:

1. `result = 1 * 2`, `result` is now `2`
1. `result = 2 * 2`, `result` is now `4`
1. `result = 4 * 2`, `result` is now `8`
1. `result = 16 * 2`, `result` is now `16`
1. `result = 32 * 2`, `result` is now `64`
1. `result = 64 * 2`, `result` is now `128`
1. `result = 128 * 2`, `result` is now `256`

So, a byte can hold 256 unique values! Neat! Now let's do this in assembly.

Assembly doesn't have `for` loops, but it _does_ have conditional jumps, as we've learned. With a little setup, we can use a conditional jump in the exact same way we use a for loop.

```asm
; X86-64 Intel Syntax Assembly
mov rax, 8 ; our exponent
mov rbx, 2 ; our base
mov rcx, 1 ; our result. since our index is starting at 0, we start our result at 2^0, which is 1
mov rdx, 0 ; our index

.calculatePower
  mul rcx, rax       ; multiply our result by our base, save into rcx
  inc rax            ; increment index
  cmp rdx, rax       ; compare our index with our exponent
  jl .calculatePower ; jump to the beginning of the loop if rdx < rax, since we still have more iterations to go

; once we've made it here, rcx contains our result (rbx^rax)!
```

See what we did there?

First we set up our "variables", just like in our JavaScript example. We have one extra variable, `index`. The JavaScript example also defines an `index`, but inside of the `for` loop.

Next, we made a label, which we will be able to jump back to. We do our multiplication math, just like the `for` loop. Then, we manually increment our `index`, which is happening in the JavaScript `for` loop with `i++`.

Now we compare our index with our exponent, which in the JavaScript example is `i < exponent`. If the `index` is less than (`jl`) the `exponent`, we jump back to `.calculatePower`. Wooooo!

<br />

---

<a href="/guide/writing-code/instructions/conditionals.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions/functions.md">
         Let's get functional →
      </a>
    </b>
  </em>
</p>
