#include "stringLib.h"

// DO NOT use string.h
// DO NOT use array notation (a[x])
// You must use pointer notation (*a) to implement the following 3 functions

int stringLength(char  *a) 
{
	int x = 0; 
    	while (*a != '\0') 
    	{      	
        	x++;
        	a++;
    	}
    return x;
}
void stringCopy(char *a, char *b) 
{	
    	while (*b != '\0') 
    	{        	
        	*a = *b;
        	a++;
        	b++;
    	}
    	*a = '\0';
}
void stringCat(char *a,  char *b) 
{
    while (*a) 
    {
        a++;
    }
    for (;*b; a++, b++) 
    {
        *a = *b;
    }
    *a = '\0';
}
