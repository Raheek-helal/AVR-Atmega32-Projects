#define F_CPU 1000000UL
#include <avr/io.h>

#include "LED.h"

void LED_init(void)
{
	int i =0;
	for(i = 0; i < LED_MAX; i++)
	{
		LED_DDR |= (1<<i);
	}
}

void LED_ON(LED_num led)
{
	BIT_SET(LED_PORT,led);
}

void LED_OFF(LED_num led)
{
	BIT_CLR(LED_PORT,led);
}

void LED_FLIP(LED_num led)
{
	BIT_TOG(LED_PORT,led);
}

LED_state LED_CHECK(LED_num led)
{
	if(LED_PORT & (1<<led))
	{
		//LED IS ON
		return LED_On;
	}
	else
	{
		//LED IS OFF
		return LED_Off;
	}
}
