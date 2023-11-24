/*
 * KEYPAD_prg.c
 *
 *  Created on: Nov 24, 2023
 *      Author: Raheek_Helal
 */

#include "../../LIB/STD_TYPES.h"
#include "KEYPAD_int.h"
#include "../../MCAL/DIO/DIO_int.h"
#include <util/delay.h>

void KPD_vInit(void)
{
	DIO_vSetPortDir(KPD_PORT,0X0F);
	/* PULL UP resistors activation on inputs */
	DIO_vSetPortVal(KPD_PORT, 0XFF);
}

u8   KPD_u8GetPressedKey(void)
{
	u8 pressed_key = 0;
	for(u8 col=0; col<4; col++)
	{
		/* activate current column */
		DIO_vSetPinVal(KPD_PORT, col, DIO_LOW);
		for(u8 row=0; row<4; row++)
		{
			if((DIO_u8GetPinVal(KPD_PORT,row+4)) == 0)  //row+4 = the real number of the row's pin
			{
				pressed_key = row + (col*4) + 1;/*key number*/
			}
			while((DIO_u8GetPinVal(KPD_PORT,row+4)) == 0){}
			_delay_ms(10);
		}
		/* deactivate current column */
		DIO_vSetPinVal(KPD_PORT, col, DIO_HIGH);
	}


	return pressed_key;
}
