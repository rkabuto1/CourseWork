#include "bitFields.h"
#include <assert.h>
#include <stdbool.h>

int getBit(int bn,unsigned long val) 
{
	assert(bn>=0 && bn<64);
	if (1UL<<bn & val) return 1;
	return 0;
}
void setBit(int bn,int new,unsigned long *val) 
{
	assert(bn>=0 && bn<64);
	if (new) (*val)|=1UL<<bn;
	else (*val)&=~(1L<<bn);
}

long getBitFld(int bs, int len, unsigned long val) 
{
    assert(bs >= 0 && bs < sizeof(unsigned long) * 8);
    assert((bs - len + 1) >= 0);
    unsigned long y = getBitFldU(bs, len, val);
    int z = getBit(bs, y);
    if (z != 0) 
    {
        setBit(bs, 1, &val);
    }
    return y;
}

unsigned long getBitFldU(int bs, int len, unsigned long val) 
{
    if (!((bs - len + 1) >= 0)) 
    {
        assert(false);
    }
    if (!(bs >= 0 && bs < sizeof(unsigned long) * 8)) 
    {
        assert(false);
    }
    unsigned long mask = ((1UL << len) - 1) << (bs - len + 1);
    unsigned long x = (val & mask) >> (bs - len + 1);
    return x;
}

void setBitFld(int bs, int len, unsigned long new_val, unsigned long *val) 
{
    if (!((bs - len + 1) >= 0)) 
    {
        assert(false);
    }
    if (!(bs >= 0 && bs < sizeof(unsigned long) * 8)) 
    {
        assert(false);
    }
    unsigned long mask = (1 << len) - 1;
    new_val = (new_val & mask) << (bs - len + 1);
    mask = mask << (bs - len + 1);
    *val = (*val & ~mask) | new_val;
}

