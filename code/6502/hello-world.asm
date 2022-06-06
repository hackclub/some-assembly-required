;==========================================================
; Base Code from https://github.com/Esshahn/acme-assembly-vscode-template, created 2019 by Ingo Hinterding // awsm of Mayday (http://www.awsm.de)
;==========================================================

;==========================================================
; BASIC header ;COMMENT: ANYONE KNOW WHAT THIS DOES? I ASSUME ITS SOME SORT OF DEFAULT SETTING FOR THE PROCESSOR? IDK HAHA
;==========================================================

* = $0801

    !byte $0b, $08
    !byte $E3                     ; BASIC line number:  $E2=2018 $E3=2019 etc
    !byte $07, $9E
    !byte '0' + entry % 10000 / 1000
    !byte '0' + entry %  1000 /  100
    !byte '0' + entry %   100 /   10
    !byte '0' + entry %    10
    !byte $00, $00, $00           ; end of basic


;==========================================================
; CODE
;==========================================================

entry ;this is a label named 'entry' which can be referred to later on if needed. think of it as a function that can be called.

    lda #$00                ; load 0 into register a
    ldy #$0d                ; load $0b (as "hello world!" has 12 characters) into register y (register y will serve as index register, if you're not sure what this means, check out the README file in this folder)

character_loop ; this is also a label

    lda hello,y             ; load character number y of the string in label hello (hello world!) eg. when y is 12, load character "!"
    sta $0400,y             ; save data in register a to memory location $0400,y (= $0400 + y). Eg. when y is 12 (and register a has the character "!"), $0400,12(d)= $040, we'll load character "!" to memory location $040d
    dey                     ; decrement y by 1 (if y was 12, it is now 11)
    bpl character_loop      ; is y positive? if yes, then repeat by jumping back to label character_loop. as y decrements with each cycle (due to instruction in line 56), the cycle wil end when y is less than 0 and it will run the next line
    rts                     ; exit the program

hello      !scr "hello world!"     ; the label "hello" which contains the string we want to print
