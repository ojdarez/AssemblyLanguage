; Solution to question no 1 from Assignment #5

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
	sub i
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
	ldc 0
	st sum
	ldc 1
	st j
	ja loop

adder:
	;returnAdd, retVal, i
	ldr 2
	sub j
	jn finish1
	ld j
	add sum
	st sum
	ld j
	add @1
	st j
	ja adder
finish1:
	ld sum
	str 1
	ret
	
finish:
	ld mainsum
	dout
	halt	