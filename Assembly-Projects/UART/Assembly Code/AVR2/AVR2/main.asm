;
; AVR2.asm
;
; Created: 10/22/2023 2:58:32 PM
; Author : Raheek-Helal
;


.INCLUDE <m32adef.inc>


; Replace with your application code
; Interrupt vector table
.ORG 0x000
	JMP init
.ORG 0X006
	; PB2 interrupt
	JMP int2_isr
.ORG 0X030
; initialize the stack pointer
init:
	LDI R16, LOW(RAMEND)
	OUT SPL,R16
	LDI R16, HIGH(RAMEND)
	OUT SPH,R16
	; intialize PORTD as an output
	LDI R16, $FF
	OUT DDRD,R16
	; configure the int0 pin PB2 as input
	CBI	  DDRB,2
	; configure int2 on falling edge
	LDI R16, (1<<ISC2)
	OUT MCUCR, R16
	; enable int2 interrupt
	LDI   R16, (1<<int2)
	OUT	  GICR, R16
	; enable global interrupt mask
	LDI   R16, (1<<SREG_I)
	OUT	  SREG,R16
	

main:
	NOP
	RJMP main

; interrupt service routine
int2_isr:
	; execute the interrupt service routine
	CALL DELAY
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,0
	SBIS PINB, 2
	CBI  PORTD,0
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,1
	SBIS PINB, 2
	CBI  PORTD,1
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,2
	SBIS PINB, 2
	CBI  PORTD,2
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,3
	SBIS PINB, 2
	CBI  PORTD,3
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,4
	SBIS PINB, 2
	CBI  PORTD,4
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,5
	SBIS PINB, 2
	CBI  PORTD,5
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,6
	SBIS PINB, 2
	CBI  PORTD,6
	CALL DELAY
	CALL DELAY

	SBIC PINB, 2
	SBI  PORTD,7
	SBIS PINB, 2
	CBI  PORTD,7
	CALL DELAY
	CALL DELAY

	RETI

DELAY:
	LDI  R16,14      ; 1 cycle -> 42
LOOP:                ; 6 in last loop
	DEC  R16         ; 1 cycle -> 41
	BRNE LOOP        ; 2 cycle -> 39
	NOP
	NOP
RET                  ; 4