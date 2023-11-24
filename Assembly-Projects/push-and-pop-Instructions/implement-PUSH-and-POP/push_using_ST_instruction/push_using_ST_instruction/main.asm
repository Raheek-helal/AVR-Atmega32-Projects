;
; push_using_ST_instruction.asm
;
; Created: 9/17/2023 1:21:07 AM
; Author : Raheek_Helal 
;


; Replace with your application code

init:
	ldi r16, $08
	out $3E, r16
	ldi r16, $5F
	out $3D, r16

_push:
    ldi r18, $55

	ldi r26, $5F
	ldi r27, $04
	st  X, r18

	dec r26


	ldi r28, $5D
	ldi r29, $00
	
	st Y, r26
	

_pop:

	inc r26
	
	ldi r28, $5D
	ldi r29, $00

	st Y, r26

	ldi r30, $5D
	ldi r31, $00

	LD r17, X
 
