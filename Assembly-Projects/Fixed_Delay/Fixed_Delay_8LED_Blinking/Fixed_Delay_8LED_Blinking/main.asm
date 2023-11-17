;
; AssemblerApplication4.asm
;
; Created: 9/4/2023 8:00:16 PM
; Author : Raheek_Helal
;


; Replace with your application code

init:
	LDI R16,$08		;INIT SP
	OUT $3E,R16
	LDI R16,$2A
	OUT $3D,R16

ldi r22, $FF		;SET THE DDRA REG AS OUTPUT
out $1A, r22        


start:
	sbi $1B,0				;SET BIT 0 AS 1
	call DELAY
	cbi $1B,0

	sbi $1B,1				;SET BIT 1 AS 1
	call DELAY
	cbi $1B,1

	sbi $1B,2				;SET BIT 2 AS 1
	call DELAY
	cbi $1B,2

	sbi $1B,3				;SET BIT 3 AS 1
	call DELAY
	cbi $1B,3

	sbi $1B,4				;SET BIT 4 AS 1
	call DELAY
	cbi $1B,4

	sbi $1B,5				;SET BIT 5 AS 1
	call DELAY
	cbi $1B,5  

	sbi $1B,6				;SET BIT 6 AS 1
	call DELAY
	cbi $1B,6

	sbi $1B,7				;SET BIT 7 AS 1
	call DELAY
	cbi $1B,7

rjmp start




DELAY:
	ldi r21,3
loop0:
	dec r21
	brne loop0


	ldi r18,79
loop1:                       ; creating loop1
	ldi r19,115
	nop
loop2:	
	nop
	ldi r20,17
loop3:						 ; creatintg loop3
   dec r20	
brne loop3
	dec r19
brne loop2
	dec r18
brne loop1


ret




