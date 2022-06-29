# Data

We gotta talk about data before we continue. So far, we've been sidestepping around it, talking about it as 1s and 0s, or just _data_. But how data is stored is important for writing assembly.

One unit of data, which is just a single 1 or 0, is called a **bit**.

<p align="center">
  <br />
  <img height="150" src="https://cloud-1csdtyu7d-hack-club-bot.vercel.app/0bit.png">
</p>
<br />

The smallest collection of bits is called a **byte**. Actually, that's not completely true - half of a byte is a **nybble**, which is adorable, but not commonly used.

Have you heard of kilobytes (KB) or megabytes (MB)? Or the ever popular gigabyte (GB)? Same bytes we're talking about here, just more of them!

A byte is made up of **8 bits**. Due to this, 8 is a magic number around here - _everything_ ends up being divisible by 8.

## Bytes & ASCII

Why is the magic number 8?

Well, when we're representing a single character (like `A`), it takes **8 bits** to represent that character in data.

This has to due with the fact that each letter is represented by a number. Because each character is represented by a number, we have to have a table mapping which number represents which letter. We can use that mapping to then see which characters correspond with which numbers.

This is done with the [ASCII table](https://www.asciitable.com/)!

<p align="center">
  <br />
  <img height="500" src="https://cloud-m6tqomah2-hack-club-bot.vercel.app/0ascii.png">
  <br />
  <br />
  <span>
    <em>
      Check out <a href="https://www.asciitable.com/">asciitable.com</a> for the full table
    </em>
  </span>
</p>
<br />

In order to represent those ASCII numbers in just `0`s and `1`s, we have to convert our base 10 number (let's say we're working with `A`, which maps to `65` on the ASCII table) into a base 2 number (`01000001`). We have to represent this number in binary because, as we learned earlier, computer data is represented physically by electrical signals being on or off, which maps directly to `1`s and `0`s.

Our ASCII table goes up to the number 255. In binary, `11111111` is 255. So 8 bits covers all of the ASCII characters!

_Note: For more information on number systems and converting to binary, see the [number systems](#number-systems) section, but for now it's totally fine to hand wave this part!_

<br />

---

<a href="/guide/writing-code/multitude.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/registers.md">
        Let's store this data →
      </a>
    </b>
  </em>
</p>

---

<p align="center">
  <a href="https://hackclub.com/">
    <img width="35" src="https://cloud-l0g1cgz4b-hack-club-bot.vercel.app/0h.png"><br/>
    Made with love by Hack Club
  </a>
</p>
