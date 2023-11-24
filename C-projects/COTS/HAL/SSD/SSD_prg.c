/*
 * SSD_prg.c
 *
 *  Created on: Nov 24, 2023
 *      Author: Raheek_Helal
 */


#include "../../LIB/STD_TYPES.h"
#include "../../HAL/SSD/SSD_Int.h"
#include "../../MCAL/DIO/DIO_int.h"


static const u8 CGS_u8SSd_Nums[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void SSD_vInit(void)
{
	DIO_vSetPortDir(SSD_PORT, 0XFF);
}

void SSD_vDisplayNum(u8 A_u8Num)
{
	/* input validation */
	if(A_u8Num < 10)
	{
#if SSD_TYPE == COM_CATHODE
		DIO_vSetPortVal(SSD_PORT, CGS_u8SSd_Nums[A_u8Num]);  //the index equal the displayed Num
#elif SSD_TYPE == COM_ANODE
		DIO_vSetPortVal(SSD_PORT, ~CGS_u8SSd_Nums[A_u8Num]);
#endif
	}
}
void SSD_vTurnOff   (void)
{
	#if SSD_TYPE == COM_CATHODE
	DIO_vSetPortDir(SSD_PORT, 0X00);
#elif SSD_TYPE == COM_ANODE
	DIO_vSetPortDir(SSD_PORT, 0XFF);
#endif
}
