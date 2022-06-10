# Loop de Loop

Often in programming, we need to execute code in a loop, changing something each time the loop runs.

Calculate result of $2^8$

$2^8$ is the number of possibilities you can store in a byte

```js
// JavaScript
let base = 2;
let exponent = 8;
let result = 1;

for (i = 0; i <= exponent; i++) {
  result *= base
}
```

```asm
; X86-64 Intel Syntax Assembly
mov rax, 8 ; our exponent
mov rbx, 2 ; our base
mov rcx, 1 ; our result
mov rdx, 0 ; our counter

.calculatePower
  mul rcx, rax       ; multiply our result by our base, save into rcx
  inc rax            ; increment counter
  cmp rdx, rax       ; compare our counter with our exponent
  jl .calculatePower ; jump to the beginning of the loop if rdx < rax, since we still have more iterations to go

; once we've made it here, rcx contains our result (rbx^rax)!
```

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
