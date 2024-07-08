#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
//#include <util/delay.h>

#define BIT_SET(REG,POS)	REG |= (1<<POS) 
#define BIT_CLR(REG,POS) 	REG &= ~(1<<POS)
#define BIT_FLIP(REG,POS)   REG ^= (1<<POS)

void timerInit(void);
int main(void){
	// Initialize the timer
	timerInit();
	DDRB = 0b11111111;
	PORTB = 0b00000000;
	while(1){
		//BIT_SET(PORTB,0);
		//_delay_ms(500);
		//BIT_CLR(PORTB,0);
		//_delay_ms(500);
	}
}

void timerInit(void){
	TCCR1A = 0x00;
	TCCR1B |= (1<<CS11); // set prescaller to 8 
	
	TIMSK |= (1<<TOIE1); // enable overflow interrupt
	TCNT1 = 3036;
	sei();
	
}

ISR(TIMER1_OVF_vect){
	TCNT1 = 3036;
	BIT_FLIP(PORTB,0);
}