# Data

We gotta talk about data before we continue. So far, we've been sidestepping around it, talking about it as 1s and 0s, or just _data_. But how data is stored is important for writing assembly.

One unit of data, which is just a single 1 or 0, is called a **bit**.

<p align="center">
  <br />
  <img height="200" src="https://learnworthy.net/wp-content/uploads/2020/03/The-amazing-history-of-the-Data-Byte.png">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

The smallest collection of bits is called a **byte**. Have you heard of kilobytes (KB) or megabytes (MB)? Or the ever popular gigabyte (GB)? Same bytes we're talking about here, just more of them!

A byte is made up of **8 bits**. Due to this, 8 is a magic number around here - _everything_ ends up being divisible by 8.

## Bytes & ASCII

Why 8? Well, when we're representing a single character (like "a"), it takes 8 bits to represent that character in data. That's because each letter is represented by a number, that we can then map to a character when we need to. Have you heard of the [ASCII table](https://www.asciitable.com/)? That table shows each character mapped to its coordinating number!

<p align="center">
  <br />
  <img height="450" src="https://www.asciitable.com/asciifull.gif">
  <br />
  <span>
    <em>
      just a placeholder image to break up the content!
    </em>
  </span>
</p>
<br />

_Note: For more information on number systems and converting to binary, see the [number systems](#number-systems) section, but for now it's fine to hand wave that part._

In order to represent those ASCII numbers in just `0`s and `1`s, we have to convert our base 10 number (let's say we're working with `A`, which maps to `65` on the ASCII table) into a base 2 number (`00100001`). We have to represent this number in binary because, as we learned earlier, computer data is represented physically by electrical signals being on or off, which maps directly to `1`s and `0`s.

Our ASCII table goes up to the number 127, which, in binary, is represented by `10000000`. So that's why we need 8 digits!

<br />

---

<a href="/guide/writing-code/writing-code.md">
  <img align="left" width="70" src="https://cloud-cirb9mt0l-hack-club-bot.vercel.app/0screen_shot_2022-05-31_at_2.40.40_pm.png" />
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/registers.md">
        Registers →
      </a>
    </b>
  </em>
</p>
