/*--------------------------------------------------------------------
Name:	Prof Jeff Falkinburg
Date:	August 21, 2020
Course:	CSCE 230 - Computer Organization
File:	ch3_polling.s
HW:		Chapter 3 Lecture 

Purp: 	This program demonstrates polling in Nios assembly on the
		DE-10 Lite board. This program displays the current KEY 
		status on the Hex0 Display

Doc:	Adapted from lecture notes

Academic Integrity Statement: I certify that, while others may have 
assisted me in brain storming, debugging and validating this program, 
the program itself is my own work. I understand that submitting code 
which is the work of other individuals is a violation of the honor   
code.  I also understand that if I knowingly give my original work to 
another individual is also a violation of the honor code. 
-------------------------------------------------------------------------*/
	.text							/* executable code follows */
	.global	_start
_start:

	movia		r8, 0xFF200040		/* SW slider switch base address */
	movia		r9, 0xFF200000		/* red LED base address */
	movia		r10, 0xFF200050		/* pushbutton KEY base address */
	movia		r11, 0xFF200020		/* HEX3 to Hex0 base address */

DO_DISPLAY:
	ldw		r3, 0(r8)			/* load slider switches */
	stw		r3, 0(r9)			/* write to red LEDs */
	ldw		r2, 0(r10)			/* load pushbuttons */
	roli	r2, r2, 1			/* Rotate left to line up with segements 1 & 2 */
	stw		r2, 0(r11)			/* write to Hex Displays */

	br 		DO_DISPLAY

	.data							/* data follows */
    .end
