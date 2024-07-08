#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>

#define BIT_SET(REG,POS)	REG |= (1<<POS) 
#define BIT_CLR(REG,POS) 	REG &= ~(1<<POS)
#define BIT_FLIP(REG,POS)   REG ^= (1<<POS)

int c = 0;
void timerInit(void);
int main(void){
	// Initialize the timer
	timerInit();
	DDRB = 0xFF;
	PORTB = 0x00;
	while(1)
	{
		
	}
}

void timerInit(void){
	TCCR0 |= (1<<CS00)|(1<<CS02); // set prescaller to 1024
	
	TIMSK |= (1<<TOIE0); // enable overflow interrupt
	TCNT0  = 10;
	sei();
}

ISR(TIMER0_OVF_vect)
{
	TCNT0  = 10;
	if(c = 1)
	{
		BIT_FLIP(PORTB,0);
		c = 0;
	}
	else if(c = 0)
	{
		c = 1;
	}
}