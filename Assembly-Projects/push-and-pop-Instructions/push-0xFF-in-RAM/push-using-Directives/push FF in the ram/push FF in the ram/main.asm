;
; push FF in the ram.asm
;
; Created: 9/24/2023 12:15:31 AM
; Author : Raheek_Helal
;


; Replace with your application code

; push $FF in the ram using .equ

.equ SPHH = $3E
.equ SPLL = $3D


ldi r16, $08
out SPHH, r16
ldi r16, $5F
out SPLL, r16


ldi r16, $FF


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
