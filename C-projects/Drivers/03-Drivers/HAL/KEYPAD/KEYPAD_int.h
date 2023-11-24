/*
 * KEYPAD_Int.h
 *
 *  Created on: Nov 24, 2023
 *      Author: Raheek_Helal
 */

#ifndef HAL_KEYPAD_KEYPAD_INT_H_
#define HAL_KEYPAD_KEYPAD_INT_H_

#define KPD_PORT   DIO_PORTB

void KPD_vInit(void);
u8   KPD_u8GetPressedKey(void);

#endif /* HAL_KEYPAD_KEYPAD_INT_H_ */
