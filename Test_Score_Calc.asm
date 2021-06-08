;CIS 11 Assembly Programming
;Final Project: Test Score Calculator
;Jose Morales, Victor Guiterrez, Luis Garibay



.ORIG x3000

	LD R2, TOTAL
	
	AND R3, R3, #0			; CLEAR R3
	ADD R3, R3, #5			; R3 = 5, LOOP COUNTER
GETSCORES
	LD	R4, HEXNUM
	LEA	R0, PROMPT		; stores prompt to R0
	PUTS				; prints prompt
	GETC				; obtains user charatcer
	OUT				; displays user input
	ADD R0, R0, R4
	JSR MULT10			; multiplies user's input subroutine
; SECOND INPUT
	AND R0, R0, #0			; CLEAR R0
	GETC				; gets second input
	OUT				; displays user input
	ADD R0, R0, R4			; ASCCI THING 
	ADD R6, R6, R0			; USER INPUT COMPLETE VALUE

	ADD R2, R2, R6			; ADDS ALL TESTS SCORES
	
	
	ST R2, TOTAL			; STORES R6 VALUE TO (TOTAL)
	ADD R3, R3, #-1			; SUBTRACT 1 FROM R3 UNTIL ZERO
	BRp GETSCORES			; LOOP INTO GETSCORES IF R3 IS STILL POS	


	LEA R0, ENDPROMPT
	PUTS

	HALT

;----------------------MULTIPLY SUB------------------
MULT10	ADD R1, R0, #0		; COPY R0 TO R1
	NOT R1, R1		; INVERT FOR COUNTER
	ADD R1, R1, #1		; COUNTER R1
	AND R0, R0, #0		; CLEAR R0
LOOP10	ADD R0, R0, #10		; ADD 10 TO R0
	ADD R1, R1, #1		; ADD 1 UNTIL ZERO
	BRn LOOP10
	ADD R6, R0, #0		; R0 CARRIES VALUES NOW
	RET
;----------------------END OF MULT10-----------------

;-----------------------DATA-----------------------------
PROMPT	.STRINGZ "\nEnter a test score: "
ENDPROMPT	.STRINGZ "\n\nThank you for using the program.\n"


HEXNUM	.FILL XFFD0		; -48
TOTAL	.FILL X0
;-------------------------------------------------------

.END
