# Data

We gotta talk about data before we continue. So far, we've been sidestepping around it, talking about it as 1s and 0s, or just _data_. But how data is stored is important for writing assembly.

One unit of data, which is just a single 1 or 0, is called a **bit**.

<p align="center">
  <br />
  <img height="150" src="https://cdn.hackclub.com/019c1e4d-e7b8-71d3-94fb-3af451a0550d/image.png">
</p>
<br />

The smallest collection of bits is called a **byte**. Actually, that's not completely true - half of a byte is a **nybble**, which is adorable, but not commonly used.

Have you heard of kilobytes (KB) or megabytes (MB)? Or the ever popular gigabyte (GB)? Same bytes we're talking about here, just more of them!

A byte is made up of **8 bits**. Due to this, 8 is a magic number around here - _everything_ ends up being divisible by 8.

## Bytes & ASCII

Why is the magic number 8?

Well, ASCII uses 7 bits to represent characters (like `A`), but it’s typically stored in **8 bits** because that’s how most computers handle data.

This has to do with the fact that each letter is represented by a number. Because each character is represented by a number, we have to have a table mapping which number represents which letter. We can use that mapping to then see which characters correspond with which numbers.

This is done with the [ASCII table](https://www.asciitable.com/)!

<p align="center">
  <br />
  <img height="500" src="https://cdn.hackclub.com/019c1e4f-6d75-7f4d-bdb2-b1c5708443e0/image.png">
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
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png">
    <img align="left" width="70" src="https://cdn.hackclub.com/019c1b78-0beb-7c82-9479-51e12c90a5b4/image.png" />
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
    <img width="35" src="https://cdn.hackclub.com/019c1b71-2582-7e9c-9125-3792c8a88142/image.png"><br/>
    Made with love by Hack Club
  </a>
</p>
