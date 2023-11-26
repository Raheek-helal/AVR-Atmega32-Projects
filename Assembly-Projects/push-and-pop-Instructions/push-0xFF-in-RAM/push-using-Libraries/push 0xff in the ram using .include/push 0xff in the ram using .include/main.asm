;
; push 0xff in the ram using .include.asm
;
; Created: 9/24/2023 2:00:58 AM
; Author : Raheek_Helal
;

.INCLUDE <m32adef.inc>

; Replace with your application code


INIT:
	LDI R16, LOW(RAMEND)
	OUT SPL, R16
	LDI R16, HIGH(RAMEND)
	OUT SPH, R16

MIAN:
	LDI R16, $FF	
		ldi r17, 89
loop:
		ldi r18, 23
loop1:
		push r16
		dec r18
brne loop1
		dec r17
brne loop
	push r16
