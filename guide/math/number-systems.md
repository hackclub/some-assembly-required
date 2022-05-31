# The Math Section

If you thought you'd get through this without doing any math, well, I'm sorry. We have to do a little bit so that we can understand what the computer is doing, because like I said, it's all just basic math underneath. I will promise you that it won't be too hard!

## Number Systems

<p align="center">
  <br />
  <img width="750" src="https://cloud-lhlv3an57-hack-club-bot.vercel.app/0math.png">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

### Base 10

### Hexadecimal
_Also known as base 8!_

All numbers in assembly language are represented by hexadecimal.
When we think of numbers in the human world, we think of them in base 10. Base 10 means that each digit of a number can be represented with the digits 0-9. Each digit over we move (for example 1 vs 10 vs 100) is 10 times the value to the right of it (as seen in the graph above). And when we count in base 10 numbers, we count from 0 up to 9 and then start over again but add one to the left: 0, 1, ..., 10, 11, ..., 20, 21, etc.

When you see 125 as a number, you can think of that as:

- (10 * 10^2) + (2 * 10^1) + (5 * 10^0)
- 100 + 20 + 5 = 125

Hex is base 16, which means is the available digits are 0-9 and A-F (for 10-15).  When we count in base 16 numbers, we count from 0 up to F(15) and then start over again but add one to the left: 0, 1, 2, ..., E, F, 10, 11, ..., 1E, 1F, 20, 21, etc. Each digit is the value of the digit (0-15 where 10-15 are represented by A-F) times 16 to the power of the position of the digit (starting with 0 from the right).

7D would translate to:

- D = 13
- (7 * 16^1) + (13 * 16^0)
- 112 + 13 = 125

### Binary
_Also known as base 2!_

<p align="center">
  <br>
  <img width="460" height="300" src="https://images.easytechjunkie.com/green-lit-numbers.jpg">
  <br>
</p>

When people hear that I program for a living, they think that I stare at 0s and 1s all day. Luckily I do not, because that would give me a migraine. However, binary is important to talk about, because everything the computer is doing can be represented by these digits. These digits are referred to as binary, which is a number system that has 2 as its base.

With binary, there are only two digits represented: 0 and 1. When we count in base 2 numbers, we count from 0 up to 1 and then start over again but add one to the left: 0, 1, 10, 11, 100, 101, 110, etc.With binary, since it's only 0 and 1, when adding to digit 0, you change it to digit 1 and when adding digit 1, you change the digit to 0 and add 1 to the left of that digit.

Each digit is the value of the digit (0 or 1) times 2 to the power of the position of the digit (starting with 0 from the right).

11011 would translate to:

- (1 * 2^4) + (1 * 2^3) + (0 * 2^2) + (1 * 2^1) + (1 * 2^))
- 16 + 8 + 0 + 2 + 1 = 27

Confused? Check out [this site](https://www.mathsisfun.com/binary-number-system.html) for more information and an animated explanation.

<br />

---

<a href="/guide/writing-code/instructions.md">
  <img align="left" width="70" src="https://cloud-cirb9mt0l-hack-club-bot.vercel.app/0screen_shot_2022-05-31_at_2.40.40_pm.png" />
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/math/boolean-logic.md">
        Boolean logic →
      </a>
    </b>
  </em>
</p>
