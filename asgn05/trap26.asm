; Evan Zhang
; trap26.asm
; Description: 
;       1. Save PC from UP1 in x32FF
;       2. Turn on interrupt enable bit KBSR
;       3. JMP UP2


        .ORIG     x3300
         STI      R7, PC_SAVE     ; Load PC into x32FF
         LD	  R0, KBSRIE      ; enable keyboard interrupts
	 STI	  R0, KBSR
         LD       R1, UP2
         JMP      R1
         
         
                  
PC_SAVE .FILL     x32FF
KBSR	.FILL	  xFE00	        ; keyboard status register
KBSRIE  .FILL	  x4000         ; bit 14 is interrupt enable bit
UP2     .FILL     x3400
        .END
