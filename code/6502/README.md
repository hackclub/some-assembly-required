# 6502

If you're interested, it might be worth going through the [guide](/guide/introduction.md) first before exploring assembly code as it can make it easier to grasp concepts although I'll try my best to explain as we go along. The 6502 developed by MOS Technology (and its predecessor) powered a number of computers like the Apple 2 and Nintendo Entertainment System (NES) and it was released significantly cheaper than its competitors (back in 1975) and has helped drive the computer evolution. Although you don't nede to learn 6502 to code, it is pretty cool to see what happens "under the hood" and if you want to, you can write even games for the [NES](https://en.wikipedia.org/wiki/Super_Nintendo_Entertainment_System)!

  I highly recommend taking some time to go through the [Easy 6502 Guide](https://skilldrick.github.io/easy6502/) by [@Skilldrick](https://twitter.com/skilldrick). It took me about 6 hours to complete it as I tried all the exercises and spent time to make sure I was comfortable but you can definitely go through it in less time.

## Code Examples

- [Hello World](/code/6502/hello-world.asm)

## Table of Contents

1. [An Overview of the 6502 Processor](#an-overview-of-the-6502-processor)
1. [Common Instructions Explained](#common-instructions-explained)
1. [Setting Up Your Development Environment](#setting-up-your-development-environment)
1. [Resources](#resources)

## An Overview of the 6502 processor

Most assembly languages are unique to each kind of cpu as they are only one layer above machine code (which computers can understand) so instructions that it gives are only understandable by certain types of CPU. Hence, 6502 assembly language is used to program the 6502 processor (can you guess where the assembly language it got its name from?). The 6502 processor is an 8-bit-processor which means that it deals with data that are 8-bit numbers (see the section on binary number [here](/guide/math/number-systems.md#binary)). It can still process larger numbers but just does it 8-bit at a time. Eventhough a computer only understands [binary digits](/guide/math/number-systems.md#binary), when writing assembly language, we can use [hex numbers](/guide/math/number-systems.md#hexadecimal) which are a little easier to read. This is important because later when you look at code examples, you'll see that data is written with only 2 digit [hex numbers](/guide/math/number-systems.md#hexadecimal) like `$02`. Can you guess why it's only 2 digits? (hint: a binary number is base2 while a hexadecimal number is base16, answer [here](#number-systems))

### Registers and RAM

The 6502 processor has 6 [registers](/guide/cpu/instruction-cycle.md#fetch) (memory locations in the processor itself), three for general programming use (Register A, X, and Y) and three with specific purposes (program counter, stack pointer, and processor status). You (programmer) only have access to registers A, X, and Y and they can each only store one 8-bit number.

Hence, we also have another source of memory: Random Access Memory (RAM). Data in the [RAM](/guide/cpu/instruction-cycle.md#fetch) can be accessed through 16-bit numbers called addresses. The 6502 processor is an 8-bit processor which means that all data is stored in 8-bits. However, the addresses are 16-bit numbers which means that when we need to store data that points to another memory address, it is stored in two consecutive memory locations (eg. `$0102` and `$0103`) with the lower byte value stored first (since data is represented by numbers, it can be ordered and compared in terms of size). For example, a 16-bit value `#$1011` at address `$1000` would be stored like this:

```
Address     Data
$1000       #$10 ;since #$10 is smaller than #$11
$1001       #$11
```

(TODO ✅: Figure out how to explain this part w/o being confusing)

Before we get into the nitty gritty of 6502, here's a few things you should know:

1. When coding in 6502 (and other assembly languages), what we're doing is one of two things, adding data or modifying it. So with each instruction you write (like `lda #$00`) you are just changing the data stored.
2. An instruction has two parts (operation and argument) which you can think of as answering the questions "what to do" and "who to do it to". For example with `lda #$00`, `lda` is the operation (also known as opcode, remember this!) and `#$00` is the argument. In this case, `lda` means load whatever the argument is to [register](/guide/cpu/instruction-cycle.md#fetch) a. So when executed, this instruction will load `#$00` (which is also just 0) in register a.
3. Anything starting with `$` like `$00` is in [hexadecimal](/guide/math/number-systems.md#hexadecimal) format
4. Anything prefixed with `#` like `#$00` is a literal number value while others refer to a [memory location in RAM](/guide/cpu/instruction-cycle.md#fetch)

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

     arguments can be a direct number or a memory address (in which case cpu would fetch data in that memory address until there's a direct number)

Check out the [full instruction set](https://www.masswerk.at/6502/6502_instruction_set.html#BVC)!

Further, the processor status is a collection of flags, which you can think of as a special status register that tells the CPU something very specific about the current state. For example, when the Z-flag is set to one, it indicates that the operation produced zero, which is very important for comparison instructions such as `CMP`.Find out more about flags [here](https://www.nesdev.org/wiki/Status_flags).

## Writing programs
(TODO ✅: Show loading data to register and adding to memory)

(TODO ✅: Talk about how addressing works + explain indirect, indexed indirect, and indirect indexed)

(TODO ✅: Talk about how loops work)

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