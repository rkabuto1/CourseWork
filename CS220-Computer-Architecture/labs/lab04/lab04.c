#include <stdio.h>
//---------------------------------------------------------------------------------------------------------------------------------
//Factorial For Double Long(Outside the Main Function)
//---------------------------------------------------------------------------------------------------------------------------------
unsigned long long factorial(int n) {
    if (n == 0 || n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}
//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Char
//---------------------------------------------------------------------------------------------------------------------------------
int main() 
{
    char c;
    int LC = 0;
    unsigned long LCResult = 0;
    
    for (c = 0; c <= 127; c++) {
        unsigned long r = factorial(c);
        if (r <= 127) {
            LC = c;
            LCResult = r;
        } else {
            break;
        }
    }

    printf("char: The largest valid x is %d, and %d! = %llu\n", LC, LC, (unsigned long long)LCResult);

//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Unsigned Char   
//---------------------------------------------------------------------------------------------------------------------------------
    unsigned char uc;
    int lUC = 0;
    unsigned long lc1Result = 0;
    
    for (uc = 0; uc <= 255; uc++) {
        unsigned long long r = factorial(uc);
        if (r <= 255) {
            lUC = uc;
            lc1Result = r;
        } else {
            break;
        }
    }

    printf("unsigned char: The largest valid x is %u, and %u! = %llu\n", lUC, lUC, (unsigned long long)lc1Result);

//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Short
//---------------------------------------------------------------------------------------------------------------------------------
    short s;
    int lS = 0;
    unsigned long long lS2Result = 0;
    
    for (s = 0; s <= 15; s++) {
        unsigned long long r = factorial(s);
        if (r <= 32767) {
            lS = s;
            lS2Result = r;
        } else {
            break;
        }
    }

    printf("short: The largest valid x is %d, and %d! = %llu\n", lS, lS, lS2Result);
//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Unsigned Short 
//---------------------------------------------------------------------------------------------------------------------------------
    unsigned short us;
    int larUS = 0;
    unsigned long long VUS = 0;
    
    for (us = 0; us <= 255; us++) {
        unsigned long long r = factorial(us);
        if (r <= 65535) {
            larUS = us;
            VUS = r;
        } else {
            break;
        }
    }

    printf("unsigned short: The largest valid x is %u, and %u! = %llu\n", larUS, larUS, VUS);
//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Int  
//---------------------------------------------------------------------------------------------------------------------------------
    int i;
    int VI = 0;
    unsigned long long VIRESULT = 0;
    
    for (i = 0; i <= 25; i++) {
        unsigned long long r = factorial(i);
        if (r <= 2147483647) {
            VI = i;
            VIRESULT = r;
        } else {
            break;
        }
    }

    printf("int: The largest valid x is %d, and %d! = %llu\n", VI, VI, VIRESULT);
//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Unsigned Int 
//---------------------------------------------------------------------------------------------------------------------------------
    unsigned int ui;
    int VUI = 0;
    unsigned long long VUI1 = 0;
    
    for (ui = 0; ui <= 25; ui++) {
        unsigned long long r = factorial(ui);
        if (r <= 4294967295) {
            VUI = ui;
            VUI1  = r;
        } else {
            break;
        }
    }

    printf("unsigned int: The largest valid x is %u, and %u! = %llu\n", VUI, VUI, VUI1 );
//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Long
//--------------------------------------------------------------------------------------------------------------------------------- 
    long l;
    int VL = 0;
    unsigned long long VLResult = 0;
    
    for (l = 0; l <= 25; l++) {
        unsigned long long r = factorial(l);
        if (r <= 9223372036854775807) {
            VL = l;
            VLResult = r;
        } 
        else 
        {
            break;
        }
    }

   printf("long: The largest valid x is %ld, and %ld! = %llu\n", (long)VL, (long)VL, (unsigned long long)VLResult);



//---------------------------------------------------------------------------------------------------------------------------------
// Factorial for Unsigned Long
//---------------------------------------------------------------------------------------------------------------------------------
    unsigned long long LLUL1 = 1;
    int ULL = 0;
    const unsigned long long maxValue = 18446744073709551615ULL; 

    for (int ul = 1; ; ul++) 
    {
        if (LLUL1 <= maxValue / ul) 
        {
            LLUL1 *= ul;
            ULL = ul;
        } else 
        {
            break;
        }
    }

    printf("unsigned long long: The largest valid x is %d, and %d! = %llu\n", ULL, ULL, LLUL1);

    return 0;
}

//---------------------------------------------------------------------------------------------------------------------------------
