/*
 * bit_math.h
 *
 *  Created on: Nov 28, 2020
 *      Author: DEll
 */

#ifndef BIT_MATH_H_
#define BIT_MATH_H_

#define clr_bit(value,bit)value=value&~((0b00000001)<<bit)
#define set_bit(value,bit)value=value|((0b00000001)<<bit)
#define toggle_bit(value,bit)value=value^((0b00000001)<<bit)
#define get_bit(value,bit)(value>>bit)&0b00000001


#endif /* BIT_MATH_H_ */
