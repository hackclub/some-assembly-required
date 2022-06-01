# Registers

Now that we know about data, we should talk about storing data. We covered registers in the [saving data](#saving-data) section briefly - registers are available for short term data storage on the CPU.

<p align="center">
  <br />
  <img height="600" src="https://cloud-1dple0n1y-hack-club-bot.vercel.app/0screen_shot_2022-06-01_at_10.49.40_am.png">
  <br />
  <span>
    <em>
      Commonly used x86-64 registers
    </em>
  </span>
</p>
<br />

From [Stanford CS107](https://web.stanford.edu/class/archive/cs/cs107/cs107.1222/guide/x86-64.html), the table above lists the commonly used registers. Each register is 64 bits.

Some registers are designated for a certain purpose, such as `%rsp` being used as the stack pointer or `%rax` for the return value from a function.

## Caller-owned vs Callee-owned

Other registers are all-purpose, but have a conventional use depending on whether **caller-owned** or **callee-owned**.

For example, if the function `function1` calls `function2`, we refer to `function1` as the **caller** and `function2` as the **callee**. The registers used for the first 6 arguments and return value are all **callee-owned**.

That means that the **callee** can freely use those registers, overwriting existing values without taking any precautions. If `%rax` holds a value the **caller** wants to retain, the caller must copy the value to a "safe" location before making a call. The **callee-owned** registers are ideal for _scratch/temporary_ use by the **callee**.

In contrast, if the **callee** intends to use a **caller-owned** register, it must first _preserve its value_ and _restore it_ before exiting the call. The **caller-owned** registers are used for _local state_ of the **caller** that needs to preserved across further function calls.

<br />

---

<a href="/guide/writing-code/data.md">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cloud-5aq8uo1rv-hack-club-bot.vercel.app/0backd.png">
    <img align="left" width="60" src="https://cloud-5v3nvbscw-hack-club-bot.vercel.app/0backl.png" />
  </picture>
</a>

<p align="right">
  <em>
    <b>
      <a href="/guide/writing-code/instructions.md">
        Let's boss this computer around →
      </a>
    </b>
  </em>
</p>
