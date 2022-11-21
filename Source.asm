; program przyk�adowy (wersja 32-bitowa)
.686
.model flat

public _szukaj_max
public _szukaj4_max
public _plus_jeden


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

		mov ebx, ebp
		add ebx, 8
		mov eax, [ebx]

		loopStart:
			add ebx, 4
			cmp eax, [ebx]

			jg ifNotGrater ; if eax our biggest value < stack[ebx]
				mov eax, [ebx]
			ifNotGrater:

			cmp ecx, ebx
			jne loopStart

		pop ebp
		ret
	_szukaj4_max ENDP

	_plus_jeden PROC
		push ebp ; zapisanie zawarto�ci EBP na stosie
		mov ebp,esp ; kopiowanie zawarto�ci ESP do EBP

		push ebx ; przechowanie zawarto�ci rejestru EBX
	; wpisanie do rejestru EBX adresu zmiennej zdefiniowanej
	; w kodzie w j�zyku C

		mov ebx, [ebp+8]
		mov eax, [ebx] ; odczytanie warto�ci zmiennej

		inc eax ; dodanie 1
		mov [ebx], eax ; odes�anie wyniku do zmiennej
		; uwaga: trzy powy�sze rozkazy mo�na zast�pi� jednym rozkazem
		; w postaci: inc dword PTR [ebx]

		pop ebx
		pop ebp
		ret
	_plus_jeden ENDP

END
