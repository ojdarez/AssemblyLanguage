; print hello world!

	ldc text
	sout
	
	ldc '\n'
	aout
	
	ldc 0
	st text1+8
	ldc text1+3
	sout 
	
	halt
	
text: dw 'Hello \" \' World!\n\0'
text1: dw "Next string"