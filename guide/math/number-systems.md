# The Math Section

So far with learning about CPUs and assembly, we haven't actually needed to dive into any big math concepts! However, for deeper understanding of how our computers are working, there are some fundamentals worth talking about.

Numbers are made up. There, I said it.

But really, the numbers you and I think about, (1, 2, 3, etc.) are symbols that we have created in order to represent the things we see around us. We most commonly represent these numbers in something called **base 10**, meaning we have 10 digits to represent our numbers.

<p align="center">
  <br />
  <img height="250" src="https://img2.annthegran.com/stockdesign/xlarge/grand_slam_designs/tim215.jpg">
  <br />
  <span>
    <em>
      Why 10? Well, it's because we have 10 fingers!
    </em>
  </span>
</p>
<br />

## Base 10

Base 10 is something called a number system. The most common way we refer to numbers is in base 10, and it means that we have 10 digits we can use to represent any number.

Those digits are 0 - 9. So, what happens when we run out of digits? We shift over to the left by 1 place, and we start all over again. For example:
```js
 0
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 ..
 99
100
101
...
109
110
```

This looks obvious to you, I know. We all do this without thinking about it. But how it works is important, because as I'm sure you've guessed, there's more than one number system. You've actually been hearing about one a lot throughout this guide. Remember all of our **1**s and **0**s we've been talking about?

## Binary, or base 2

It's helpful to be able to decode binary when we're talking at this low of a level. You and I know how to communicate in base 10, but binary is base 2, which is what the computer understands.

As we already know with binary, there are only two digits represented: **0** and **1**. Now, what's nice about number bases is they all work the same way. Once we run out of digits, we shift over. So let's try it out:

```js
  0 // 0
  1 // 1
 10 // 2
 11 // 3
100 // 4
101 // 5
110 // 6
111 // 7
```

<details>
<summary><i>Given this pattern we're seeing, what will 8 be in binary?</i></summary>
<br />
<i>Since we've run out of digits to use, we have to shift 1 place over. 8 in binary is `1000`.</i>
</details>

So if we follow this simple pattern, we can count up our numbers without too much hassle.

But, let's say we need to read a random number in binary, like `11011`. We wouldn't want to have to count up to that number to figure out what it is. Let's talk about some rules that can help us figure out what that number adds up to in base 10.

Going from right to left, each digit is the value of the digit (`0` or `1`) times **2** to the power of the position of the digit. This is because, if you recall, we're working in **base 2**. That means 2 is the base of our equation!

So let's try this out. `11011` would translate to, from right to left:

- $1 * 2^0 = 1$
- $1 * 2^1 = 2$
- $0 * 2^2 = 0$
- $1 * 2^3 = 8$
- $1 * 2^4 = 16$
- $1 + 2 + 0 + 8 + 16 = 27$

So `11011` equals **27** in base 10!

Now, for those extra credit readers, you could try calculating `1011001` into base 10 on your own if you're so inclined.

<details>
<summary><i>What is <code>1011001</code> in base 10?</i></summary>
<br />
<i>
As a reminder, we're calculating from right to left.

- $1 * 2^0 = 1$
- $0 * 2^1 = 0$
- $0 * 2^2 = 0$
- $1 * 2^3 = 8$
- $1 * 2^4 = 16$
- $0 * 2^5 = 0$
- $1 * 2^6 = 64$
- $1 + 0 + 0 + 8 + 16 + 0 + 64 = 89$

So `1011001` is 89 in base 10.
</i>
</details>

## Hexadecimal, or base 16
  _Also known as base 16!_

TODO: Make this friendlier

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
Confused? Check out [this site](https://www.mathsisfun.com/binary-number-system.html) for more information and an animated explanation.

<br />

---

<a href="/guide/writing-code/uppercaser.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
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
