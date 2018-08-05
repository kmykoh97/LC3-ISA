.ORIG X2000

;
;INITIALISATION
;
START	LDI	R5, KBSR	;PROMPT CHARACTERS AND STORE THEM
	BRzp	START		;
	LDI	R4, KBDR	;
	ST	R4, TEN		;
START2	LDI	R5, KBSR	;GET ENTER
	BRzp	START2		;
	LDI	R5, KBDR	;
	ADD	R5, R5, #-10	;
	BRnp	START2		;

	AND	R5, R5, #0	;
	ADD	R5, R5, #10	;
ECHO	LDI	R4, DSR		;PRINT CHARACTER 10 TIME
	BRzp	ECHO		;
	LD	R4, TEN		;
	STI	R4, DDR		;
	ADD	R5, R5, #-1	;
	BRnp	ECHO		;

ECHO2	LDI	R4, DSR		;PRINT LINEFEED
	BRzp	ECHO2		;
	LD	R4, LINEF	;
	STI	R4, DDR		;
ECHO3	LDI	R4, DSR		;PRINT LINEFEED
	BRzp	ECHO3		;
	LD	R4, LINEF	;
	STI	R4, DDR		;

	ADD	R1, R1, #0	;CHANGE SHAPE TO PRINT AFTER RETURN FROM INTERRUPT
	BRz	POS		;
	ADD	R1, R1, #-1	;
	BRnzp	END		;
POS	ADD	R1, R1, #1	;

END	RTI
	
;
;CONSTANTS
;
LINEF	.FILL	X0A
TEN	.BLKW	1

KBSR	.FILL	XFE00
KBDR	.FILL	XFE02
DSR	.FILL	XFE04
DDR	.FILL	XFE06

.END