/*--------------------------------------------------------------------
Name:	Matthew Schlatter
Date:	September 13, 2023
Course:	CSCE 230 - Computer Organization
File:	lab4.s
HW:		Lab 4 - Assembly Subroutines 

Purpose: This program is a demonstration of writing Assembly Subroutines
		 to sum and compare arrays.

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

# Main program
_start:
    movia   sp, 0x500

#  used to test whether your subroutines modify these registers
    movi    r2, 2	
    movi    r3, 3	
    movi    r4, 4	
    movi    r5, 5	
    movi    r6, 6	
    movi    r7, 7	
    movi    r8, 8	
    movi    r9, 9	
    movi    r10, 10	
    movi    r11, 11	
    movi    r12, 12	
    movi    r13, 13	
    movi    r14, 14	
    movi    r15, 15	
    movi    r16, 16	
    movi    r17, 17	
    movi    r18, 18	
    movi    r19, 19	
    movi    r20, 20	
    movi    r21, 21	
    movi    r22, 22	
    movi    r23, 23	

# used to test your function sum
    movia   r2, array1
    subi    sp, sp, 4
    stw     r2, (sp)            # push address of array1
	ldw     r2, array1_size(r0)
    subi    sp, sp, 4
    stw     r2, (sp)			# push size of array1
    subi    sp, sp, 4           # space for return value
    call    sum
    ldw     r2, (sp)            # get return value
    addi    sp, sp, 12          # pop input and return

 # used to test your function compare
    movia   r3, array1
    subi    sp, sp, 4
    stw     r3, (sp)            # push address of array1
	ldw     r3, array1_size(r0)
    subi    sp, sp, 4
    stw     r3, (sp)			# push size of array1
    movia   r3, array2
    subi    sp, sp, 4
    stw     r3, (sp)            # push address of array2
	ldw     r3, array2_size(r0)
    subi    sp, sp, 4
    stw     r3, (sp)			# push size of array2
    subi    sp, sp, 4           # space for return value
    call    compare
    ldw     r3, (sp)            # get return value
    addi    sp, sp, 20          # pop input and return

end:br      end

# write your function sum below
sum:
    subi sp, sp, 32				# save registers
	stw	ra, 28(sp)
	stw r2, 24(sp)
	stw r3, 20(sp)
	stw r4, 16(sp)
	stw r5, 12(sp)
	stw r6, 8(sp)
	stw r7, 4(sp)
	stw r8, (sp)

	movi r4, 0					# i
	movi r5, 0					# i*4
	movi r8, 0					# initialize sum counter to zero
	
dowhile:
	ldw r6, array1(r5)
	ldw r7, array1_size(r0)
	add r8, r8, r6
	addi r4, r4, 1
	addi r5, r5, 4
	bltu r4, r7, dowhile
	bgeu r4, r7, update_sum
	
update_sum:
	addi sp, sp, 32
	stw r8, (sp)
	subi sp, sp, 32
	ldw r8, (sp)
	ldw r7, 4(sp)
	ldw r6, 8(sp)
	ldw r5, 12(sp)
	ldw r4, 16(sp)
	ldw r3, 20(sp)
	ldw r2, 24(sp)
	ldw ra, 28(sp)
	addi sp, sp, 32
	
    ret

# write your function compare below
compare:	
    subi sp, sp, 40				# save registers
	stw	ra, 36(sp)
	stw r2, 32(sp)
	stw r3, 28(sp)
	stw r4, 24(sp)
	stw r5, 20(sp)
	stw r6, 16(sp)
	stw r7, 12(sp)
	stw r8, 8(sp)
	stw r9, 4(sp)
	stw r10, (sp)

	movi r6, 0					# sum of array1 initialized to zero
	movi r7, 0					# sum of array2 initialized to zero
	movi r8, 2					# compare value initialized to two
	
	ldw r9, 56(sp)
	ldw r10, 52(sp)
	subi sp, sp, 4
	call sum
	ldw r6, (sp)
	addi sp, sp, 4
	
	ldw r9, 48(sp)
	ldw r10, 44(sp)
	subi sp, sp, 4
	call sum
	ldw r7, (sp)
	addi sp, sp, 4
	
	bleu r6, r7, update_compare
	
update_compare:
	movi r8, 0
	addi sp, sp, 40
	stw r8, (sp)
	subi sp, sp, 40
	ldw r10, (sp)
	ldw r9, 4(sp)
	ldw r8, 8(sp)
	ldw r7, 12(sp)
	ldw r6, 16(sp)
	ldw r5, 20(sp)
	ldw r4, 24(sp)
	ldw r3, 28(sp)
	ldw r2, 32(sp)
	ldw ra, 36(sp)
	addi sp, sp, 40

    ret


# data section is located at address 0x400
    .data

array1:
    .word 1, 3, 5, 7, 9, 11, 13
array1_size:
    .word 7

array2:
    .word 16, 17, 18
array2_size:
    .word 3

