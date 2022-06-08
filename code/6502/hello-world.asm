;==========================================================
; Base Code from https://github.com/Esshahn/acme-assembly-vscode-template, created 2019 by Ingo Hinterding // awsm of Mayday (http://www.awsm.de)
;==========================================================

;==========================================================
; BASIC header ;COMMENT: ANYONE KNOW WHAT THIS DOES? I ASSUME ITS SOME SORT OF DEFAULT SETTING FOR THE PROCESSOR? IDK HAHA
;==========================================================

* = $0801
    !byte $0b, $08
    !byte $E3 ; BASIC line number:  $E2=2018 $E3=2019 etc
    !byte $07, $9E
    !byte '0' + entry % 10000 / 1000
    !byte '0' + entry %  1000 /  100
    !byte '0' + entry %   100 /   10
    !byte '0' + entry %    10
    !byte $00, $00, $00

;==========================================================
; CODE
;==========================================================

; These are labels which can be referred to later on if needed.
; Think of them as a functions that can be called.
entry
    ;; ldy = load y
    ;
    ; Load $0b into register Y
    ; $0b is hex for the number 11
    ; "hello world!" has 12 characters, and since arrays are 0 indexed,
    ; the last character has index 11
    ;
    ; Register Y will serve as the index register
    ldy #$0b

character_loop
    ;; lda = load a
    ;
    ; Labels, underneath, point to a memory address of where code lives
    ; We are setting register a to the memory address of print_str + y
    ; The memory address of print_str + y points to the ASCII code of
    ; the character at index y
    ;
    ; Load a character from print_str at an index
    ; Our print_str string is "hello world!"
    ; The current index is in Register Y
    ; Register Y starts out as 12
    lda print_str, y

    ;; sta = store a

    ; Store data from register A to memory location $0400 + number
    ; $0400 + y = the data from register A
    ;
    ; Eg. when y is 2
    ; and Register A has ascii code for the character "e"
    ; $0400, 2 = $0402
    ;
    ; We'll load the ASCII code to memory location $0402
    ; $0400 is the start of where screen RAM is saved in memory
    ; That's where 6502 looks for things to print on the screen

    ; The screen size is 24 * 40
    ; 24 rows, 40 columns
    ; Use this information to place our string below the
    ; printed startup info on the emulator screen
    sta $0400 + 16 * 40, y

    ;; dey = decrement y
    ;
    ; Decrement Y (our index) by 1
    ; Eg. if y was 2, it is now 1
    dey

    ;; bpl = branch on plus
    ;
    ; After most instructions that have a value result, the negative flag
    ; is set
    ;
    ; So, since our previous instruction was dey and had a value result, the negative flag
    ; was set
    ;
    ; bpl checks that flag. If y is positive, then it will jump back to the label character_loop
    ; If not, it will continue the program

    ; As y decrements with each cycle, the cycle will end when y is less than 0
    bpl character_loop

    ;; rts = return from subroutine
    ; Exits the program
    rts

; This label gets called by character_loop
print_str
    ; !scr is an assembler directive, not an instruction
    ; It converts ASCII text to ASCII codes
    !scr "hello world!"
