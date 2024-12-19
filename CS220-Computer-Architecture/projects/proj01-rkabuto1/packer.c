#include "warehouse.h"
#include "packer.h"
#include <stdio.h>

#define MAX_PARTS 1000 
#define NO -1

static int x = 0; 
static int last[NUMSLOTS] = {0}; 
void processPart(int partNumber) 
{
    int replaceslot = NO;    
    int old = x;
    int b = binFromPart(partNumber);
    x++;  
    for (int i = 0; i < NUMSLOTS; i++)
    {
        if (binInSlot(i) == b) 
        { 
            last[i] = x;
            return;
        }
    }
    for (int i = 0; i < NUMSLOTS; i++) 
    {
        if (binInSlot(i) == EMPTYBIN) 
        {
            replaceslot = i;
            break;
        } 
        else if (last[i] < old) 
        	{
            	old = last[i];
            	replaceslot = i;
        	}
    }
    getBin(b, replaceslot);
    last[replaceslot] = x; 
}

/*---------------------------------------------------------

   Internal Function Definitions

---------------------------------------------------------*/

