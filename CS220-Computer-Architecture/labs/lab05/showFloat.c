#include <stdio.h> 
#include <stdlib.h> 
#include "bitFields.h" 
#define SIGNBIT 63
#define EXPSTART 62
#define EXPBITS 11
#define FRACSTART 51
#define FRACBITS 52
#define DOUBLEBIAS 1023

int getSign(unsigned long lng);
int getUnbiasedExp(unsigned long lng);
int getBiasedExp(unsigned long lng);
char *getFrac(unsigned long lng, char *buf);

int main(int argc, char **argv) 
{
    union floatlong {
        double fl;
        unsigned long lng;
    } uf;
    char buf[FRACBITS + 1]; 

    if (argc < 2) {
        printf("Please invoke as %s n n ... \n", argv[0]);
        return 1;
    }

    for (int i = 1; i < argc; i++) {
        uf.fl = atof(argv[i]);
        printf("Float %lg : Sign=%d Unbiased Exp=%d Biased=%d Frac=1.%s\n",
               uf.fl, getSign(uf.lng), getUnbiasedExp(uf.lng), getBiasedExp(uf.lng), getFrac(uf.lng, buf));
    }
    return 0;
}

int getSign(unsigned long lng) 
{
    return (lng >> SIGNBIT) & 1; 
}

int getUnbiasedExp(unsigned long lng) 
{   
   return getBitFldU(EXPSTART,EXPBITS, lng); //Call getBitFLDU
}

int getBiasedExp(unsigned long lng) 
{ 
    return getBitFldU(EXPSTART,EXPBITS, lng) - DOUBLEBIAS; //Call getBitFLDU
}
char *getFrac(unsigned long lng, char *buf) 
{
    for (int x = 0; x < FRACBITS; x++) 
    {
        buf[x] = '0' + getBit(FRACBITS - 1 - x, lng);
    }

    buf[FRACBITS] = '\0'; 
    return buf;
}



