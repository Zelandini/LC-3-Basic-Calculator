; CS210 Assignment 1
; Name: Zelandini Borromeu Guterres
; UPI: zgut060

        .ORIG x3000

        ; Load x30 (offset for converting numbers to ASCII) to R5
        LD R5, ZERO

        ; Load x-30 (offset for converting ASCII to numbers) to R6
        NOT R6, R5
        ADD R6, R6, #1

        ; Get first operand
START   LEA R0, PROMPT1
        PUTS
        GETC
        ADD R0, R0, #-10    ; Check for new line (STOP)
        BRz STOP
        ADD R0, R0, #10
        OUT

        ; Save first operand to R1
        AND R1, R1, #0
        ADD R1, R1, R0
        ADD R1, R1, R6

        ; Print new line
        LD R0, NEWLINE
        OUT

        ; Get operation index
        LEA R0, PROMPT2
        PUTS
        GETC
        ADD R0, R0, #-10    ; Check for new line (STOP)
        BRz STOP
        ADD R0, R0, #10
        OUT

        ; Save operation index to R2
        AND R2, R2, #0
        ADD R2, R2, R0
        ADD R2, R2, R6

        ; Print new line
        LD R0, NEWLINE
        OUT

        ; Get second operand
        LEA R0, PROMPT3
        PUTS
        GETC
        ADD R0, R0, #-10    ; Check for new line (STOP)
        BRz STOP
        ADD R0, R0, #10
        OUT

        ; Save operation index to R3
        AND R3, R3, #0
        ADD R3, R3, R0
        ADD R3, R3, R6

        ; Print new line
        LD R0, NEWLINE
        OUT

        ; Print final line (without result)
        AND R0, R0, #0  ; Print first operand
        ADD R0, R0, R1
        ADD R0, R0, R5
        OUT
        LD R0, SPACE   ; SPACE
        OUT
        AND R0, R0, #0  ; Save operation index to R0
        ADD R0, R0, R2
        ADD R0, R0, #-1 ; Print appropriate operation symbol
        BRz P_PLUS
        ADD R0, R0, #-1
        BRz P_MINUS
        ADD R0, R0, #-1
        BRz P_TIMES
        ADD R0, R0, #-1
        BRz P_DIV
        ADD R0, R0, #-1
        BRz P_MOD
P_PLUS  LD R0, PLUS
        BRnzp NEXT
P_MINUS LD R0, MINUS
        BRnzp NEXT
P_TIMES LD R0, TIMES
        BRnzp NEXT
P_DIV   LD R0, DIV
        BRnzp NEXT
P_MOD   LD R0, MOD
        BRnzp NEXT
NEXT    OUT
        LD R0, SPACE    ; SPACE
        OUT
        AND R0, R0, #0  ; Print second operand
        ADD R0, R0, R3
        ADD R0, R0, R5
        OUT
        LD R0, SPACE    ; SPACE
        OUT
        LD R0, EQUAL    ; EQUAL
        OUT
        LD R0, SPACE    ; SPACE
        OUT

        ; Branch to the appropriate operation function
SELECT  AND R0, R0, #0  
        ADD R0, R0, R2

        ADD R0, R0, #-1
        BRz F_PLUS

        ADD R0, R0, #-1
        BRz F_MINUS

        ADD R0, R0, #-1
        BRz F_TIMES

        ADD R0, R0, #-1
        BRz F_DIV

        ADD R0, R0, #-1
        BRz F_MOD


	; Plus function (R1 + R3 → R4)
F_PLUS  ADD R4, R1, R3  ; Already completed
        BRnzp P_RES

	; Minus function (R1 - R3 → R4)
F_MINUS NOT R3, R3      ; Completed
        ADD R3, R3, #1
        ADD R4, R1, R3
        BRn P_OFF
        BRnzp P_RES     

	; Times function (R1 * R3 → R4)
F_TIMES AND R4, R4, #0  ; Completed

        ADD R1, R1, #0
        BRz P_RES
                         ;Check if either register are 0
        ADD R3, R3, #0
        BRz P_RES

MUL_JMP ADD R4, R4, R1
        ADD R3, R3, #-1
        BRp MUL_JMP

        AND R1, R1, #0
        ADD R1, R4, #-10
        BRzp P_OFF       ; Check if the number is greater than 10

        BRnzp P_RES  

	; Floor divide function (R1 / R3 → R4)
F_DIV   AND R4, R4, #0  ; Completed

        NOT R3, R3
        ADD R3, R3, #1
        ADD R1, R1, #0
        BRz P_RES

DIV_JMP ADD R1, R1, R3
        BRn P_RES
        ADD R4, R4, #1
        BRp DIV_JMP
        BRn P_RES

	; Modulus function (R1 % R3 → R4)
F_MOD   AND R4, R4, #0  ; Completed

        NOT R3, R3
        ADD R3, R3, #1
        ADD R4, R1, #0

MOD_JMP ADD R1, R1, R3
        BRn P_RES
        ADD R4, R1, #0
        BRzp MOD_JMP


	; Print result from R4 (load appropriate ASCII to R0 or print "OUT OF BOUNDS")
P_RES   LD R0, ZERO
        ADD R0, R0, R4

        ADD R4, R4, #-9
        BRnz OUTPUT
        BRnzp P_OFF

OUTPUT  OUT
        BRnzp RESTART


        ; Print "OUT OF BOUNDS"
P_OFF   LEA R0, OFF
        PUTS
        BRnzp RESTART


RESTART LD R0, NEWLINE
        OUT
        OUT
        BRnzp START

STOP    HALT

PROMPT1 .STRINGZ "Enter the first operand: "
PROMPT2 .STRINGZ "Enter the operation index: "
PROMPT3 .STRINGZ "Enter the second operand: "
OFF     .STRINGZ "OUT OF BOUNDS"
ZERO    .FILL x30   ; 0
SPACE   .FILL x20   ; _
NEWLINE .FILL x0A   ; \n
PLUS    .FILL x2B   ; +
MINUS   .FILL x2D   ; -
TIMES   .FILL x2A   ; *
DIV     .FILL x2F   ; /
MOD     .FILL x25   ; %
EQUAL   .FILL x3D   ; =
        .END
