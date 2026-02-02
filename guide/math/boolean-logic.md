# Boolean logic

If you've done a bit of programming, you've probably seen the word **boolean** before. Boolean is a very cute word for a very simple concept! A boolean is something that can only have one of two values:

- true
- false

True or false can also be represented with numbers: **1** for true, **0** for false. We've dabbled in this concept a bit in previous sections, but it's an important foundational concept for what's happening physically inside the CPU.

Since we represent data in the physical world with the **inclusion** or **absence** of electrical signals, we can use something called **boolean functions** to calculate the results of simple conditional statements like `b && c` or `!a`.

Why would we ever use this? Great question! Let me let you in on another secret.

Remember earlier, how we learned that all code has to end up as numbers for the computer to understand it?

Well that's because your computer is running those numbers through these logical operations. **Every single one.** The numbers are represented by electrical signals, and those electrical signals are passed through physical pieces of hardware that perform these boolean functions and send out new electrical signals representing their results.

All the math your processor can do, it's done by combining a few of these operations together. So you send it some electrical signals, it goes through a few of these hardware "logic gates", in the physical form of transistors, and BAM! You have an answer at the end. You combine a bunch of these small answers through more transistors, and then you have a larger answer! This is how math ends up being done, and how data ends up getting stored.

Let's walk through these logical operations, they're actually quite simple!

## AND

<img height="75" src="https://cdn.hackclub.com/019c1f0b-6e97-7ace-b6c6-310850c1675d/image.png">

This image is a representation of an <code>AND</code> logic gate, where the inputs are the wires on the left and the result is the wire coming out of the right.

`AND` is always false unless both inputs are true.

| In  | Out |
| --- | --- |
| 00  | 0   |
| 10  | 0   |
| 01  | 0   |
| 11  | 1   |

## OR

<img height="75" src="https://cdn.hackclub.com/019c1f0c-1108-7872-b9c1-f4b38aa9a722/image.png">

`OR` is always true unless both of the inputs are false.

| In  | Out |
| --- | --- |
| 00  | 0   |
| 10  | 1   |
| 01  | 1   |
| 11  | 1   |

## NOT

<img height="75" src="https://cdn.hackclub.com/019c1f0c-be6a-7e47-9bb5-8f669741746a/image.png">

`NOT` only requires a single input, and it flips the input.

| In  | Out |
| --- | --- |
| 0   | 1   |
| 1   | 0   |

## NAND

<img height="75" src="https://cdn.hackclub.com/019c1f0d-6828-78ef-a0b5-4925ff12e328/image.png">

`NAND` is always true unless both inputs are true. `NAND` is the opposite of `AND`.

| In  | Out |
| --- | --- |
| 00  | 1   |
| 10  | 1   |
| 01  | 1   |
| 11  | 0   |

<br />

---

> **NAND is special**
>
> Here's a fun fact: You only need the NAND gate (AND gate followed by NOT) to do every single possible logic operation ever.
>
> That means that every possible logic circuit can be made to use only NAND! In fact, a physical NAND transistor takes up less area than an AND transistor. To make an AND, you'd actually make a NAND and then invert the output. Check out the free course [From Nand2 to Tetris](https://www.nand2tetris.org/) to build an entire computer system using just these principles.

---

<br />

## NOR

<img height="75" src="https://cdn.hackclub.com/019c1f0e-2319-7eee-9a37-29d57e3c94d0/image.png">

`NOR` is always false unless both inputs are false. `NOR` is the opposite of `OR`.

| In  | Out |
| --- | --- |
| 00  | 1   |
| 10  | 0   |
| 01  | 0   |
| 11  | 0   |

## XOR

<img height="75" src="https://cdn.hackclub.com/019c1f0f-6f72-7896-815c-46bd74978061/image.png">

`XOR` is true if the inputs are different, false if they're the same.

| In  | Out |
| --- | --- |
| 00  | 0   |
| 10  | 1   |
| 01  | 1   |
| 11  | 0   |

## XNOR

<img height="75" src="https://cdn.hackclub.com/019c1f0f-e9bf-7bdb-a885-783e5f242fac/image.png">

`XNOR` is true if the inputs are the same, false if they're different. `XNOR` is the opposite of `XOR`.

| In  | Out |
| --- | --- |
| 00  | 1   |
| 10  | 0   |
| 01  | 0   |
| 11  | 1   |

## Adding Numbers

Now that you know about all the different boolean functions, check this out!

<p align="center">
  <br />
  <img height="250" src="https://cdn.hackclub.com/019c1f0e-c583-72c2-a7de-7f4f72b0394f/image.png">
</p>
<br />

This diagram shows how all the boolean functions we learned about above can be combined together to form a circuit that adds two numbers together. There is an actual piece of physical hardware inside the CPU you're using right now that is structured just like this!

Now, this is a diagram that I myself don't fully understand, but what it represents is very important: your CPU isn't doing anything magical when it does "smart" things like adding numbers together, it's just chaining together really simple boolean functions to calculate more complicated results.

---

> After reading this section, if you want to play around with linking logic gates, check out [LogicLights](https://logiclights.vercel.app/) by [Hack Clubber](https://hackclub.com/) [@pranav](https://github.com/pranavnt)!

---

<br />

<a href="/guide/math/number-systems.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/conclusion.md">
        Let's wrap it up →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cdn.hackclub.com/019c1b71-2582-7e9c-9125-3792c8a88142/image.png"><br/>
    Made with love by Hack Club
  </a>
</p>

