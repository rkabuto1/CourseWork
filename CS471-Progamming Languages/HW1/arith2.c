/* Code of Figure 4.12, pages 105-107 from
   Kenneth C. Louden, Programming Languages
   Principles and Practice 2nd Edition
   Copyright (C) Brooks-Cole/ITP, 2003
*/
#include <stdlib.h>
#include <stdio.h>

char token; /* holds the current input character for the parse */

/* declarations to allow arbitrary recursion */
void command(void);
int expr(void);
// -=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=-
int minus(void); // Added Minus
int divide(void); // Added Divide
int dividetail(int accumulator); // Added the tail for
// -=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=-
int term(void);
int factor(void);
int number(void);
int digit(void);

int isadigit(char c) {
  return (c >= '0' && c <= '9');
}

void error(void) { 
  printf("parse error\n");
  exit(1);
}

void getToken(void) { 
  /* tokens are characters */
  token = getchar();
  if (token == '\t' || token ==' ') { 
    getToken();  /* removes whitespaces on input line */
  }
}
void match(char c) { 
  if (token == c) {
    getToken();
  } else {
    error();
  }
}

void command(void)
{ int result = expr();
  if (token == '\n') {
    printf("The result is: %d\n",result);
  } else {
    error();
  }
}
// -=-=-=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=-
// TODO: Add Expr & Term & Minus & Divide
int expr(void) { 
  int result = minus();
  while (token == '+') { 
    match('+');
    int righthandside = minus();
    result += righthandside;
  }
  return result;
}
int minus(void) {
  int result = term();
  while (token == '-') {
    match('-');
    int righthandside = term();
    result -= righthandside;
  }
  return result;
}
int term(void) { 
  int result = divide();
  while (token == '*') { 
    match('*');
    int righthandside = divide();
    result *= righthandside;
  }
  return result;
}
int divide(void) {
  int lefthandside = factor();
  return dividetail(lefthandside);
}
int dividetail(int accumulator) {
  if (token == '/') {
    match('/');
    int righthandside = factor();
    if (righthandside == 0) {
      error();
    }
    return dividetail(accumulator / righthandside);
  }
  return accumulator;
}
// -=-=-=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=--=-=-=-
int factor(void) { 
  int result;
  if (token == '(') { 
    match('(');
    result = expr();
    match(')');
  } else {
    result = number();
  }
  return result;
}

int number(void) { 
  int result = digit();
  while (isadigit(token)) {
  /* the value of a number with a new trailing digit
    is its previous value shifted by a decimal place
    plus the value of the new digit
  */
    result = 10 * result + digit();
  }
  return result;
}

int digit(void) { 
  int result = 0;
  if (isadigit(token)) { 
    /* the numeric value of a digit character
       is the difference between its ascii value and the
       ascii value of the character '0'
    */
    result = token - '0';
    match(token);
  } else {
    error();
  }
  return result;
}

void parse(void) { 
  getToken(); /* get the first token */
  command(); /* call the parsing procedure for the start symbol */
}

int main() { 
  printf("Type an arithmetic expression and hit enter: ");
  parse();
  return 0;
}