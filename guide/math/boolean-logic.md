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

<p align="center">
  <br />
  <img src="https://user-images.githubusercontent.com/621904/168841849-865fc1ae-091c-4723-b0b0-cdba50ef22a6.png">
  <br />
  <span>
    <em>
      A representation of an <code>AND</code> logic gate, where the inputs are the wires on the left and the result is the wire coming out of the right.
    </em>
  </span>
</p>
<br />

`AND` is always false unless both inputs are true.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

## OR

![Screen Shot 2022-05-17 at 10 53 20 AM](https://user-images.githubusercontent.com/621904/168842251-b04cdc4d-6c3e-458b-8968-c1eef1fc2b0c.png)

`OR` is always true unless both of the inputs are false.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 1   |

## NOT

![Screen Shot 2022-05-17 at 10 53 29 AM](https://user-images.githubusercontent.com/621904/168842309-66cc8fe3-d4e5-41e0-9ea1-8bc4e2a9bd21.png)

`NOT` only requires a single input, and it flips the input.


| In | Out |
| -- | --- |
| 0  | 1   |
| 1  | 0   |

## NAND

![Screen Shot 2022-05-17 at 10 53 35 AM](https://user-images.githubusercontent.com/621904/168842382-d854d2f1-c20d-46fc-a302-4972343305ca.png)

`NAND` is always true unless both inputs are true. `NAND` is the opposite of `AND`.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

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

![Screen Shot 2022-05-17 at 10 53 25 AM](https://user-images.githubusercontent.com/621904/168842428-dd63a889-4774-4f7b-845e-3ae43c7c9b75.png)

`NOR` is always false unless both inputs are false. `NOR` is the opposite of `OR`.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 0   |

## XOR

![Screen Shot 2022-05-17 at 10 53 38 AM](https://user-images.githubusercontent.com/621904/168842465-f8251a20-8962-4221-9146-93e4e6b01908.png)

`XOR` is true if the inputs are different, false if they're the same.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

## XNOR

![xnor](https://user-images.githubusercontent.com/621904/168848632-9e62e088-3dbf-4007-a435-fe34e6fb4c8b.png)

`XNOR` is true if the inputs are the same, false if they're different. `XNOR` is the opposite of `XOR`.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

## Adding two integers

Now that you know about all the different boolean functions, check this out!

<p align="center">
  <br />
  <img src="https://theorycircuit.com/wp-content/uploads/2018/07/full-adder-circuit.png">
</p>
<br />

This diagram shows how all the boolean functions we learned about above can be combined together to form a circuit that adds two integers together. There is an actual piece of physical hardware inside the CPU you're using right now that is structured just like this!

Now, this is a really complicated diagram that I myself don't fully understand, but what it represents is very important: your CPU isn't doing anything magical when it does "smart" things like adding numbers together, it's just chaining together really simple boolean functions to calculate more complicated results.

<br />

---

> After reading this section, if you want to play around with linking logic gates, check out [logiclights](https://logiclights.vercel.app/) by [@pranav](https://github.com/pranavnt).

---

<br />

<a href="/guide/math/number-systems.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
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
