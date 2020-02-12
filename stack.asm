msg: dw "Please enter number : "
count: dw -1
@1: dw 1
main:
	ldc msg
	sout
	st count
	din
	push
	ld count
	add @1
	jn reverse
	ja main

reverse:
	ld count
	jn finish
	pop
	dout
	ldc ','
	aout
	ld count
	sub @1
	st count
	ja reverse
finish: 
	halt
END main
	