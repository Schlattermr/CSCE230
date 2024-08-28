/*--------------------------------------------------------------------
Name:	Matthew Schlatter
Date:	September 20, 2023
Course:	CSCE 230 - Computer Organization
File:	lab5.s
HW:		Lab 5 - Assembly Input and Output 

Purpose: This program is a demonstration of writing Assembly Input and Output
		 using polling techniques

Doc: 
		
Academic Integrity Statement: I certify that, while others may have 
assisted me in brain storming, debugging and validating this program, 
the program itself is my own work. I understand that submitting code 
which is the work of other individuals is a violation of the honor   
code.  I also understand that if I knowingly give my original work to 
another individual is also a violation of the honor code. 
-------------------------------------------------------------------------*/
	.text
	.global	_start

_start:
	movi r6, 1
	movi r7, 2
	movi r8, 3
	movi r9, 10
	movi r10, 16
	mov r13, r0
	mov r14, r0
	mov r15, r0
	mov r16, r0

dowhile:
	movia r21, 0xFF200020	# LED address 1
	movia r23, 0xFF200030	# LED address 2
	movia r2, 0xFF200050	# Button address
	movia r3, 0xFF200040	# Switch address
	ldw r4, (r2)			# Button value
	ldw r5, (r3)			# Switch value
	mov r11, r5
	mov r12, r5
	
	div r11, r12, r9
	mul r13, r11, r9
	sub r13, r12, r13		# Hex remainder 1 stored in r13
	mov r12, r11
	muli r13, r13, 4		# Word offset
	
	div r11, r12, r9
	mul r14, r11, r9
	sub r14, r12, r14		# Hex remainder 2 stored in r14
	mov r12, r11
	muli r14, r14, 4		# Word offset
	
	div r11, r12, r9
	mul r15, r11, r9
	sub r15, r15, r15		# Hex remainder 3 stored in r15
	mov r12, r11
	muli r15, r15, 4		# Word offset
	
	div r11, r12, r9
	mul r16, r11, r9
	sub r16, r12, r16		# Hex remainder 4 stored in r16
	mov r12, r11
	muli r16, r16, 4		# Word offset
	
	beq r4, r6, key0_pressed
	beq r4, r7, key1_pressed
	beq r4, r8, both_pressed
	bne r5, r0, switch_on
	beq r4, r0, buttons_off
	beq r5, r0, switch_off

key0_pressed:
	movia r2, 0xFF200000	# Turns on LED8
	movia r3, 0x00000100
	stw r3, (r2)
	br switch_on

key1_pressed:
	movia r2, 0xFF200000	# Turns on LED9
	movia r3, 0x00000200
	stw r3, (r2)
	br switch_on

both_pressed:
	movia r2, 0xFF200000	# Turns on LED8
	movia r3, 0x00000100
	stw r3, (r2)
	movia r2, 0xFF200000	# Turns on LED9
	movia r3, 0x00000200
	stw r3, (r2)
	br switch_on

buttons_off: 
	movia r2, 0xFF200000	# Turns off LED8 and LED9
	movia r3, 0x00000000
	stw r3, (r2)
	br dowhile

switch_on:
	movia r2, 0xFF200000	# Turns on switch LEDs
	mov r3, r5
	andi r3, r3, 0xFF		# Bit masking top two switches
	stw r3, (r2)
	br load_segments
	
switch_off:
	movia r2, 0xFF200000	# Turns off switch LEDs
	movia r3, 0x00000000
	stw r3, (r2)
	br dowhile
	
load_segments:
	ldw r17, sevensegments(r13)
	ldw r18, sevensegments(r14)
	ldw r19, sevensegments(r15)
	ldw r20, sevensegments(r16)
	mov r22, r20
	slli r22, r22, 8
	or r22, r22, r19
	slli r22, r22, 8
	or r22, r22, r18
	slli r22, r22, 8
	or r22, r22, r17
	stw r22, (r21)
	br dowhile
	
load_r14:
	ldw r18, sevensegments(r14)
	stw r21, (r18)
	br load_r15

load_r15:
	ldw r19, sevensegments(r15)
	stw r21, (r19)
	br load_r16
	
load_r16:
	ldw r20, sevensegments(r16)
	stw r21, (r20)
	br dowhile
	
	.data
sevensegments:.word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F

	.end