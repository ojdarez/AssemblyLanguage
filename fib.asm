; this program prints fib(0), fib(1) .. fib(n)

msg: dw "Please enter a number:"
n: dw 0
i:	dw 0
@1:	dw 1
@2: dw 2
fibResult: dw 0

start:
	ldc msg
	sout
	din
	st n
	; for (i=0; i<=n; i++) print(fib(i)); 
loop:
	;test if i>n
	ld n 
	sub i
	jn finish
	
	; calculate fib(i)
	ld i
	push 
	aloc 1 ; alocate space for returned value
	; retValue, i
	call fib
	pop
	dout
	dloc 1
	
	ldc ','
	aout
	
	ld i
	add @1
	st i
	ja loop

finish:
	halt
	
fib:
	; if i<=1 return i else return fib(i-1)+fib(i-2)
	ld @1
	; returnAddress, returnValue, i
	subr 2
	jzop ret1
	
	ldr 2
	sub @1
	push 
	aloc 1
	call fib
	; retVal, i-1
	pop
	dloc 1
	
	push ; fib(i-1), retAddr, retVal, i
	
	ldr 3
	sub @2
	
	push 
	aloc 1 
	call fib
	pop
	dloc 1
	addr 0
	str 2 ; retVal = fib(i-1)+fib(i-2)
	dloc 1
	ret

	
	
ret1:
	ldr 2
	str 1
	ret
	