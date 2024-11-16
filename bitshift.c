#include <stdio.h>
#include <stdlib.h>

long btol(const char *str);
void printb(long n);

int main(void) {

    printf("[first binary number] [second binary number]\n");

    // 64 + null terminator
    char str_A[65];
    char str_B[65]; 

    // Einlesen der Binären nummer
    if (scanf("%s %s", str_A, str_B) != 2) 
    {
        printf("Error while reading stdin\n");
        exit(EXIT_FAILURE);
    }

    // den array in eine long ändern
    long A = btol(str_A);
    long B = btol(str_B);

    /*
     * Setze Ergebnis E = 0
     * Wiederhole Solange (B != 0)
     *  Wenn LSB(B) == 1 -> E = E + A 
     *  Schiebe A um eins nach links und B eins nach rechts.
     */

    long E = 0;
    while (B != 0) {
        // Logisches & checkt den Least Significant Bit
        if (B & 1)
        {
            E = E + A;
        }
        A = A << 1;
        B = B >> 1;
        printb(A);
        printf("\n");
        printb(B);
        printf("\n");
    }

    printf("Ergebnis: ");
    printb(E);
    printf("\n");

    return 0;
}


long btol(const char* __str) {
    long result = 0;
    while (*__str) {
        if (*__str == '1' || *__str == '0') {
            result = result * 2 + (*__str - '0');
        }
        __str++;
    }
    return result;
}


void printb(long __n) {
    // wenn __n 0 ist gib einfach genau wieder raus
    if (__n == 0) {
        printf("0");
        return;
    }

    long mask = 1L;
    long temp = __n;
    while (temp >>= 1) {
        mask <<= 1;
    }

    while (mask) {
        /* 
        * Das erste ! konvertiert nicht null zu null und null zu 1 
        * Das zweite ! konvertiert zurück: 0 zu 0 und 1 zu 1 
        *
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *   Hier mit einem !                                                *
        *   __n == 42 (101010)                                              *
        *   mask = 32 (100000)                                              *
        *                                                                   *
        *   42 & 32 = 32 // eine nicht null nummer                          *
        *   !32 = 0 // konvertiert nicht null zu null                       *
        *   Ausgabe: 0 ❌                                                   *
        *                                                                   *
        *   Hier mit zwei !!                                                *
        *   __n = 42 (101010)                                               *
        *   mask = 32 (100000)                                              *
        *                                                                   *
        *   42 & 32 = 32 // nicht null nummer                               *
        *   !32 = 0 // konvertiert nicht null zu null                       *
        *   !!32 = 1 // konvertiert 0 wieder zu 1                           *
        *   Ausgabe: 1 ✅                                                   *
        *                                                                   *
        *                                                                   *
        *   Hier wird das mask erklärt bzw. bit masking                     *
        *                                                                   *
        * https://stackoverflow.com/questions/10493411/what-is-bit-masking  *
        * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
        *
        * wenn der "bit set" ist, dann gibt __n & mask eine nummer größer als 0 raus.
        */
        printf("%d", !!(__n & mask)); 
        mask >>= 1;
    }
}

