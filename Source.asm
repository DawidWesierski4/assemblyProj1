; program przyk�adowy (wersja 32-bitowa)
.686
.model flat

public _szukaj_max
public _szukaj4_max


.code
	_szukaj_max PROC
		push ebp ; zapisanie zawarto�ci EBP na stosie
		mov ebp, esp ; kopiowanie zawarto�ci ESP do EBP
		mov eax, [ebp+8] ; liczba x
		cmp eax, [ebp+12] ; porownanie liczb x i y
		jge x_wieksza ; skok, gdy x >= y
	; przypadek x < y

		mov eax, [ebp+12] ; liczba y
		cmp eax, [ebp+16] ; porownanie liczb y i z
		jge y_wieksza ; skok, gdy y >= z
	; przypadek y < z

	; zatem z jest liczb� najwieksz�
		wpisz_z: mov eax, [ebp+16] ; liczba z
			zakoncz:
				pop ebp
				ret
			x_wieksza:
				cmp eax, [ebp+16] ; porownanie x i z
				jge zakoncz ; skok, gdy x >= z
				jmp wpisz_z
			y_wieksza:
				mov eax, [ebp+12] ; liczba y
				jmp zakoncz
	_szukaj_max ENDP


	_szukaj4_max PROC
		push ebp
		mov ebp, esp;
		mov ecx, ebp;
		add ecx, 20;

		mov ebx, ebx
		add ebx, 8
		mov eax, [ebx]

		loopStart:
			add ebx, 4
			cmp [ebx], eax

			jg ifNotGrater ; if eax our biggest value < stack[ebx]
				mov eax, [ebx]
			ifNotGrater:

			cmp ecx, ebx
			je return	

	return:
		pop ebp
		ret
	_szukaj4_max ENDP

END
