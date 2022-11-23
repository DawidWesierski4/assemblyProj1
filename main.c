#include <stdio.h>
#include <windows.h>
#include <stdlib.h>
#include "Main.h"

#define TEST_STEP 33

int32_t
comp(const void* elem1, const void* elem2)
{
	int32_t f = *((int32_t*)elem1);
	int32_t s = *((int32_t*)elem2);
	if (f > s) return  1;
	if (f < s) return -1;
	return 0;
}

void
zadanie4_1()
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

void
zadanie4_2_t()
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

void
zadanie4_2()
{
	int32_t n;

	printf("\n Podaj liczbe: ");
	scanf_s("%d", &n);
	printf("\n");
	oppsite_nmbr(&n);
	zadanie4_2_t();

}

void
zadanie4_3()
{
	int32_t k;
	int32_t *wsk;
	wsk = &k;

	printf("\nProsze napisac liczbe: ");
	scanf_s("%d", &k, 12);
		odejmij_jeden(&wsk);
	printf("\nWynik = %d\n", k);
	return 0;
}

void
zadanie4_4(void)
{
	int32_t size = 500 / TEST_STEP;
	int32_t result = 0, i = 0;
	int32_t *arr = malloc(4 * size);
	int32_t *arrResult = malloc(4 * size);

	if (!arr || !arrResult) {
		fprintf(stderr, "failed to allocate memory\n");
		return;
	}

	srand(time(0));

	printf("testing array \n{ ");
	for (i = 0; i < size; i++) {
		arr[i] = rand() % 100;
		arrResult[i] = arr[i];
		printf("%2d ", arr[i]);
	}
	printf("}\n");

	qsort(arrResult, size, sizeof(arr[0]), comp);
	for (i = size; i > 1; i--) {
		przestaw(arr, size);
	}

	printf("Result \n{ ");
	for (i = 0; i < size; i++) {
		printf("%2d ", arr[i]);

		if (arr[i] != arrResult[i]) {
			printf("!= %d }\n test failed on indeks:%d \n", arrResult[i], i);
			return;
		}
	}
	printf("}\n");

	//printf("expected Result \n{ ");
	//for (i = 0; i < size; i++) {
	//	printf("%2d ", arrResult[i]);
	//}
	//printf("}\n");
}

int32_t
main(void)
{
	zadanie4_4();
 	return 0;
}
