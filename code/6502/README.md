# 6502

If you're new to assembly, it's worth going through the [guide](/guide/introduction.md) first before exploring this section. The 6502 was developed by MOS Technology and it powered a number of computers like the Apple 2 and Nintendo Entertainment System (NES). It was released significantly cheaper than its competitors (back in 1975) and has helped drive the computer evolution. Although you don't need to learn 6502 to code, it is pretty cool to see what happens "under the hood". If you want to, you can even write games for the [NES](https://en.wikipedia.org/wiki/Super_Nintendo_Entertainment_System)!

I also highly recommend taking some time to go through the [Easy 6502 Guide](https://skilldrick.github.io/easy6502/) by [@skilldrick](https://twitter.com/skilldrick). It took me about 6 hours to complete all the exercises and understand the concepts, but you can definitely go through it in less time.

## Code Examples

- [Hello World](/code/6502/hello-world.asm)

## Table of Contents

1. [An Overview of the 6502 Processor](#an-overview-of-the-6502-processor)
1. [Common Instructions Explained](#common-instructions-explained)
1. [Setting Up Your Development Environment](#setting-up-your-development-environment)
1. [Resources](#resources)

## An Overview of the 6502 processor

Assembly languages vary depending on the kind of CPU you're communicating with. Assembly is only one layer above machine code, the language that computers can understand, and that machine code changes depending on the CPU. So certain assembly instructions are only understandable by certain types of CPUs.

The 6502 assembly language is used to program the 6502 processor (can you guess where the assembly language it got its name from?). The 6502 processor is an [8-bit](/guide/writing-code/data.md) processor which means that it deals with data 8 bits at a time. 

### Registers and RAM

The 6502 processor has 6 [registers](/guide/cpu/instruction-cycle.md#fetch), three for general programming use (Register `A`, `X`, and `Y`) and three with specific purposes (program counter, stack pointer, and processor status). We as programmers only have access to registers `A`, `X`, and `Y`, and they can each store one 8-bit number.

We also have access to memory, or [RAM](/guide/cpu/instruction-cycle.md#fetch). Memory addresses are 16 bits long. But, as we mentioned previously, the 6502 processor is an 8-bit processor. Uh oh! What can we do?

Well first, when talking about register data, we must remember that computers only understand numbers, usually represented by [binary digits](/guide/math/number-systems.md#binary). When writing assembly language, we can also use [hex numbers](/guide/math/number-systems.md#hexadecimal), which can be a little easier to read.

This is important because later when you look at code examples, you'll see that data is written with only 2 digit [hex numbers](/guide/math/number-systems.md#hexadecimal) like `$02`.

So, if we want to store anything above 8 bits in a register or in memory, we need to use multiple locations. For example, memory addresses are 16-bits long. If we want to store a memory address, we would store it in two consecutive memory locations (eg. `$0102` and `$0103`). That being said, the program counter is an exception, as it can store 16-bit numbers.

<p align="center">
  <br />
  <img height="300" src="https://cloud-b9atiigzn-hack-club-bot.vercel.app/0img_1977.jpg">
</p>
<br />

For example, a 16-bit value `#$1011` at address `$1000` would be stored like this:

```
Address     Data
$1000       #$10 ;since #$10 is smaller than #$11
$1001       #$11
```

Before we get into the nitty gritty of 6502, here's a few things you should know:

1. When coding in 6502 (and other assembly languages), we're only doing two things: adding data or modifying it.
1. An instruction has two parts: operation and argument. You can think of each as answering the questions "what to do" and "who to do it to". For example with `lda #$00`, `lda` is the operation (also known as **opcode**, remember this!) and `#$00` is the argument. In this case, `lda` means load whatever the argument is to [register](/guide/cpu/instruction-cycle.md#fetch) `A`. So when executed, this instruction will load `#$00` (which is also just 0) in register `A`.
1. Anything starting with `$` like `$00` is in [hexadecimal](/guide/math/number-systems.md#hexadecimal) format
1. Anything prefixed with `#` like `#$00` is a literal number value while others refer to a [memory location in RAM](/guide/cpu/instruction-cycle.md#fetch)


## Common Instructions Explained

The 6502 processor has over 50 instructions that are either arithmetic in nature (plus and minus), logical in nature (comparing for true or false), or move the data. Here are some common ones:

| Instruction | Description                                                                       |
|-------------|-----------------------------------------------------------------------------------|
| LDX         | Adding argument to Register X (LDA would go to Register A and LDY for Register Y) |
| STX *       | Store data at Register X to memory address * (STY for Y and STA for A)            |
| CPX         | Compare argument with data in Register X (CPY for Y and CMP for A)                |
| INC         | Increment argument by 1 (INX and INY increment Register X and Y by 1)             |
| DNC         | Decrement argument by 1 (DNX and DNY decrement Register X and Y by 1)             |
| BNE         | Branch on not equal (zero flag is set at 0)                                       |
| BEQ         | Branch on equal (zero flag is set at 1)                                           |
| JMP *       | Jump to memory address * by setting program counter                               |

Check out the [full instruction set](https://www.masswerk.at/6502/6502_instruction_set.html#BVC)!

Arguments can be a numerical number or a memory address.


The processor status register is a special register that tells the CPU something very specific about the current state. It does this by way of setting flags to either `1` or `0`. For example, when the Z-flag is set to `1`, it indicates that the operation that set the flag produced `0`, which is very important for comparison instructions such as `CMP`.Find out more about flags [here](https://www.nesdev.org/wiki/Status_flags).

## Writing programs
_Before heading into this section, you might be interested in checking out the [guide on writing instructions](https://github.com/hackclub/some-assembly-required/blob/main/guide/writing-code/instructions/mov.md)_

In the section above, I wrote this:
   When coding in 6502 (and other assembly languages), what we're doing is one of two things, adding data or modifying it. So with each instruction you write (like `lda #$00`) you are just changing the data stored.

### Retrieve Data

To do the above, you need to employ [registers](/guide/cpu/instruction-cycle.md#fetch) which you can think of as variables. As mentioned, the 6502 processor only has 3 registers that you (and I) can access: Register A, X, and Y. To access these registers, we can use the instructions LDA, LDX, and LDY, respectively. For example:

```
LDA #$00
```
_Loads the number 0 into Register A_

Here's another example,
```
LDY #$0f
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Loads the number $0f(=15) into Register Y</i>

</details>

### Use/Modify Data
_A small note: Register A is also known as the accumulator so some instructions can only be done with Register A as it is its general purpose._
Being able to load values to registers is no use if you cannot use that data later on (just like how setting a variable would be useless if you don't use that variable later on). A few basic actions include:

**Addition**
```
ADC #$02
```
_Adds the number $02(=2) to the value at Register A. Note: This instruction can only be performed to data in Register A, not Register X or Y._

**Subtraction**
```
SBC #$01
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Subtracts the number $01(=1) from value in Register A. Note: This instruction can only be performed to data in Register A, not Register X or Y.</i>

</details>

**Comparison**
```
CMP #$01
```
_Checks whether the value in Register A is equals to $01(=1). If it is, it sets the Z-flag to one (or true)._

<details>
<summary><i>The comparison instruction also works with Registers X and Y, can you guess how?</i></summary>

<br />
<code>CPX</code> and <code>CPY</code>
</details>

### Adding Data
Once we're done with the data, we want to place it back in the RAM where there is A LOT more space (compared to only 3 registers). We can do this with the store instruction.
```
STA $00
```
_Loads value at Register A to memory location $00(=0)_

An example with Register X:
```
STX $01
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Loads value at Register X to memory location $01(=1)</i>
</details>

   Note: Besides loading numbers into registers, you can also load characters (through [ASCII Numbers](https://github.com/hackclub/some-assembly-required/blob/main/guide/writing-code/data.md)) and pointers to other memory locations through only writing the hex (eg `$02`) without the `#` (which tells the processor it needs to be taken literally).

### Addresses
Speaking of pointing to other locations in memory, in 6502 assembly language, there are a few ways to accomplish this task.

**Absolute Addresses**
This is the most straight forward method: the memory location (which is a 16-bit number) is fully written
```
LDA $0001
```
_Load value at memory location 1 to Register A_

Here's another example:
```
LDY $0010
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Load value at memory location $0010(=16) to Register Y</i>
</details>

**Zero Page Addresses**
When using zero page addresses, the processor assumes that you only want to access the first 256 memory addresses by pre-fixing 00 to the memory address so

```
LDX $01 === LDX $0001
```
_Load value at memory location $0001(=1) to Register X_

Here's another example:
```
LDA $04
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<code>LDA $04 === LDA $0004</code>
<br />
<i>Load value at memory location $0004(=4) to Register A</i>
</details>

**Indirect Addressing**
Here, the addresses include a variable which can change. If this was written in Javascript, it migth look something like this:
```
let x = 1

let a = 0 + x
```
_Here, we set variable x to 1 then set a to the value of 0 plus variable x. a = 1_
(NOTE: NOT SUPER HAPPPY WITH JS EXAMPLE, ANY IDEAS?)

In 6502:
```
LDX #$01

LDA $0000,X
```
_In this instance, we first loaded $01(=1) to Register X then we loaded the value at memory address ($0000 + $01) $0001(=1) to Register A._

In cases like these, we can easily change the value of X (at Register X) so you can also think of the memory address $0000 as the relative base and the value of X as referring to X memory address from the base. So where X = 3, we'll be discussing the location at 3 memory addresses after $0000.

Here's another example,
```
LDX #$04

LDA $0000,X
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Load number $04(=4) to Register X then load value at memory address $0004 ($0000 + $04) to Register A.</i>
</details>

**Indirect Addressing**
Indirect addressing is when you use an absolute address to look up another absolute address. **Whatever number is retrieved at the first address becomes the absolute address used**. Here's an example:

At memory location `$0010` there is the value `#$01` and at memory location `$0011`there is the value `#$02`.
```
STA ($0010)
```
_At the end of the example, we are storing the value at Register A to memory location $0102_

In this instance, we do 2 things:
1. Retrive the data at memory location $0010. However, instead of only retrieving data at memory location $0010, we also want to retrieve data at memory location $0011 (as absolute addresses need 16-bit numbers). Remember the part under [Registers and Ram](#registers-and-ram) where we mentioned using multiple memory locations? So here, we retrieve the number `#$01` and `#$02` to make `#$0102`. (The first part of the address is also the smaller number $01 < $02.)
1. Store value in Register A at this retrieved absolute location, `$0102`

Here's another example:
At memory location `$0040` there is the value `#$03` and at memory location `$0041`there is the value `#$02`.
```
STY ($0040)
```
<details>
<summary><i>What do you think this does?</i></summary>

<br />
<i>Load number value at Register Y to memory address <code>$0203</code>.</i>
<br />
Here, we:
<ul>
<li>Retrieved the values at memory location <code>$0040</code> and <code>$0041</code> to get the values <code>$03</code> and <code>$02</code></li>
<li>Since <code>$02</code> is smaller than <code>$03</code>, we get the number/next memory adddress <code>$0203</code></li>
<li>Load number value at Register Y to memory address <code>$0203</code></li>
</ul>
</details>

**Loops**
_A quick note: a flag, as mentioned above, is a special status register that tells the CPU something very specific about the current state. The z-flag is set by comparison instructions and tells us whether two things are equal (0 = not equal, 1 = equal)_
The ability to set conditions and loops is essential in being able to write programs and in assembly, here's how we can do this in assembly. First, we need to add something that tells us what needs to be looped. This can be indicated by a label.
```
label:
  ...
```
_This is a label. We can think of it similarly as a function._

Next, we need something that can tell us whether to loop the section of the program. This is done in two parts:
1. An instruction that tests a condition and sets a flag. This could be an instruction that compares such as `CPX` mentioned above.
1. An instruction that checks the status of a flag and calls the label. Check out the [full instruction set](https://www.masswerk.at/6502/6502_instruction_set.html#BVC)

In Javascript, a while loop that addings to variable x until it reaches 3 would look like this:
```
let x = 1

while(x < 3) {
  x = x + 1
}
```
_At the end of this program, the value of x is 3_
```
LDX #$01

equalthree:
  INX
  CPX #$03
  BNE equalthree
  BRK
```
_At the end of this program, the value at Register X is 3_

Let's break this down:
1. `LDX #$01`: We load the number $01(=1) to Register X
1. `INX`: We increment value in Register X by 1 (here value at Register X is `#$02`)
1. `CPX #$03`: We compare value in Register X to `#$03` and it fails so the z-flag is set at 0
1. `BNE equalthree`: We check if the z-flag is 0 and since it is still 0, we execute the `equalthree` label (`BNE` = Branch on Not Equal, execute label if values not equal). The next line `BRK` (Break) is not called as we loop back to the label `equalthree`.
1. `INX`: We increment value of Register X by 1 (here value at Register X is `#$03`)
1. `CPX #$03`: We compare value in Register X to `#$03` and it is true so the z-flag is set at 1
1. `BNE equalthree`: We check if the z-flag is 0 and since it is now one, we DO NOT execute the `equalthree` label
1. `BRK`: the program ends

Here's another example:
```
LDX #$04

equaltwo:
  DEX
  CPX #$02
  BNE equaltwo
  BRK
```
<details>
<summary><i>What will be the value at Register X after the program breaks? And can you walk through each step to show how you got there?</i></summary>

<br />
Here, we:
<ul>
<li><code>LDX #$04</code>: We load the number $04(=4) to Register X</li>
<li><code>DEX</code>: We decrement value in Register X by 1 (here value at Register X is 3)</li>
<li><code>CPX #$02</code>: We compare value in Register X to <code>#$02</code> and it fails so the z-flag is set at 0</li>
<li><code>BNE equaltwo</code>: We check if the z-flag is 0 and since it is still 0, we execute the <code>equaltwo</code> label</li>
<li><code>DEX</code>: We decrement value in Register X by 1 (here value at Register X is 2)</li>
<li><code>CPX #$02</code>: We compare value in Register X to <code>#$02</code> and it is true so the z-flag is set at 1</li>
<li><code>BNE equaltwo</code>: We check if the z-flag is 0 and since it is now 1, we DO NOT execute the <code>equaltwo</code> label and we move to the next line</li>
<li><code>BRK</code>: The program ends</li>
</ul>
</details>

Are you up for a challenge? Try writing your own loop [here](https://bellesea.github.io/6502js/).
   Tip: Once you write your program, click Assemble and Run. Then, hit Reset, then check the Debugger checkbox to start the debugger. Click Step once and keep your eye on the Debugger box to see what changes as you run through the program.

## Setting Up Your Development Environment

Since languages such as Python and C allow us to do virtually the same thing in less time, people rarely code in Assembly beyond "why not?" so you most likely do not have an assembler or an actual computer with 6502 processor. However, fret not as [@Esshahn](https://github.com/Esshahn) open-sourced an easy to set up template to start coding in 6502, check it out [here](https://github.com/Esshahn/acme-assembly-vscode-template). The rest of this section is a summarised version of the instructions but if you're curious about the reasons behind each step, check out the [repository](https://github.com/Esshahn/acme-assembly-vscode-template).

Firstly, this setup requires that you code with [Visual Studio Code](https://code.visualstudio.com/) so you will need to [download VSCode](https://code.visualstudio.com/download).

Next, you need to dowload the [Acme Cross Assembled (C64) Extension](https://marketplace.visualstudio.com/items?itemName=TonyLandi.acmecrossassembler). This extension handles the assembly work of turning our assembly code into machine code that the machine can understand.

Check out the section on [Communicating With the CPU](/guide/cpu/communicating.md) if you're not sure what this means.

We also need a processor that actually understands the instructions given. We can get this by downloading [Vice](https://vice-emu.sourceforge.io/index.html#download), an emulator which is basically a program that runs the way computers using the 6502 processor runs. Download the file that suits your computer (eg. I run on an Apple Silicon Mac so I chose the file under `Apple Silicon Mac (macOS 11.0+)`). After downloading, if you're on a Mac, you want to drag the folder into your applications folder. On other OS's, you might want to move the folder to the equivalent of an applications folder like tools in Windows.

<p align="center">
  <br />
  <video width="460" height="300" src="https://cloud-mot0vtomh-hack-club-bot.vercel.app/0screen_recording_2022-06-03_at_4.39.49_pm.mp4">
  <br />
</p>
<br />

Now, we need to download the git repository template here: https://github.com/Esshahn/acme-assembly-vscode-template. You can also directly downlod the file [here](https://github.com/Esshahn/acme-assembly-vscode-template/archive/refs/heads/master.zip).

<p align="center">
  <br />
  <img width="460" height="300" src="https://cloud-2412fkzyb-hack-club-bot.vercel.app/0screenshot_2022-06-03_at_5.11.29_pm.png">
  <br />
  <span>
    <em>
      A screenshot of where to download the repository
    </em>
  </span>
</p>
<br />

This file contains the binaries needed to assemble the language to machine code (check out the section on [Communicating With the CPU](/guide/cpu/communicating.md)) and also a `tasks.json` file which allows you to complete actions with VSCode, allowing you to send files to the VICE emulator.

Before we start assembling our program, we have one _extremely important_ step! In the `tasks.json` file, there are different tasks for different emulators that you can download.

```
{
  "label": "...",
  ...
}
```

Each of the code blocks above is one build task for an emulator (Vice has different options). Since we're coding in 6502, we'll pick C64 which we can call with the second task:

```
{
  "label": "build -> C64 -> Pucrunch -> VICE",
  "type": "shell",
  "osx": {
    "command": "bin/mac/acme -f cbm -l build/labels -o build/main.prg code/main.asm && bin/mac/pucrunch build/main.prg build/main.prg && /Applications/Vice/x64.app/Contents/MacOS/x64 -moncommands build/labels build/main.prg 2> /dev/null",
  },
  "windows": {
    "command": "bin\\win\\acme -f cbm -l build/labels -o build/main.prg code/main.asm && bin\\win\\pucrunch build/main.prg build/main.prg && C:/tools/vice/x64.exe -moncommands build/labels build/main.prg",
  },
  "linux": {
     "command": "bin/linux/acme -f cbm -l build/labels -o build/main.prg code/main.asm && bin/linux/pucrunch build/main.prg build/main.prg && x64 -moncommands build/labels build/main.prg 2> /dev/null"
  },
  "group": "build",
    "presentation": {
    "clear": true
  },
  "problemMatcher": {
    "owner": "acme",
    "fileLocation": ["relative", "${workspaceFolder}"],
    "pattern": {
      "regexp": "^(Error - File\\s+(.*), line (\\d+) (\\(Zone .*\\))?:\\s+(.*))$",
      "file": 2,
      "location": 3,
      "message": 1
    }
  }
},
```

Depending on which operating system you use, a different line of code applies to you. Eg. if you use Mac, you only need to look at ` "osx": {...}`. Within that, on the line with `"command":`, there is a small section that tells VS Code where your Vice Emulator is.

If you use a Mac, you need to swap out `/Applications/Vice/x64.app/Contents/MacOS/x64` with the actual file path to where you stored your Vice so in this case it was in the Applications folder. _DO NOT REMOVE `Contents/MacOS/x64`._ You want to use x64sc so if you did indeed store your file in the Applications folder, your path should be `/Applications/{folderName}/x64sc.app/Contents/MacOS/x64sc` where `{folderName}`is the name of your folder, eg. `vice-x86-64-gtk3-3.6.1`.

If you use Windows, you need to swap out `C:/tools/vice/x64.exe` with the actual file path so if you stored it under tools, your file path should be `C:/tools/{foldername}/x64sc.exe`. (TODO ✅: Would someone with Window be willing to test this out and see if it works?)

Finally the part where you code (yay!). You want to add your code to `code/main.asm`.

When you're done, to assemble the code, _Press SHIFT + COMMAND + B (On Windows, it's SHIFT + CNTRL + B)_. If you're prompted by VSCode to select build task to run, pick `build -> C64 -> Pucrunch -> VICE`. It should open the VICE Emulator and look something like this:

<p align="center">
  <br />
  <img width="460" height="300" src="https://user-images.githubusercontent.com/434355/50896184-972b4500-1408-11e9-9782-196184d6cd45.jpg">
  <br />
  <span>
    <em>
      A screenshot of VICE Emulator
    </em>
  </span>
</p>
<br />

   Note: If it doesn't open the VICE Emulator but you don't see any errors in the terminal, open the build/main.prg (the binary executable) file directly with VICE. [On Mac](https://cloud-411nkqhe8-hack-club-bot.vercel.app/0screenshot_2022-06-03_at_6.38.19_pm.png), you can do this by opening the file in terminal and right click to select open with > x64sc. (TODO ✅: add how someone would do this in windows)

   On Errors: If you see a `failed to launch (exit code: 126)` in the terminal, you might have missed `/Contents/MacOS/x64sc` and if you see `failed to launch (exit code: 127)` in the terminal, you're not pointing to the correct file location where your VICE Emulator is.

###### Number Systems

In response to the question above, the reason why it's only 2 digits is because a two digit hexadecial number can count up to 16\*16 (256), which is the same as an 8 digit binary number which can count up to 2\*\*8 (256). This is also known as a byte. Learn more about Number Systems [here](/guide/math/number-systems.md)

## Resources

_Links that I found helpful when learning this_
6502 Overview
- https://skilldrick.github.io/easy6502/ (easy to learn guide)
- https://www.youtube.com/watch?v=yEiNs7pKNh8 (source for the introduction section)
- https://en.wikibooks.org/wiki/6502_Assembly
- https://www.masswerk.at/6502/6502_instruction_set.htm (instruction set)
- https://codeburst.io/an-introduction-to-6502-assembly-and-low-level-programming-7c11fa6b9cb9


Other Code Examples
- http://6502.org/source/