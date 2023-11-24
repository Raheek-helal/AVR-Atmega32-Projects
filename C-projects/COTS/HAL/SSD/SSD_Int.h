/*
 * SSD_Int.h
 *
 *  Created on: Nov 24, 2023
 *      Author: Raheek_Helal
 */

#ifndef SSD_SSD_INT_H_
#define SSD_SSD_INT_H_


#define COM_CATHODE 1
#define COM_ANODE   0


#define SSD_TYPE   COM_ANODE
#define SSD_PORT   DIO_PORTD

void SSD_vInit(void);
void SSD_vDisplayNum(u8 A_u8Num);
void SSD_vTurnOff   (void);



#endif /* SSD_SSD_INT_H_ */
