/*--------------------------------------------------------------------
Name: Matthew Schlatter
Date: 9/11/2023
Course: CSCE 230 - Computer Organization
File: lab3.s
HW: Lab 3 - Assembly Array Programs
Purpose: This program is a demonstration in the basic syntax and
structure in Nios II assembly programming by using arrays.
Doc: 
Academic Integrity Statement: I certify that, while others may have
assisted me in brain storming, debugging and validating this program,
the program itself is my own work. I understand that submitting code
which is the work of other individuals is a violation of the honor
code. I also understand that if I knowingly give my original work to
another individual is also a violation of the honor code.
-------------------------------------------------------------------------*/
	.text 				# located at address 0
	.global _start
_start:
	movi r2, 0			# i
	movi r3, 0			# i*2, address offset for element i
	movi r11, 0			# i*4, address offset for element i
	movi r4, 4			# N with array1
	movi r5, 8			# N with array1 and array2
	movi r6, 11			# N with array1, array2, and array3
	movi r7, 0			# max register initialized to zero
	movi r8, 32767		# min register initialized to 32767

dowhile:
	ldb r9, array1(r2)			# loads array value at i into r9
	bgtu r9, r7, update_max 	# if r9 >= r7 (current max), then array1_max tracker (r7) gets updated
	addi r2, r2, 1				# increments i
	bltu r2, r4, dowhile		# continues/ends loop
    stb r7, array1_max(r0)	   	# Store the maximum value in array1_max
	br dowhile2					# call next loop for array2

update_max:
	mov r7, r9            		# updates max tracker register
	br dowhile   				# continues loop from dowhile label

dowhile2:
	ldhu r10, array2(r3)		# loads array value at i*2 into r8
	bltu r10, r8, update_min	# if r8 <= r5 (current min), then array2_min tracker (r8) gets updated
	addi r2, r2, 1				# increments i
	addi r3, r3, 2				# i*2, address offset for element i
	bltu r2, r5, dowhile2		# continues/ends loop
	sth r8, array2_min(r0)		# Store the minimum value in array2_min
	# br dowhile3
	br end				

update_min:
	mov r8, r10				# updates min tracker register
	br dowhile2   			# continues loop from dowhile label

# dowhile3:
	# ldw r12, array3(r11)
	# something to count 1s??
	# addi r2, r2, 1
	# addi r11, r11, 4
	# bltu r2, r6, dowhile3
	# stw r13, array3_bitone(r0)
	# br end

end:br 	end

	.data 		# located at address 0x400
# data for the first array
array1:
	.byte 0x00, 0x11, 0x22, 0x33
array1_max:
	.byte 0

	.skip 3

# data for the second array
array2:
	.hword 0x0123, 0x4567, 0x89AB, 0xCDEF
array2_min:
	.hword 0

	.skip 2

# data for the third array
array3:
	.word 0x00112233, 0x44556677, 0x8899AABB
array3_bitone:
	.word 0

	.end
