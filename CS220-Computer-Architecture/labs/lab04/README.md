# Lab 04 - Integer Types

## Lab Goals

This lab demonstrates the limits of the four built-in integer data types in C, and their unsigned counterparts.

## Background - The Factorial Function

In order to demonstrate the limits of the integer types, we will use a very fast growing function from basic math called the factorial function, annotated $x!$. The simple definition of the factorial function is:

$x! = 1 \times 2 \times 3 \times ... \times (x-1) \times x$

The factorial function is often used to describe recursive computation, using the definition...

```c
fact(1) = 1 
fact(n) = n * fact(n-1) for n>1
```

Factorials can be implemented in C any of several ways. The simplest implementation is a loop:

```c
int fact(int n) {
    int answer=1;
    for(int i=1;i<=n;i++>) { answer=answer*i; }
    return answer;
}
```

A recursive implementation of factorials in C is also quite simple:

```c
int fact(int n) {
    if (n==1) return 1;
    return n*fact(n-1);
}
```

Both of these implementations require you to perform the entire calculation each time the function is invoked.

One other option, which is particularly useful for this lab, works when you have already calculated ```fact(n-1)```, and now you want to calculate ```fact(n)```. In this case, you can take the value of ```fact(n-1)``` as an argument, and not have to re-calculate it. This ends up looking like:

```c
int factx(int n,int prevFact) { return n * prevFact; }
```

Then, you need a loop such as:

```c
int prevFact=1;
for(int i=2;i<=n;i++) {
    int fact=factx(i,prevFact);
    prevFact=fact;
}
printf("factorial of %d is %d\n",n,prevFact)
```

This is very simple and **very** efficient.

## Background - The effect of Data Types on Factorials

In all of these examples, I have used an ```int``` data type for both the arguments and the return value. Since C has a maximum value that can fit in an int, eventually the ```n*prevFact``` calculation will create a result that no longer fits in a 32 bit int variable.

In this case, C keeps the rightmost 32 bits and drops the bits to the left. If the leftmost bit is a 1, that indicates a negative value in two's complement arithmetic, which is clearly wrong. In this case, you can check the result very simply...

```c
if (fact(x)<0) {
    // Factorial must have overflowed
}
```

However, it's possible that the result ended up with a leftmost bit of 0, but more overflow bits chopped off, so you end up with a positive but incorrect answer.

One other check we can make is to notice that n! must be divisible by both n and n-1, as long as n is greater than 1. If the factorial overflowed, the probability of the truncated value still being divisible by both n and n-1 is very small. We can code this in C using...

```c
if ((0!=fact(n)%n) || (0!=fact(n)%(n-1))) {
    // Factorial must have overflowed
}
```

This turns out to be a much more effective check for overflow for this lab.

## Provided Code

I have not provided any code for this lab. You have complete control over how you solve the problem in this lab. The only files provided in this repository are this README.md, and an ```answers.txt``` file to provide answers.

I have also provided a template ```Makefile``` that has the basic variables we have used in this course so far.  

## Doing the Lab

Your job today is to write some C code that calculates factorials and determines when the factorial overflows specific data types. You need to do this for data types:

- char
- unsigned char
- short
- unsigned short
- int
- unsigned int
- long
- unsigned long

Your code should print out the last **valid** factorial calculated for each of these types, and the input value that produced that value.

Make sure you update the Makefile in this repository as well to include either implicit or explicit targets to build your executable file, a ```test``` target to run your executable, and a ```clean``` target to remove your executable.

Then, edit the ```answers.txt``` file, and add the values and factorial result for all 6 data types.

The first data type, ```char``` is done for you. A char variable can hold values from -128 to +127. It turns out that 5! = 120, and so that fits in a ```char``` result, but 6!=720, which no longer fits in a ```char``` result. Therefore, for ```char```, the biggest valid value is 5! = 120.

How you write this code is entirely up to you. However, we will check to make sure your code does produce answers for all 8 data types, so please commit and push your code into the repository.

Don't forget to update the Makefile so that both ```make test``` and ```make clean``` produce the correct results.

Note that there are a couple of theoretical questions at the bottom of ```answers.txt``` that need to be answered as well. You shouldn't need to write any new code to answer these questions.

Once your code is working and you have finished editing `answers.txt`, commit and push your results into your master git repository, and get the hash code using `git rev-parse HEAD`. Paste that hash code into the submission area for Lab 04 in Brightspace.

## Lab Grading

This lab is worth 10 points. You will get the full 10 points if the TA's can download your repository using the git hash code from Brightspace onto a computer science machine, and the answers in `answers.txt` are correct. You will receive the following deductions:

- -8 if there are any compile errors in your code.
- -2 if there are any compiler warnings in your code
- -2 if ```make test``` doesn't correctly build and run your code, or if ```make clean``` doesn't clean up your repository.
- -1 For each incorrect answer in `answers.txt`
- -1 For each answer in `answers.txt` questions 2-8 for which your code does not demonstrate how you got the answer.
- -1 if your repository contains any executable file or files.
- -1 if the Brightspace submission occurs after your lab period (A 5 or 10 minute grace period is allowed.)
- -2 for every 24 hours (or part of 24 hours) after the submission date.
