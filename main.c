#include <stdio.h>
#include "Main.h"
#include <windows.h>

int main(void)
{
	SetConsoleOutputCP(1250); //ading the current code page
	int x, y, z, z4, wynik;

	printf("\nProsz� poda� trzy liczby ca�kowite: ");
	scanf_s("%d %d %d", &x, &y, &z);
	
	wynik = szukaj_max(x, y, z);

	printf("\nSpo�r�d podanych liczb %d, %d, %d, \
	liczba %d jest najwi�ksza\n", x, y, z, wynik);

	printf("\nProsz� poda� cztery liczby ca�kowite: ");
	scanf_s("%d %d %d %d", &x, &y, &z, &z4);

	wynik = szukaj4_max(x, y, z, z4);

	printf("\nSpo�r�d podanych liczb %d, %d, %d, \
	liczba %d jest najwi�ksza\n", x, y, z, wynik);

	return 0;
}