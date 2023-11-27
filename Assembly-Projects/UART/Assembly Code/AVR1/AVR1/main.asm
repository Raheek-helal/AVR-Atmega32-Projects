;
; AVR1.asm
;
; Created: 10/22/2023 1:55:39 PM
; Author : Raheek-Helal
;

.INCLUDE <m32adef.inc>
.equ	TxPort	= PORTC
.equ	TxPin = 0
; Replace with your application code
; initialize the stack pointer
init:
	LDI R16, LOW(RAMEND)
	OUT SPL,R16
	LDI R16, HIGH(RAMEND)
	OUT SPH,R16
	; intialize PORTA as an input
	LDI R16, $00
	OUT DDRA,R16
	; intialize PORTA as input PULL UP
	LDI R16, $FF
	OUT PORTA,R16
	
	; intialize PORTC0 as an output Tx
	SBI DDRC,0

	;LDI R16, 0x01
	;OUT DDRC, R16
	;idel
	SBI TxPort, TxPin
main:
	; WAIT FOR SOME TIME
	CALL DELAY
	CALL DELAY
	CALL DELAY
	CALL DELAY
	CALL DELAY
	CALL DELAY

	; START OF FRAME
	;SEND 0 FOR THE START BIT
	CBI TxPort, TxPin
	; those two delay points should consume 104 cycle
	CALL DELAY

	LDI R16,5
	NOP
LoopStart:
	DEC R16
	BRNE LoopStart

	;READING THE PINA AND SEND IT IN PORTC(PIN0)
	;READ PORTA PIN 0
	LDI  R19, (1<<0)
	CALL Sender

	;READ PORTA PIN 1
	LDI  R19, (1<<1)
	CALL Sender

	;READ PORTA PIN 2
	LDI  R19, (1<<2)
	CALL Sender

	;READ PORTA PIN 3
	LDI  R19, (1<<3)
	CALL Sender

	;READ PORTA PIN 4
	LDI  R19, (1<<4)
	CALL Sender

	;READ PORTA PIN 5
	LDI  R19, (1<<5)
	CALL Sender
	
	;READ PORTA PIN 6
	LDI  R19, (1<<6)
	CALL Sender

	;READ PORTA PIN 7
	LDI  R19, (1<<7)
	CALL Sender

	;SEND 1 FOR THE ONE STOP BIT
	SBI PORTC,0
	CALL DELAY
	RJMP main

; Reading R19 value 
Sender:
	IN   R21,  PINA              ;READ PINA IN REG R21
	COM  R21
	AND  R21,  R19               ;GET BIT R21 will be R19 if PINAx is set
	CLR  R22
	CPSE R21,  R22
	SBI  PORTC,0
	CPSE R21,  R19               ;COMPARE PINA BIT N  SKIP IF EQUAL 1
	CBI  PORTC,0

	; delay for 104 cycles
	CALL DELAY
	RET

DELAY:
	CALL SUB_DELAY
	CALL SUB_DELAY
	RET

SUB_DELAY:
	LDI  R20,10                  ; 1 cycle -> 42
LOOP:                            ; 6 in last loop
	DEC  R20                     ; 1 cycle -> 41
	BRNE LOOP                    ; 2 cycle -> 39	
	NOP                    
	RET