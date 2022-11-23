#ifndef MAIN_H
#define MAIN_H

#include <stdint.h>

int32_t szukaj_max(int32_t a, int32_t b, int32_t c);

//acts like szukaj_max but for 4 values
int32_t szukaj4_max(int32_t a, int32_t b, int32_t c, int32_t d);

//egzample of incrising a value
void plus_jeden(int32_t* a);

//returns oppsite number
int32_t oppsite_nmbr(int32_t* a);

void odejmij_jeden(int** liczba);

void przestaw(int tabl[], int n);

#endif /* headerguard main_h */
