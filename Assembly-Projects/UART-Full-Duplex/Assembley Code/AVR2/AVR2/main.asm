;
; AVR1.asm
;
; Created: 11/30/2023 4:37:24 AM
; Author : Raheek_Helal
;



.INCLUDE <m32adef.inc>
.equ	TxPort	= PORTC
.equ	TxPin = 0
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
	; configure the int2 pin PB2 as input
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
	; intialize PORTA0 as an input
	CBI DDRA,0
	; intialize PORTA as input PULL UP
	SBI PORTA,0
	; intialize PORTD0 as an output
	SBI DDRD,0
	; intialize PORTC0 as an output Tx
	SBI DDRC,0
	;idel
	SBI TxPort, TxPin
	; SET R19 AS 0X01 TO COMPARE
	LDI  R19, (1<<0)
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

	LDI R16,3
	NOP
	NOP
LoopStart:
	DEC R16
	BRNE LoopStart

	;READING THE PINA AND SEND IT IN PORTC(PIN0)
	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender
	
	;READ PORTA PIN 
	CALL Sender

	;READ PORTA PIN 
	CALL Sender

	;SEND 1 FOR THE ONE STOP BIT
	SBI PORTC,0
	CALL DELAY
	RJMP main




;RECIEVER
; interrupt service routine
int2_isr:
	; execute the interrupt service routine
	;WAITING THE START BIT
	CALL SUBDELAY
	CALL DELAY

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	;READ PINB2
	CALL RECIEVER

	RETI


Sender:
	SBIS PINA, 0				;READ PINA0 AND SKIP THE NEXT INSTRUCTION IF SETED
	SBI  PORTC,0				;SET 1 ON PORTC0 IF PINA0 CLEARED
	SBIC PINA, 0				;READ PINA0 AND SKIP THE NEXT INSTRUCTION IF CLEARED
	CBI  PORTC,0				;SET 0 ON PORTC0 IF PINA0 SETED

	; delay for 104 cycles
	CALL DELAY
	RET

RECIEVER:
	SBIC PINB, 2			    ;READ PINB2 AND SKIP THE NEXT INSTRUCTION IF CLEARED
	SBI  PORTD,0			    ;SET 1 ON PORTD0 IF PINB2 CLEARED
	SBIS PINB, 2			    ;READ PINA0 AND SKIP THE NEXT INSTRUCTION IF SETED
	CBI  PORTD,0			    ;SET 0 ON PORTD0 IF PINB2 CLEARED
	CALL DELAY
	RET



DELAY:
	CALL SUB_DELAY
	CALL SUB_DELAY
	NOP
	RET

SUB_DELAY:
	LDI  R20,10                  ; 1 cycle -> 42
LOOP:                            ; 6 in last loop
	DEC  R20                     ; 1 cycle -> 41
	BRNE LOOP                    ; 2 cycle -> 39	
	NOP
	NOP
	NOP                   
	RET

SUBDELAY:            ;52 cycle
	LDI  R16,14      ; 1 cycle -> 42
LOOP1:               ; 6 in last loop
	DEC  R16         ; 1 cycle -> 41
	BRNE LOOP1       ; 2 cycle -> 39
	NOP
	NOP
RET                  ; 4