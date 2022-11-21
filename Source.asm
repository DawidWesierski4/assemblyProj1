; program przyk³adowy (wersja 32-bitowa)
.686
	.model flat
	extern _ExitProcess@4 : PROC
	extern __write : PROC
	extern __read : PROC
	public _main


.data
	helloMsg db 'Hello World'


.code
	zadanie1 PROC;
		pusha
		push dword PTR 11
		push dword PTR OFFSET helloMsg
		push dword PTR 1; numer urz¹dzenia
		call __write
		add esp, 12
		popa
		ret
	zadanie1 ENDP

	_main PROC
		call zadanie1
		;zakoñczenie wykonywania programu
		push dword PTR 0 ; kod powrotu programu
		call _ExitProcess@4 
	_main ENDP

END
