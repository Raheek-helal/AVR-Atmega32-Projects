#define F_CPU 1000000UL
#include <util/delay.h>
#include "LED/LED.h"

void init(void);
void loop(void);

int main(void)
{
	init();
	while(1)
	{
		loop();
	}
}

void init(void)
{
	LED_init();
}

void loop(void)
{
	_delay_ms(500);
	LED_FLIP(LED_TWO);
}