	.text 				# located at address 0
	.global _start
_start:
	movi	r2, 0
	movi	r3, 10
	movi	r4, 0
dowhile:
	ldb		r5, num(r2)
	add		r4, r4, r5
	addi	r2, r2, 1
	blt		r2, r3, dowhile
	movia	r6, sum
	stw		r4, 0(r6)
end:
	br end
	
	.data
num:
	.byte 1,2,3,4,5,6,7,8,9,10
	.skip 2
sum:
	.word 0
	
	.end