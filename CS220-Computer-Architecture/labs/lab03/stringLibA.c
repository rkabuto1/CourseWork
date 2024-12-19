#include "stringLib.h"

// DO NOT use string.h
// DO NOT use pointer notation (*a)
// You must use array notation (a[x]) to implement the following 3 functions

int stringLength(char a[]) 
{
    int x = 0; 
    while (a[x] != '\0') 
    {      
        x++;
    } 
    return x;
}
void stringCopy(char a[], char b[]) 
{
    int i;
    for (i = 0; b[i] != '\0'; i++) 
    {
        a[i] = b[i];
    }

    
    a[i] = '\0';
}


void stringCat(char a[], char b[]) 
{
    int i = 0;
    int j = 0;
    while (a[i] != '\0') 
    {
        i++;
    }  
    while (b[j] != '\0') 
    {
        a[i] = b[j];
        i++;
        j++;
    }  
    a[i] = '\0';
}
