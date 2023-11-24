/*
 * main.c
 *
 *  Created on: Nov 20, 2023
 *      Author: Raheek_Helal
 */

#include <avr/io.h>
#include <util/delay.h>
#include "BIT_MATH.h"

int main(void)
{
	//	DDRA = 0b00000001 ;  //0b00001111 ; // PA0 -> Output
	set_bit(DDRA,0); //PA0 -> OUTPUT
	clr_bit(DDRA,1); //PA1 -> INPUT
	set_bit(PORTA,1);//ENABLE PULL UP ON PA1

	while(1) // Super loop
	{

		/* //BLINKING ONE LED
		 * PORTA = 0X01 ; // PA0 -> HIGH (5v)
		 * _delay_ms(1000);
		 * PORTA = 0X00 ;  // PA0 -> LOW
		 * _delay_ms(1000);
		 * PORTB = 0b00000001 ;
		 */

		/* //BLINKING 4 LEDs
		 * for(int i=0; i<4; i++)
		 * {
		 * 	_delay_ms(250);
		 * 	PORTB <<= 1 ;
		 * }
		 */

		/*
		 * //DIP SWITCH
		 * if((get_bit(PINA,1)) == 0)
		 * {
		 * 	set_bit(PORTA,0);
		 * }
		 * else
		 * {
		 * 	clr_bit(PORTA,0);
		 * }
		 */

		//PUSH BUTTON
		if((get_bit(PINA,1)) == 0)          //IF BUTTON IS PRESSED
		{
			while((get_bit(PINA,1)) == 0)   //IF BUTTON IS STILL PRESSED
			{

			}
			_delay_ms(10);
			toggle_bit(PORTA,0);
		}


	}

}
