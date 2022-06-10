# Loop de Loop

Often in programming, we need to execute code in a loop, changing something each time the loop runs.

Calculate power of $2^8$

$2^8$ is the number of possibilities you can store in a byte

```js
// JavaScript
let base = 2;
let exponent = 8;
let power = 1;

for (i = 0; i <= exponent; i++) {
  power *= base
}
```

```asm
; X86-64 Intel Syntax Assembly
mov rax, 8 ; our exponent
mov rbx, 2 ; our base
mov rcx, 1 ; our power
jmp .calculatePossibilities

.calculatePossibilities
  mov rbx, rdx ; copy our base over so we don't lose it
  mul rdx, rax ; multiply our base by our exponent, save into rdx
  add rcx, rdx ; add the power of our multiplication to our power counter
  dec rax ; decrement our exponent
  jnz .calculatePossibilities; jump back to the beginning if our exponent is not 0
  ret ; if our exponent is 0, return back to the original jump, outside of the loop
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
