#include <stdio.h>
#include "Main.h"
#include <windows.h>

void zadanie4_1()
{
	SetConsoleOutputCP(1250); //ading the current code page
	int x, y, z, z4, wynik;

	printf("\nProszê podaæ trzy liczby ca³kowite: ");
	scanf_s("%d %d %d", &x, &y, &z);

	wynik = szukaj_max(x, y, z);

	printf("\nSpoœród podanych liczb %d, %d, %d, \
	liczba %d jest najwiêksza\n", x, y, z, wynik);

	printf("\nProszê podaæ cztery liczby ca³kowite: ");
	scanf_s("%d %d %d %d", &x, &y, &z, &z4);

	wynik = szukaj4_max(x, y, z, z4);

	printf("\nSpoœród podanych liczb %d, %d, %d, %d \
	liczba %d jest najwiêksza\n", x, y, z, z4, wynik);
}

int main(void)
{
	int m;
	m = -5;
	plus_jeden(&m);
	printf("\n m = %d\n", m);

	return 0;
}
