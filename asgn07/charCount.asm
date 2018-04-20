; Evan Zhang
; CHAR_COUNT FUNCTION
;

; *************** CHAR_COUNT SETUP *****************************

        .orig x3300
        LDR     R0, R6, #0      ; R0 -  &word[0]
        LDR     R2, R0, #0
        ADD	R6, R6, #1      ; pop stack
        LDR     R1, R6, #0      ; R1 -  search
        ADD	R6, R6, #1      ; pop stack
        ADD     R6, R6, #-1     ; push to stack
        STR     R7, R6, #0
	
; *************** CHAR_COUNT CODE *****************************
;   if (*str == 0)

        ADD R0, R0, #0      ; compare word and #0
        Brnp ELSE

;      result = 0;
        LDR     R7, R6, #0      ; Return
        ADD     R6, R6, #1      ; pop stack
        ADD	R6, R6, #-1     ; push to stack
        STR     R0, R6, #0
        ADD	R6, R6, #-1     ; push to stack
        STR     R1, R6, #0
        ADD	R6, R6, #-1     ; push to stack
        STR     R0, R0, #0
        RET
        
;   else { 
;       if (*str == c)
ELSE    NOT R2, R2          ; invert R1
        ADD R2, R2, R1      ; add the two values
        BRnp ZERO
        


;      result = 1;
       AND R2, R2, #0
       ADD R2, R2, #1
       BRNZP RES         


;      else
;         result = 0;
ZERO   AND R2,R2, #0
    

;      result += charCount(str+1, c);


RES     LDR     R7, R6, #0      ; Return
        ADD     R6, R6, #1      ; pop stack
        LDR     R3, R6, #0
        ADD     R2, R3, R2
        STR     R2, R6, #0
        ADD     R6, R6, #-1     ; push to stack
        STR     R1, R6, #0
        ADD     R6, R6, #-1     ; push to stack
        STR     R0, R0, #0
        RET

        LD      R0, CHAR_COUNT
        JSRR    R0




; *************** CHAR_COUNT RETURN *****************************

	; return result
    
        RET

CHAR_COUNT .FILL   x3300
ISrunning  .STRINGZ "is this working at all"
	.END
