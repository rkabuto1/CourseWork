#include "floatx.h"
#include <math.h>
#include <stdio.h>
#include <stdint.h>

static void extractDoubleComponents(double val, int *sign, int *exponent, uint64_t *fraction) {
    uint64_t bits = *(uint64_t *)&val;    
    *sign = (bits >> 63) & 0x1;
    *exponent = (bits >> 52) & 0x7FF;   
    *fraction = bits & 0xFFFFFFFFFFFFF;
   
}

floatx doubleToFloatx(double val, int totBits, int expBits) 
{
    int bFrac = totBits - expBits - 1;   
    int bfloatx = (1 << (expBits - 1)) - 1;    
    int dBias = 1023;
    int sign, exponent;
    uint64_t fraction;
    extractDoubleComponents(val, &sign, &exponent, &fraction);    
   
    if (exponent == 0 && fraction == 0) {
        return (uint64_t)sign << (totBits - 1);
    }     
    int floatxExponent = exponent - dBias + bfloatx;    
    if (exponent == 2047) {     
        if (fraction == 0) {   
            return ((uint64_t)sign << (totBits - 1)) | (((1 << expBits) - 1) << bFrac);
        } else {      
            return ((uint64_t)sign << (totBits - 1)) | (((1 << expBits) - 1) << bFrac) | (fraction != 0);
        }
    }
    if (floatxExponent <= 0) {
        int shiftAmount = 1 - floatxExponent;        
        if (shiftAmount > bFrac) {        
            return (uint64_t)sign << (totBits - 1); 
        }
        fraction = fraction >> shiftAmount;        
        floatxExponent = 0;
    } else if (floatxExponent >= (1 << expBits)) {      
        return ((uint64_t)sign << (totBits - 1)) | (((1 << expBits) - 1) << bFrac); // Overflow to infinity
    }

    int shift = 52 - bFrac;
    if (shift > 0) {
        fraction >>= shift;    
    } else if (shift < 0) {
        fraction <<= -shift;   
    }

    floatx result = ((uint64_t)sign << (totBits - 1)) | ((uint64_t)floatxExponent << bFrac) | (fraction & ((1ULL << bFrac) - 1));
    return result;
}

void testFloatx(double val, int totBits, int expBits) 
{
    floatx result = doubleToFloatx(val, totBits, expBits);
    printf("%g = floatx(%d,%d) : %016lx\n", val, totBits, expBits, result);
}

