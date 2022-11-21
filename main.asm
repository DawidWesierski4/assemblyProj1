.686
	.model flat
	extern _ExitProcess@4 : PROC
	extern __write : PROC 
	public _main

.data
	startingMssg db 'hello world'

.code
	_main PROC
		push dw 12
		push dword PTR OFFSET+1 ;we add one to push the newline
		push dword PTR 1
		call __write
	_main ENDP

END
