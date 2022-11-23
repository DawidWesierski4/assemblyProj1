; program przyk³adowy (wersja 32-bitowa)
.686
.model flat

public _szukaj_max
public _szukaj4_max
public _plus_jeden
public _oppsite_nmbr
public _przestaw


.code
	_szukaj_max PROC
		push ebp ; zapisanie zawartoœci EBP na stosie
		mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
		mov eax, [ebp+8] ; liczba x
		cmp eax, [ebp+12] ; porownanie liczb x i y
		jge x_wieksza ; skok, gdy x >= y
	; przypadek x < y

		mov eax, [ebp+12] ; liczba y
		cmp eax, [ebp+16] ; porownanie liczb y i z
		jge y_wieksza ; skok, gdy y >= z
	; przypadek y < z

	; zatem z jest liczb¹ najwieksz¹
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
		push ebp ; zapisanie zawartoœci EBP na stosie
		mov ebp,esp ; kopiowanie zawartoœci ESP do EBP

		push ebx
		; wpisanie do rejestru EBX adresu zmiennej zdefiniowanej
		; w kodzie w jêzyku C

		mov ebx, [ebp+8]
		mov eax, [ebx] ; odczytanie wartoœci zmiennej

		inc eax ; dodanie 1
		mov [ebx], eax ; odes³anie wyniku do zmiennej
		; uwaga: trzy powy¿sze rozkazy mo¿na zast¹piæ jednym rozkazem
		; w postaci: inc dword PTR [ebx]

		pop ebx
		pop ebp
		ret	
	_plus_jeden ENDP

	_oppsite_nmbr PROC
		push ebp
		mov ebp, esp
		push ebx
		push ecx


		mov ebx, [ebp+8]
		mov eax, [ebx]
		mov ecx, -1
		mul ecx
		mov [ebx], eax

		pop ecx
		pop ebx
		pop ebp
		ret
	_oppsite_nmbr ENDP

	_odejmij_jeden PROC
		push ebp
		mov ebp, esp
		push ebx
		push ecx

		mov ecx, [ebp+8]
		mov ebx, [ecx]
		mov eax, [ebx]

		dec eax
		
		mov [ebx], eax

		pop ecx
		pop ebx
		pop ebp
		ret
	_odejmij_jeden ENDP

	_przestaw PROC
		push ebp ; zapisanie zawartoœci EBP na stosie
		mov ebp,esp ; kopiowanie zawartoœci ESP do EBP
		push ebx ; przechowanie zawartoœci rejestru EBX
		mov ebx, [ebp+8] ; adres tablicy tabl
		mov ecx, [ebp+12] ; liczba elementów tablicy
		dec ecx
		; wpisanie kolejnego elementu tablicy do rejestru EAX

		ptl: mov eax, [ebx]
		; porównanie elementu tablicy wpisanego do EAX z nastêpnym

		cmp eax, [ebx+4]
		jle gotowe ; skok, gdy nie ma przestawiania
		; zamiana s¹siednich elementów tablicy

		mov edx, [ebx+4]
		mov [ebx], edx
		mov [ebx+4], eax
		gotowe:
		add ebx, 4 ; wyznaczenie adresu kolejnego elementu

		loop ptl ; organizacja pêtli
		pop ebx ; odtworzenie zawartoœci rejestrów

		pop ebp
		ret ; powrót do programu g³ównego
	_przestaw ENDP


END
