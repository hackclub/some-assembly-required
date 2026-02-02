# Mapping an Instruction to Machine Code

<p align="center">
  <br />
  <img width="375" src="https://cdn.hackclub.com/019c2059-35f0-7d6d-a528-69f1b2852d13/image.png">
  <br />
</p>

<br />

You may be wondering what this might look like. If you are, you're in luck! Let's map an instruction to machine code.

Remember our registers, or cubbies? We will talk about them [more later](/guide/writing-code/registers.md), but for this example, we just need to remember that they're places where you can store things temporarily.

```asm
add r12, 4 ; Add the number 4 to the number saved in register 12
```

First, the CPU goes and fetches the instruction. In machine code, this could end up looking like this (we will cover what [binary](/guide/math/number-systems.md#binary-base-2) is later):

```
00000001 00001100 00000100
```

Which, in [base 10](#number-systems) (how we normally talk about numbers!), is:

```
1 12 4
```

When the decoder reads its first value, it knows it's looking for a number to map to an opcode.

| Number | Instruction |
| ------ | ----------- |
| 1      | `add`       |
| 2      | `sub`       |
| ...    | ...         |

Now, let's say the number `1` maps to the opcode `add`. When it sees the `1`, it knows it's reading an `add` instruction.

The decoder knows that the `add` instruction's first argument is both:

- the save destination
- and the location of the first number to add

The decoder then sees that the next piece of data has the value `12`, so it knows that its save destination is register 12 (`r12`). It can then grab the number stored in `r12` for the math part.

The decoder knows that next comes the argument for the number to add, which is `4`.

Then this all gets executed. The CPU sends the number `4` and the number stored in register 12 (`r12`) to the ALU, which sends the sum of these two numbers back to the CPU. The CPU takes this sum from the ALU and saves it to register 12 (`r12`). We did it!

<br />

---

<br />

> #### Sidenote:
>
> Nowadays, instead of a cycle where each flow of instruction ends before the next one starts, CPUs implement something called **pipelining**.
>
> Imagine a warehouse where we are packing boxes. The CPU is the warehouse, and each station (the adding of items, packaging, and loading into vans) is a step in processing instructions (the packages).
>
> In the simpler cycle method described above, one package would be fully packed and shipped before the next one is worked on.
>
> Alternatively, pipelining would use an assembly line where a package could go through a single station. Once it finishes and moves to the next station, a new package arrives at this station! Before our first package is shipped, other packages have already started to be filled and packed.
>
> What this means for us in CPU terms is that modern CPUs can simultaneously fetch, decode, and execute different instructions _at the same time_. This dramatically cuts down on execution time, which allows the CPU to operate much faster! Yay for us!

<br />

---

<a href="/guide/cpu/instruction-cycle.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/cpu/physical-world.md">
        Translating this to the physical world →
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
