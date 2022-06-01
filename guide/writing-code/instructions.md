# Instructions

_Note: These examples are written in X86-64 Intel syntax assembly language_

### Comments

```asm
  ; Note: Anything that comes after a semicolon is considered a comment.
  ;       A comment in code means that the compiler will ignore it, so you have
  ;       a place to jot down notes, TODOs, etc.
```

### Basic math

```asm
  add rdi, 3
```

```asm
  sub rdi, 2
```

## Jumps and Conditionals

This is not an exhaustive list, but a list of some examples of instructions to
demonstrate the kinds of conditionals assembly provides us.

A conditional is something that relies on a condition being met to execute it.

_Note: Check out http://unixwiz.net/techtips/x86-jumps.html for a list of conditional jumps for X86 Intel._

### Jump if Not Equal

```asm
  jne .placeToJump
```

### Jump if Greater

```asm
  jg .goHere
```

### Jump if Less

```asm
  jl .doSomeMath
```

### Label

```asm
  _main:
    call .performAddition
    ; ret will return here and keep executing!

  .performAddition:
    add rdi, 3
    ret ; returns back to where you left off in _main!
```

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
