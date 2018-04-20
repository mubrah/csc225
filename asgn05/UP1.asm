; Evan Zhang
; CSC 225
; UP1.asm
; Description: Echoes 5 characters to screen
       
       
       .ORIG	x3000
       
        LD      R1, STAT_26     ; Load address of Trap
        STI     R1, TRAP_26     ; Load Trap address to x0026 
        LD      R1, ISR         ; Load address of Trap
        STI     R1, INTERUP     ; Load isr to x0180
        LD      R6, STACK       ; Initialize stack pointer

LOOP	    TRAP	x26  ; get char
	    TRAP	x21  ; print char to screen
	    TRAP	x26  ; get char
	    TRAP	x21  ; print char to screen
            TRAP	x26  ; get char
	    TRAP	x21  ; print char to screen
	    TRAP	x26  ; get char
	    TRAP	x21  ; print char to screen
	    TRAP	x26  ; get char
	    TRAP	x21  ; print char to screen
	    LEA	    R0, END_MSG
	    PUTS
	    BRnzp   LOOP

END_MSG .STRINGZ "\nSuccess!  Running again...\n"
TRAP_26 .FILL   x0026
INTERUP .FILL   x0180
STAT_26 .FILL   x3300
ISR     .FILL   x3500
STACK   .FILL   x3000
        .END
