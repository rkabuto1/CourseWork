#ifndef STRINGLIB_H
#ifdef POINTER_NOTATION
// A string is a Pointer to zero or more characters
typedef char * string;
#else
// A string is a variable length array of characters
typedef char string[];
#endif
int stringLength(string a);
void stringCopy(string a,string b);
void stringCat(string a,string b);
#define STRINGLIB_H
#endif