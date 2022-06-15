# Electricity and the physical world

Now we know how the CPU is able to interpret machine code, which is just numbers as instructions. And we know that these instructions can be represented with just 1s and 0s, also known as [binary](#binary).

In the physical world, these binary numbers map to electrical circuits. To simplify a bit, if a circuit contains electrical current, it can be considered "on", or **1**. If it doesn't have electrical current, it can be considered "off", or **0**. Using this principal, multiple circuits can be arranged in a group to represent binary numbers.

<p align="center">
  <br />
  <img width="375" src="https://cloud-n4b1b7kn3-hack-club-bot.vercel.app/0conveyer2.png">
</p>
<br />

Let's continue with our warehouse metaphor, where the warehouse is our CPU, and a single box is a group of electrical circuits. A single box will travel through the warehouse on conveyor belts in order to make it from one working station to another. The conveyor belts, in the CPU world, are known as **buses**. Buses are effectively just groups of wires that allow electricity (and therefore information represented by 0s and 1s) to travel from one place to another, and there are different types of wires depending on what kind of data you want to send around.

As a box travels around the warehouse on conveyor belts, it will be stopped at different working stations. Some stations may check inside the box and send it elsewhere based on what it finds. Other stations may add or remove stuff to or from the box. This is just like in a CPU: our data, or electrical signals, travel around the CPU on buses, and when it reaches different parts of the CPU, it may have its value checked or modified.

## Processor clock

In our warehouse, we want to make sure everything happens at an organized pace, and there aren't any disruptions at stations. One way we can accomplish this is by setting everything to a timer. Let's say our boxes move forward at the pace of 1 station per second, and each station takes 1 second to perform its task. Back in CPU land, this would be our **processor clock**.

It's _called_ a processor clock, but it's really more like a metronome. It's made of material that oscillates, moving back and forth at a certain frequency, giving you a bunch of vibrations per second. We call each one of these vibrations a "clock tick". These vibrations helps keeps the CPU in sync as each "clock tick" signals the CPU starts a new instruction by fetching the instruction data from memory.

This is important to us because for every clock tick, the CPU reads one instruction. This clock goes _really fast_. Today's CPUs are measured in gigahertz (GHz) which is approximately **one billion cycles per second**!

<br />

---

<a href="/guide/cpu/map.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/multitude.md">
        Let's write some code →
      </a>
    </b>
  </em>
</p>
