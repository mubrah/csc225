; Evan Zhang
; 1/29/2018
; pigLatin.asm

; This program translates english words to pig-latin words.


        .ORIG       x3000
BEGIN    LEA        R0, ASK
         LEA        R1, WORD
         PUTS
LOOP     GETC
         OUT
         STR        R0, R1, #0
         ADD        R1, R1, #1
         ADD        R0, R0, #-10
         Brnp       LOOP
         LEA        R0, TRANSLATE
         PUTS
         LEA        R1, WORD
PRINT    ADD        R1, R1, #1
         LDR        R0, R1, #0
         OUT
         ADD        R2, R1, #1
         LDR        R0, R2, #0
         ADD        R0, R0, #-10
         Brnp       PRINT
         LEA        R3, WORD
         LDR        R0, R3, #0
         OUT
         LEA        R0, ENDING
         PUTS
         ADD        R1, R1, #1
         LDR        R0, R1, #0
         OUT
         BRp        BEGIN        



ASK         .STRINGZ    "English Word: "
TRANSLATE   .STRINGZ    "Pig-Latin Word: "
ENDING      .STRINGZ    "ay"

WORD        .BLKW       #20

.END
