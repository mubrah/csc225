; Evan Zhang
; CSC 225
; isr.asm
; Description: 
;        1. Gets Character from KBDR
;           a. It does not need to poll because 
;              the only way the program ends up 
;              at ISR is because of a character trigger.
;        2. Clear KBSR
;        3. Return to UP1


        .ORIG     x3500
         LDI      R0, KBDR        ; reset interrupt (by reading KBDR)
         LD	  R1, CLEAR       ; enable keyboard interrupts
	 STI	  R1, KBSR 
         LDI      R7, PC_SAVE     
         STR      R7, R6, #0 
         RTI
         
         

PC_SAVE .FILL     x32FF         
KBSRIE  .FILL	  x4000         ; bit 14 is interrupt enable bit         
KBDR	.FILL	  xFE02         ; keyboard data register
KBSR	.FILL	  xFE00	        ; keyboard status register
CLEAR   .FILL	  x0000         ; clear
BEGIN   .FILL     x3000
        .END
