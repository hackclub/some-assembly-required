# Instructions

_Note: These examples are written in X86-64 Intel syntax assembly language_

This will be nowhere near an exhaustive list, but here's a list of some examples of instructions to demonstrate the kinds of things we can do in assembly.

To see more common instructions, check out the [Stanford CS107 list](https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html#common-instructions).

<div align="center">
| Instruction | Arguments | Explanation           |
| ---         | ---       | ---                   |
| **mov**     | src, dst  | dst = src             |
| **add**     | src, dst  | dst += src            |
| **sub**     | src, dst  | dst -= src            |
| **cmp**     | a, b      | b-a set flags         |
| **jmp**     | label     | jump to label         |
| **je**      | label     | jump if equal (ZF=1)  |
| **jne**     | label     | jump not equal (ZF=0) |
| **jg**      | label     | jump > (ZF=0)         |
| **push**    | src       | add to top of stack   |
| **pop**     | dst       | remove top from stack |
| **call**    | fn        | push %rip, jmp to fn  |
| **ret**     |           | pop %rip              |
</div>

## Instructions

#### Comments

Anything that comes after a semicolon is considered a comment. A comment in code means that the compiler will ignore it, so you have a place to jot down notes, TODOs, etc.

```asm
  ; Here's a comment! This will not be called.

  mov rdx, rax ; A comment can even come after an instruction.
```

#### Move
_Arguments: src, dst_

Move the contents of register `rax` into register `rdx`.

```asm
  mov rdx, rax
```

## Basic math

#### add
_Arguments: src, dst_

Add `3` to the contents of `rdi`, and save that new value to `rdi`.

```asm
  add rdi, 3
```

#### sub
_Arguments: src, dst_

Subtract `2` from the contents of `rdx`, and save that new value to `rdx`.

```asm
  sub rdx, 2
```

## Jumps and Conditionals

A conditional is something that relies on a condition being met to execute it.

_Note: Check out http://unixwiz.net/techtips/x86-jumps.html for a list of conditional jumps for X86 Intel._

#### Label

```asm
  _main:
    call .performAddition
    ; ret will return here and keep executing!

  .performAddition:
    add rdi, 3
    ret ; returns back to where you left off in _main!
```

#### Jump
_Arguments: label_

```asm
  jump .placeToJump
```

#### Jump if Equal
_Arguments: label_

```asm
  je .placeToJump
```

#### Jump if Not Equal
_Arguments: label_

```asm
  jne .placeToJump
```

#### jg
_Arguments: label_

```asm
  jg .placeToJump
```

## The Stack

#### push
_Arguments: src_

Explain push here

#### pop
_Arguments: dst_

Explain pop here

#### call
_Arguments: fn_

Explain call here

#### ret

Explain ret here

## Flags

#### cmp
_Arguments: a, b_

Explain cmp here

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
