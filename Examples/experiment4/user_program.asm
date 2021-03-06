.ORIG X3000

;
;INITIALISATION
;
INIT	LD	R6, SP		;INITIALIZE THE STACK POINTER
	AND	R1, R1, #0	;INITIATE R1 TO 0

;
;SET UP THE KEYBOARD INTERRUPT VECTOR TABLE ENTRY
;
INT	LD	R2, INTV	;
	STI	R2, INTVT	;

;
;ENABLE KEYBOARD INTERRUPT
;
	LDI	R0, KBSR	;USE OR X4000 TO CHANGE BIT 14 TO 1
	NOT	R0, R0		;
	LD	R2, CONVERT	;
	NOT	R2, R2		;
	AND	R2, R2, R0	;
	NOT	R2, R2		;
	STI	R2, KBSR	;
	

;
;START OF ACTUAL USER PROGRAM TO PRINT CHECKERBOARD
;
LOOP	ADD	R1, R1, #0	;CHECK WHICH BOARD TURN
	BRp	LOOP2		;
	LEA	R0, CK1		;**CHECKBOARD
	PUTS			;
	LD	R0, NL		;
	OUT			;
	JSR	DELAY		;

	ADD	R1, R1, #0	;CHECK WHICH BOARD TURN
	BRp	LOOP2		;
	LEA	R0, CK2		;
	PUTS			;
	LD	R0, NL		;
	OUT			;
	JSR	DELAY		;
	BRnzp	LOOP		;

LOOP2	ADD	R1, R1, #0	;CHECK WHICH BOARD TURN
	BRz	LOOP		;
	LEA	R0, CK3		;##CHECKBOARD
	PUTS			;
	LD	R0, NL		;
	OUT			;
	JSR	DELAY		;

	ADD	R1, R1, #0	;CHECK WHICH BOARD TURN
	BRz	LOOP		;
	LEA	R0, CK4		;
	PUTS			;
	LD	R0, NL		;
	OUT			;
	JSR	DELAY		;
	BRnzp	LOOP2		;

;
;SUBROUTINE FOR DELAY INSTRUCTION
;
DELAY	ST	R2, SAVER2	;
	LD	R2, COUNT	;
REP	ADD	R2, R2, #-1	;
	BRP	REP		;
	LD	R2, SAVER2	;
	RET			;

;
;CONSTANTS
;
COUNT	.FILL	#2500
SAVER2	.BLKW	1
SP	.FILL	X3000
NL	.FILL	x000A

KBSR	.FILL	XFE00

CONVERT	.FILL	X4000

INTV	.FILL	X2000
INTVT	.FILL	X0180

CK1	.STRINGZ "**    **    **    **    **    **    **    **    "
CK2	.STRINGZ "   **    **    **    **    **    **    **    "
CK3	.STRINGZ "##    ##    ##    ##    ##    ##    ##    ##    "
CK4	.STRINGZ "   ##    ##    ##    ##    ##    ##    ##    "

.END