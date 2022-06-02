# Boolean logic

<br />

> After reading this section, if you want to play around with linking logic gates, check out [logiclights](https://logiclights.vercel.app/) by [@pranav](https://github.com/pranavnt)

<br />

Boolean is a very cute word for a very simple concept! A boolean is something that can only have one of two values - true or false. True or false can also be represented as 1 for true, 0 for false.

Since we represent data in the physical world with the inclusion or absence of electrical signals, we can use something called boolean logic to determine whether a “statement” is **true** or **false**. A statement here is just boolean values, and we pass them to operations we can use depending on our use case.

Why would we ever use this? Great question! Let me let you in on another secret.

Remember earlier, how we learned that all code has to end up as numbers for the computer to understand it?

Well that's because your computer is running those numbers through these logical operations. **Every single one.**

All the math your processor can do, it’s done by combining a few of these operations together. So you send it some electrical signals, it goes through a few of these “logic gates”, in the physical form of transistors, and BAM! You have an answer at the end. You combine a bunch of these small answers through more transistors, and then you have a larger answer!

Let’s talk through these logical operations a bit.

## Boolean math

TODO fill out this section

## Logical Operations

### AND

![Screen Shot 2022-05-17 at 10 53 15 AM](https://user-images.githubusercontent.com/621904/168841849-865fc1ae-091c-4723-b0b0-cdba50ef22a6.png)

And is always false unless both inputs are true.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

### OR

![Screen Shot 2022-05-17 at 10 53 20 AM](https://user-images.githubusercontent.com/621904/168842251-b04cdc4d-6c3e-458b-8968-c1eef1fc2b0c.png)

OR is always false unless one of the inputs is true.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 1   |

### NOT

![Screen Shot 2022-05-17 at 10 53 29 AM](https://user-images.githubusercontent.com/621904/168842309-66cc8fe3-d4e5-41e0-9ea1-8bc4e2a9bd21.png)

NOT only requires 1 input, and it flips the input.


| In | Out |
| -- | --- |
| 0  | 1   |
| 1  | 0   |

### NAND

![Screen Shot 2022-05-17 at 10 53 35 AM](https://user-images.githubusercontent.com/621904/168842382-d854d2f1-c20d-46fc-a302-4972343305ca.png)

NAND is always true unless both inputs are true.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

### NOR

![Screen Shot 2022-05-17 at 10 53 25 AM](https://user-images.githubusercontent.com/621904/168842428-dd63a889-4774-4f7b-845e-3ae43c7c9b75.png)

NOR is always false unless both inputs are false.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 0   |

### XOR

![Screen Shot 2022-05-17 at 10 53 38 AM](https://user-images.githubusercontent.com/621904/168842465-f8251a20-8962-4221-9146-93e4e6b01908.png)

XOR is always false unless the inputs are different.


| In | Out |
| -- | --- |
| 00 | 0   |
| 10 | 1   |
| 01 | 1   |
| 11 | 0   |

### XNOR

![xnor](https://user-images.githubusercontent.com/621904/168848632-9e62e088-3dbf-4007-a435-fe34e6fb4c8b.png)

XNOR is always false unless the inputs are the same.


| In | Out |
| -- | --- |
| 00 | 1   |
| 10 | 0   |
| 01 | 0   |
| 11 | 1   |

## NAND is special

Here's a fun fact: You only need the NAND gate (AND gate followed by NOT) to do every single possible logic operation ever.

That means that every possible logic circuit can be made to use only NAND! In fact, a physical NAND transistor takes up less area than an AND transistor. To make an AND, you’d actually make a NAND and then invert the output. Check out the free course [From Nand2 to Tetris](https://www.nand2tetris.org/) to build an entire computer system using just these principles.

In real circuits, you would even see amalgamations of gates (like AND+OR+NOT+OR+AND) as a single "standard cell". It’s like stacking lego bricks, but each brick is a logical operation.

<br />

---

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
