# Who writes assembly?

Higher level languages make programming easier by automating many of the intricate details of assembly language so that you and I don't have to think about them. Because of this automation, computers often end up doing extra work that they don't really need to do. Now, computers are really fast, so this unnecessary work probably only takes a few extra milliseconds to do most of the time. A user will never notice that your web application took 203 milliseconds to load instead of 200, so the extra work doesn't matter in this case, or most other cases. However, there are a few cases where you really do need to squeeze every ounce of performance out of your CPU.

The most obvious example is in game engine development. To create the illusion of movement, most games run at a minimum of 60 frames per second and many gamers play games at 144 frames per second. This means there's some area of a game engine's codebase (called the "game loop") that needs to be able to run in 1/144th of a second (7 milliseconds).

If your game engine's code is written in a higher level language, it'll be doing all the extra work we talked about above, and that extra work might push your game loop's execution time over the 7 millisecond limit. This will slow your game's framerate down, leading to choppy gameplay and some unhappy players!

In this situation, if you're able to "drop down" into assembly language, you now have total control over what your program is telling your CPU to do. If you identify a few places where your high level language is doing unnecessary work and replace them with human-optimized assembly language, you may be able to get that game loop back under 7 milliseconds and make your players happy again!

Now, to be clear, assembly language is just one of the many tools available in your optimization toolbox, and most slow code can be optimized without any assembly. However, game engines and other highly efficiency-sensitive applications often need to make full use of that toolbox, which is why they're the main reason people still write assembly today.

## Why should I learn this stuff?

Despite the reasons I've outlined above, you and I will probably never need to write assembly professionally. However, building an understanding of how your computer works at this super low level can be pretty dang empowering, and can help you appreciate all of the other stuff you do on your computer. In fact, the minute I wrote another program after writing in assembly, I was so happy it wasn't assembly. Sorry assembly, I still love you!

Writing programs in assembly, as you'll come to learn, is very manual - you have to account for every single thing yourself. However, knowing the inner workings of our computers can help us understand why programming works the way it does. For example, when we write C, why do we have to specify the sizes of arrays before we use them? Having to do that can feel limiting and confusing, especially since we don't have to do that in higher level languages like Ruby. Learning assembly shows us the first building blocks of programming languages, and shows how programming languages formed over time.

It's kind of like being a race car driver. Race car drivers don't technically need to understand what their car is doing under the hood; they can just use the steering wheel, brake pedal, and other high-level abstractions to do their job. However, if they have a lower-level understanding of what their engine, brakes, wheels, and other mechanical things are doing, they can use that knowledge to be even better at their job. For example, they could be in a race and hear a noise or notice a smell. Someone who hadn't learned about their car may ignore that sign, but those indicators could mean that something is happening at a lower level in their car that they should address - maybe the engine is under strain, or the brakes need a lighter touch at that moment.

Additionally, knowing assembly may not directly change the code you write, but it will give you an increased confidence that may have an impact on your day-to-day programming. The more knowledge I have about the system I'm using, the more enjoyable programming can be for me.

I hope this guide helps you to demystify some of the computer's lowest layers, and turn them from something that feels like magic to something that feels graspable. I personally didn't know how these things worked before I started writing this guide, and I wanted to turn the things I pieced together during my learnings into something that can help others on their journey.

<br />

---

<a href="/guide/introduction.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/cpu/cpu.md">
        Alright, let's get to the good stuff. Like, what even is a CPU? →
      </a>
    </b>
  </em>
</p>
