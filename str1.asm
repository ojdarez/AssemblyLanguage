msg: dw "Please enter a string:"
buf: dw 100 dup 0
i: dw 0
@1: dw 1

start:
	ldc msg
	sout
	ldc buf
	sin
	ldc buf
	sout
	ldc '\n'
	aout
	
	; for (i==len(str)+buf; i>=buf; i--)
	;   print(mem[i])
	
	; find the last element of the string
	ldc buf
	st i
	
loop1:
	;test if mem[i]==0
	ld i
	ldi ; ac = mem[i]
	jz fin1
	ld i
	add @1
	st i
	ja loop1
	
fin1:
	ld i
	sub @1
	st i
	
loop2:
	; test if i<buf
	ldc buf
	sub i
	jzop fin2
body1:
	; print(mem[i])
	ld i
	ldi
	aout
	
	ld i
	sub @1
	st i
	ja loop2
	
fin2:
	jz body1
	halt
	
	
	
END start