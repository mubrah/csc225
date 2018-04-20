; Evan Zhang
; CSC 225
; UP2.asm
; Description: Displays an endless loop of astericks.

        .ORIG    x3400
         LD      R0, STAR     ; asterisk to R0
RESET    AND     R2, R2, #0   ; Clear R2
LOOP     ADD     R2, R2, #1   ; Increment R2
         BRzp    LOOP
         TRAP	 x21          ; print char to screen
         BRzp    RESET


STAR    .FILL    x2A
        .END
