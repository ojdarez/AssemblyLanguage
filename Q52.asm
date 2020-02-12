; Solution to question no 2 from Assignment #5

msg1: dw "Please enter a number: "
x: dw 0
sum: dw 0
mainsum: dw 0
i: dw 1
j: dw 1
@1: dw 1
main:
	ldc msg1
	sout
	din
	st x
loop:
	ld x
	sub i ; x - i
	jn finish
	ld i
	push; i
	aloc 1 ;retVal, i
	call adder; returnAdd, retVal, i
	pop
	add mainsum
	st mainsum
	dloc 1
	ld i
	add @1
	st i
	ja loop

adder:
	;returnAdd, retVal, i
	ld @1
	subr 2
	jzop finish1
	ldr 2
	sub @1 ; i - 1
	push ;i - 1, returnAdd, retVal, i
	aloc 1; retVal, i - 1, returnAdd, retVal, i
	call adder ;returnAdd, retVal, i - 1, returnAdd, retVal, i
	pop ; i-1, returnAdd, retVal, i
	dloc 1 ; returnAdd, retVal, i
	addr 2
	str 1
	ret
	
finish1:
	ldr 2
	str 1
	ret
	
finish:
	ld mainsum
	dout
	halt	