# A multitude of assembly languages

<p align="center">
  <br />
  <img height="250" src="https://cloud-kg18p3n25-hack-club-bot.vercel.app/0multitude.png">
</p>
<br />

There are many different assembly languages, depending on the processor you want to talk to. Some of the popular ones are:

- **X86** is one of the most useful assembly languages, but is also one of the more complicated ones to write. Most modern desktop computers and game consoles use it. It's used for Intel processors, which have to process a lot of data!

- **ARM** is also very useful and complicated. It's the language used by most smartphones, tablets, and even Raspberry Pis. Recently, it's being used for things like the new Apple M1 processors.

- **6502** was used for many influential older systems, such as the NES, Apple II, or Commodore 64, and is still used in some small devices today. It was designed with human programmers instead of a compiler in mind, so the syntax is easier than most other assembly languages.

- **Z80** is another one you might know - remember those TI-8X calculators you may have used in school? Well, to program those, you'd use the Z80 assembly language!

- **RISC-V** is a simpler assembly language, made for educational and research purposes. RISC stands for "Reduced Instruction Set Compiler". Its goal is to use a smaller instruction set than most other assembly languages.

Given that the processor on my MacBook Pro is an Intel X86 64 bit processor, I will be using **X86-64** assembly code to demonstrate assembly concepts. These concepts will translate across different assembly languages.

<br />

<p align="center">
  <br />
  <img width="250" src="https://cloud-asomlih8p-hack-club-bot.vercel.app/0toolbox.png" />
</p>

<br />

---

<br />

> #### Sidenote:
>
> Higher level languages make programming easier by automating many of the intricate details of assembly language so that you and I don't have to think about them. Because of this automation, computers often end up doing extra work that they don't really need to do. Now, computers are really fast, so this unnecessary work probably only takes a few extra milliseconds to do most of the time. A user will never notice that your web application took 203 milliseconds to load instead of 200, so the extra work doesn't matter in this case, or most other cases. However, there are a few cases where you really do need to squeeze every ounce of performance out of your CPU.
>
> The most obvious example is in game engine development. To create the illusion of movement, most games run at a minimum of 60 frames per second and many gamers play games at 144 frames per second. This means there's some area of a game engine's codebase (called the "game loop") that needs to be able to run in 1/144th of a second (7 milliseconds).
>
> If your game engine's code is written in a higher level language, it'll be doing all the extra work we talked about above, and that extra work might push your game loop's execution time over the 7 millisecond limit. This will slow your game's framerate down, leading to choppy gameplay and some unhappy players!
>
> In this situation, if you're able to "drop down" into assembly language, you now have total control over what your program is telling your CPU to do. If you identify a few places where your high level language is doing unnecessary work and replace them with human-optimized assembly language, you may be able to get that game loop back under 7 milliseconds and make your players happy again!
>
> Now, to be clear, assembly language is just one of the many tools available in your optimization toolbox, and most slow code can be optimized without any assembly. However, game engines and other highly efficiency-sensitive applications often need to make full use of that toolbox, which is why they're the main reason people still write assembly today.

<br />

---

<a href="/guide/cpu/physical-world.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/data.md">
        Seize the data →
      </a>
    </b>
  </em>
</p>
