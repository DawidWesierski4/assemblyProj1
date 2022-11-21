#include <stdio.h>
#include "Main.h"
#include <windows.h>

int main(void)
{
	SetConsoleOutputCP(1250); //ading the current code page
	int x, y, z, wynik;

	printf("\nProszê podaæ trzy liczby ca³kowite: ");
	scanf_s("%d %d %d", &x, &y, &z, 32);
	
	wynik = szukaj_max(x, y, z);

	printf("\nSpoœród podanych liczb %d, %d, %d, \
	liczba %d jest najwiêksza\n", x, y, z, wynik);

	return 0;
}