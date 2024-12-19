#include "rps.h"
#include <stdlib.h>

rps player_rkabuto1(int x,rps *myhist,rps *opphist) 
{
    if (x == 0) 
    return Paper;
    rps op = opphist[x-1];
    
    if (op == Scissors)
    {
        return Rock;
    }
    else if (op == Rock)
    {
        return Paper;
    } 
   else if (op == Paper)
    {
        return Scissors;
    }
    return Paper;
}


