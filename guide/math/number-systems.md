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

## Decimal (Base 10)

Base 10, also known as decimal, is something called a number system. The most common way we refer to numbers is in base 10, and it means that we have 10 digits we can use to represent any number.

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
 10 # Note that we shifted over by 1 place
 ..
 99
100 # Note that we shifted over by 1 place
101
...
109
110
```

This looks obvious to you, I know. We all do this without thinking about it. But how it works is important, because as I'm sure you've guessed, there's more than one number system. You've actually been hearing about one a lot throughout this guide. Remember all of our **1**s and **0**s we've been talking about?

## Binary (Base 2)

It's helpful to be able to decode binary when we're talking at this low of a level. You and I know how to communicate in base 10, but binary is base 2, which is what the computer understands.

As we already know with binary, there are only two digits represented: **0** and **1**. Now, what's nice about number bases is they all work the same way. Once we run out of digits, we shift over by one place. So let's try it out:

```js
  0 // 0
  1 // 1
 10 // 2 - Note that we shifted over by 1 place
 11 // 3
100 // 4 - Note that we shifted over by 1 place
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

But, let's say we need to read a random number in binary, like `10011`. We wouldn't want to have to count up to that number to figure out what it is. Let's talk about some rules that can help us figure out what that number adds up to in base 10.

Going from right to left, each digit is the value of the digit (`0` or `1`) times **2** to the power of the position of the digit. This is because, if you recall, we're working in **base 2**. That means 2 is the base of our equation!

So let's try this out. `10011` would translate to, from right to left:

- $1 * 2^0 = 1$
- $1 * 2^1 = 2$
- $0 * 2^2 = 0$
- $0 * 2^3 = 0$
- $1 * 2^4 = 16$
- $1 + 2 + 0 + 0 + 16 = 19$

So `10011` equals **19** in base 10!

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

Congratulations, you smartie you! You officially know how to read binary!

## Hexadecimal (Base 16)

Here's a fun fact for you: any number can technically be a base. We'll only be talking about one more base, which is base 16. Base 16 is also known as hexadecimal and commonly shortened to hex.

We're going to talk about hex because binary is often shortened to hex. This is because, when we're talking about the size of registers, we can easily substitute binary with hex to make everything shorter and easier to read. For example, on a 64-bit machine, a register might look like:

```
10000001 00010011 00000000 11110000 10101000 11000111 01111101 00000001
```

The same numbers in hex would end up looking like:

```
81 13 00 FO A8 C7 7D 01
```

_Whoa whoa whoa. Now wait a minute. Why are there letters?_

Well, we have to remember - our base is 16. That means we have 16 digits to represent our numbers. Those digits are:

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
A // 10
B // 11
C // 12
D // 13
E // 14
F // 15
```

So those letters map to numbers!

So what would happen if we went past 15? We do the same thing we did before - shift over by 1 and start over. Let's try it out.

```js
...
 E // 14
 F // 15
10 // 16 - Note that we shifted over by 1 place
11 // 17
12 // 18
13 // 19
14 // 20
15 // 21
16 // 22
17 // 23
18 // 24
19 // 25
1A // 26
1B // 27
1C // 28
1D // 29
1E // 30
1F // 31
20 // 32
...
```

It's really weird, I know. Your brain _wants_ to parse it as decimal, or base 10. But since the math behind the base is completely different, numbers that look like something in base 10 mean completely different things in base 16!

Let's calculate our binary to hex example from above into decimal. So far, our hex digits are:

```
81 13 00 FO A8 C7 7D 01
```

This part works the same as the binary part, but with 16 as our base instead of 2. So let's take one of our bytes from above, `7D`, as an example. We're going to go from right to left, just like in our binary example. You can also think of it as least significant digit to most significant digit, just like in decimal:

- Our number is $7D$

- $D$ maps to $13$
  - $13 * 16^0 = 13$
- $7$ maps to $7$
  - $7 * 16^1 = 112$
- $16 + 112 = 125$

You'll often see hex numbers associated with assembly, registers, and even in higher level concepts like [hex color codes](https://www.color-hex.com/). Now you have the tools you need to recognize these numbers and decode them!

<br />

---

> For more number system goodness, check out [this site](https://www.mathsisfun.com/binary-number-system.html) for more information and an animated explanation.

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
        Let's put our new binary knowledge to the test →
      </a>
    </b>
  </em>
</p>
