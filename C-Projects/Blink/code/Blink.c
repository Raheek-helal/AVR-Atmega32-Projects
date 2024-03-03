#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

#define BIT_SET(REG,POS)	REG |= (1<<POS) 
#define BIT_CLR(REG,POS) 	REG &= ~(1<<POS)
int main(void){
	DDRB = 0b11111111;
	PORTB = 0b00000000;
	while(1){
		BIT_SET(PORTB,0);
		_delay_ms(500);
		BIT_CLR(PORTB,0);
		_delay_ms(500);
	}
}