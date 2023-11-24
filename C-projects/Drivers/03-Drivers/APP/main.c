/*
 * main.c
 *
 *  Created on: Nov 23, 2023
 *      Author: Raheek_Helal
 */

#include "../LIB/STD_TYPES.h"
#include "../MCAL/DIO/DIO_int.h"
#include "../HAL/SSD/SSD_Int.h"
#include "../HAL/KEYPAD/KEYPAD_int.h"
#include <util/delay.h>

int main(void)
{
	SSD_vInit();
	KPD_vInit();
	while(1)
	{
		//for(u8 i=0; i<10; i++)
		//		{
		//			SSD_vDisplayNum(i);
		//			_delay_ms(1000);
		//		}

		u8 key = 0;
		while(1)
		{
			key = KPD_u8GetPressedKey();
			if(key != 0)
			{
				/* seven segment display code here */
				SSD_vDisplayNum(key);       //display the number of pressed key
				_delay_ms(250);
			}
		}
	}
}

