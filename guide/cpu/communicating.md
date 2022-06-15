# Communicating with the CPU

We're used to communicating with the CPU in a high-level language like JavaScript or C, but the code you'd write in these languages doesn't directly represent the things you're telling the CPU to do.

It's like if you decided to travel to Greece. Writing in a high-level language would be like buying a travel package that handles everything for you, like booking your plane tickets, hotels, handling your food, car rental. If you wanted to handle those things manually, you'd have to buy each thing individually and organize it yourself.

Similarly, with your computer, if you want to control each aspect of what you're asking the computer to do, you'll need to write the instructions for it in a format called assembly language.

Assembly language is the lowest level of abstraction in computers where the code you write is still human readable. You may disagree about the human readable part when you first see it, but I promise you it's better than what the computer is looking at!

What do we mean by an abstraction? Well, an abstraction is a layer above something else that makes that thing easier to do.

<p align="center">
  <br />
  <img height="300" src="https://cloud-lrwvwyim3-hack-club-bot.vercel.app/0wheel.png">
</p>
<br />

For example, let's take a steering wheel. A steering wheel makes driving simple - you just turn left and right, and the amount you turn maps to how much your tires turn. But, what's happening underneath? The steering wheel is an abstraction layer on top of rods, levers, and whatever else is happening inside that car, simplifying the act of turning for you. Or something like that. I clearly don't know anything about cars.

In our case, assembly is the steering wheel, and the rods, levers, and other hidden stuff is our machine code.

Machine code is just a bunch of numbers that the computer can read. In fact, it turns out that **everything is just numbers** underneath. Here's the thing about computers - they can actually only understand numbers, so everything we do has to be translated down to numbers eventually.

So, machine code is just a bunch of numbers that the CPU reads to figure out what instructions to execute and on what data. It's the computer-readable code.

Since we humans like to read text, assembly is a text based language, consisting of acronyms that represent instructions to the computer. Alas, since they are text, they are not directly readable by the CPU. So that text file gets translated, through something called the **assembler**, into the numbers that the computer can then read.

It's like if you were an American and you were giving your Icelandic friend a cake recipe. Americans write recipes in imperial measurements (eg cups, tablespoons, etc.), and Icelandic people write recipes in metric measurements (grams, liters, etc.).

<p align="center">
  <br />
  <img src="https://cloud-r72u23edw-hack-club-bot.vercel.app/0recipe-resized.png">
</p>
<br />

Line by line you'd translate the recipe until you have a new recipe for your friend to use. You'd take the first measurement, 2 cups of flour (**assembly language**), convert it to grams (**the assembler**), and then write the converted recipe to use 136 grams of flour (**machine code**). Look at you go - you're the assembler here!

You could skip all of this assembly shenanigans by writing the machine code directly, but machine code looks something like:

```
73 137 252 73 137 245 65  85
65 84 232 52 0 0 0 232
```

Assembly, on the other hand, looks something like:

```asm
mov r12, r13
add r12, 4
```

I know this doesn't look extremely friendly, especially compared to the high level programming languages we have today. However, I promise you it is far friendlier than just writing a bunch of numbers!

All programming languages are some level of abstraction above machine code. But, in the end, all human written code has to be converted into numbers for your CPU to be able to read.

<br />

---

<a href="/guide/cpu/cpu.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/cpu/instruction-cycle.md">
        How does that work →
      </a>
    </b>
  </em>
</p>
