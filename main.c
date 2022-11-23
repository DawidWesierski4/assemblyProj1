#include <stdio.h>
#include <windows.h>
#include "Main.h"

#define TEST_STEP 13


void zadanie4_1()
{
	SetConsoleOutputCP(1250); //ading the current code page
	int32_t x, y, z, z4, wynik;

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

void zadanie4_2_t()
{
	int32_t n, i;

	for (i = INT32_MIN; i < INT32_MAX; i+=TEST_STEP) {
		n = i;
		oppsite_nmbr(&n);
		if (n != -i) {
			printf("function failed at %d \n", i);
			return;
		}
	}
	printf("oppsite_nmbr passes tests\n");
}

void zadanie4_2()
{
	int32_t n;
	printf("\n Podaj liczbe: ");
	scanf_s("%d", &n);
	printf("\n");
	oppsite_nmbr(&n);
	zadanie4_2_t();

}

void zadanie4_3()
{
	int k;
	int* wsk;
	wsk = &k;
	printf("\nProsze napisac liczbe: ");
	scanf_s("%d", &k, 12);
		odejmij_jeden(&wsk);
	printf("\nWynik = %d\n", k);
	return 0;
}

void zadanie4_4(void)
{
	printf("todo");
}

int32_t main(void)
{

	zadanie4_3();
 	return 0;
}
