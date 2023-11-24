/*
 * main.c
 *
 *  Created on: Nov 22, 2023
 *      Author: Raheek_Helal
 */

#include "STD_TYPES.h"
#include <avr/io.h>
#include <util/delay.h>
#include "BIT_MATH.h"

void KEYPAD_Init(void)
{
	/*PORTB -> inputs/outputs */
	DDRB  = 0X0F;
	/* PULL UP resistors activation on inputs */
	PORTB = 0XFF;
}
u8 GetPressedKey(void)
{
	u8 pressed_key = 0;
	for(u8 col=0; col<4; col++)
	{
		/* activate current column */
		clr_bit(PORTB,col);
		for(u8 row=0; row<4; row++)
		{
			if((get_bit(PINB,row+4)) == 0)
			{
				pressed_key = row + (col*4) + 1;/*key number*/
			}
			while(get_bit(PINB,row+4)==0){}
			_delay_ms(10);
		}
		/* deactivate current column */
		set_bit(PORTB,col);
	}


	return pressed_key;
}

int main(void)
{
	KEYPAD_Init();
	u8 key = 0;
	while(1)
	{
		key = GetPressedKey();
		if(key != 0)
		{
			/* seven segment display code here */
		}
	}
}
