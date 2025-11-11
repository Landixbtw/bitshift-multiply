#include <type_traits>
#include <cstdint>
#include <iostream>

// diff with algoright
//

/*
 *Setze E = 0, R = A 
 Wiederhole solange R >= B
    R = R + 2K(B)
    E = E + 1
Ergebnis: E mit Rest R
 **/

template <typename T>
T twos_complement(T val);

int main(void)
{
    std::cout << "First whole int: ";
    int A = 0; 
    std::cin >> A;

    std::cout << "Second whole int: ";
    int B = 0;
    std::cin >> B;

    int E = 0;
    int R = A;

    while(R >= B)
    {
        R = R + (int)twos_complement(B);
        E += 1;
    }
    std::cout << "Ergebnis: " << E << " Rest " << R << "\n";
}

// Source - https://stackoverflow.com/a
// Posted by zwol, modified by community. See post 'Timeline' for change history
// Retrieved 2025-11-11, License - CC BY-SA 4.0


template <typename T>
T twos_complement(T val)
{
    typedef typename std::make_unsigned<T>::type U;

    return T(-uintmax_t(U(val)));
}
