/*--------------------------------------------------------------------
Name: Matthew Schlatter

Date: 09/03/2023

Course: CSCE 230 - Computer Organization

File: Lab02.s

HW: Lab 2

Purpose: This program finds the minimum positive integer n such 
that the function r3(n) is greater than 10

Doc: None

Academic Integrity Statement: I certify that, while others may have
assisted me in brain storming, debugging and validating this program,
the program itself is my own work. I understand that submitting code
which is the work of other individuals is a violation of the honor
code. I also understand that if I knowingly give my original work to
another individual is also a violation of the honor code.
-------------------------------------------------------------------------*/
.text
.global _start
_start:
	movi	r2, 10
	movi	r3, 0
	movi	r4, 1
dowhile:
	movi	r5, 1
forloop:
	add	r3, r3, r5
	addi	r5, r5, 1
	ble	r5, r4, forloop
	addi	r4, r4, 1
	ble	r3, r2, dowhile
	subi	r4, r4, 1
end:br	end
	.data
	.end