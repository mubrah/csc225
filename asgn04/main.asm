;
;  Interrupt Driven Keyboard program
;    Read and echo an endless string
;	KEYBOARD INTERRUPT VECTOR: x180
;       KBSR INTERRUPT ENABLE BIT: 15
;
	.ORIG	x4000
BEGIN	LEA	R6, BEGIN   ; initialize stack pointer to x4000
                            ;   builds downward
                            ; Note: Should start stk high in memory
                            ;       Not like shown here.
        LEA     R0, PROMPT  ; print prompt
	PUTS
	LD      R0, NL
	OUT
;      
	LEA	R0, ISR     ; load keyboard interrupt vector: x80
	STI	R0, KBIV    ;   (location 180)
	LD	R0, KBSRIE  ; enable keyboard interrupts
	STI	R0, KBSR
;
LOOP	BRNZP   LOOP	    ; loop forever !
	HALT
;
; keyboard interrupt service routine:
;
ISR	ADD	R6, R6, #-1 ; increment stack pointer
	STR	R0, R6, #0  ; push R0, because we'll use it
	LDI	R0, KBDR    ; reset interrupt (by reading KBDR)
	OUT
	LDR	R0, R6, #0  ; restore R0
	ADD	R6, R6, #1	
	RTI
;
; data
;
PROMPT  .STRINGZ "Input character string: "
NL	.FILL   x0A	    ; new line
;
KBSR	.FILL	xFE00	    ; keyboard status register
KBSRIE  .FILL	x4000	    ;    bit 14 is interrupt enable bit
KBDR	.FILL	xFE02       ; keyboard data register
KBIV	.FILL	x180	    ; keyboard interrupt vector
;
	.END
