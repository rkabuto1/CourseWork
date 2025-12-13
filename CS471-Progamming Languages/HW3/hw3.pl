 /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Rick Kabuto
   Homework Assignment 3
   Programming Languages
   CS471, Spring 2023
   Binghamton University
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Instructions */

/*

This section deals with general submission instructions. Use this
source file. You will be
able to code in and run the file in the prolog interpreter directly. I
recommend reading this assignment directly from the source file.
You will need to rename the source from hw3.txt to hw3.pl.

We will be using swipl for our prolog environment:
 To load/reload this file, cd to its directory and run swipl. Then, in the prompt, type [hw3].
 On the lab computers, you can run swipl by typing `prolog`.

cd PATH_TO_FILE
prolog
[hw3].

From then on you may execute queries (goals) in the prompt.
You should provide your answers in the designated spot. Once you have
added some code to the file, rerun [hw3]. in the swipl prompt to
reload.

In addition, there are unit tests for many of the problems. These are there to
help you better understand what the question asks for, as well as
check your code. They are included in our knowledge base as queries
and are initially commented out -- % is a Prolog line comment.

%:- member_times(4,[3,3,2,3],0). % SUCCEED
%:- member_times(4,[1,2,3],3).   % FAIL

After you have finished a problem and are ready to test, remove the
initial % for each test for the associated problem and reload the
assignment file ([hw3].). Each SUCCEED line should silently load and
succeed, and each FAIL line should throw a WARNING. If a SUCCEED line
throws a WARNING, or a FAIL line fails to, then you solution is not
correct. If you pass the tests there is a good chance that your code
is correct, but not guaranteed; the tests are meant as guided feedback
and are not a check for 100% correctness.

*/

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
For this assignment -- and the remaing Prolog assignments -- you must
submit only the source file. Non-code answers may be written in comments.
Coding should be done directly in hw3.pl.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Homework 3 Due: Friday, February 16th, 11:59 PM 

Purpose: To get comfortable with backtracking, recursion, become familar with reflective mechanism of Prolog, and Prolog as a symbolic programming language.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 1: Indicate whether each of the following will unify or not. If unification will succeed, indicate how each variable will be bound. If unification will 
fail, briefly (a single phrase or sentence) explain why. You may write your answers directly in this comment, or in another comment below this one. You are 
strongly encouraged to:
      (a) first try and answer each problem by hand
      (b) then check your answer using a prolog interpreter.

   1) (T, T) = (B, C).
      Answer) Unify. The way that this would happen is that T will unify with B and T will unify with C resulting the bindings to be T = B, T = C, B = C
   2) (t, t) = (B, C).
      Answer) Unify. B and C are both going to unify with lowercase t which results the bindings to be B = t, C = t.
   3) (T, T) = (b, c).
      Answer) Not Unify. The reason is because we are asking the variable T to be with two different constants, lowererscase b and c, which is going to cause it 
      to fail
   4) [H|T] = [1, 2, 3].
      Answer) Unify. The head of or list is going to be H = 1 and the tail of the list is going to be T = [2,3]
   5) [H|T] = [1].
      Answer) Unify. The result will be H = 1 and T = []
   6) [H|T] = [].
      Answer) Not Unify. This is because we are attempting to match a non empty list with "[]" which is going to fail
   7) f(1, X) = f(Y, 2).
      Answer) Unify. The bindings we are going to get is Y = 1 and X = 2 which is going to give us the result to be {X=2, Y=1}
   8) r(1, X) = f(Y, 2).
      Answer) Not Unify. The reason this is not going to unify is because we are asking to unify two different functors which is going to cause this to fail
   9) r(1, 2) = r(1, 2, X).
      Answer) Not Unify. This is because R/2 is asking for two arguments and R/3 is asking for three arguments. Two functors asking for different number of
      arguments is going to cause this to fail
   10) f(g(X, Y), h(Y)) = f(g(r(T), 2), Z).
      Answer) Unify. We are going to X = r(T), Y = 2, Z = h(Y) having iour final result being {X = r(T), Y = 2, Z = h(2)}
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 2: (Exercise 3.5 from Learn Prolog Now!) Binary trees are trees where all internal nodes have exactly two children. The smallest binary trees consist of 
only one leaf node. We will represent leaf nodes as leaf(Label) . For instance, leaf(3) and leaf(7) are leaf nodes, and therefore small binary trees. Given two 
binary trees B1 and B2 we can combine them into one binary tree using the functor tree/2 as follows: tree(B1,B2) . So, from the leaves leaf(1) and leaf(2) we can 
build the binary tree tree(leaf(1),leaf(2)) . From the binary trees tree(leaf(1),leaf(2)) and leaf(4) we can build tree( tree(leaf(1), leaf(2)), leaf(4)) .
Define a predicate swap/2 , which produces the mirror image of the binary tree that is its first argument. For example:
   ?-  swap( tree( tree(leaf(1), leaf(2)), leaf(4)), T).
   T  =  tree( leaf(4), tree(leaf(2), leaf(1))).
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Problem 2 Answer: */
swap(Tree, Tree) :- Tree = leaf(_).
swap(Tree, X) :- Tree = tree(Left, Right), swap(Left, LeftSwap), swap(Right, RightSwap), X = tree(RightSwap, LeftSwap).

/* Problem 2 Test: */
:- swap( tree( tree(leaf(1), leaf(2)), leaf(4)), T), T  =  tree( leaf(4), tree(leaf(2), leaf(1))).
:- swap(leaf(1), leaf(1)).
:- swap(tree(leaf(1), leaf(2)), tree(leaf(1), leaf(2))) -> fail ; true.

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 3: Write a predicate sumlist(List,Sum) which succeeds if Sum is the total value of all the elements of List. This will be a top down recursion.
The recursion clause will add the current value to the result of the sum of the rest of the list.  We have already provided the base case for this predicate 
underneath 'Problem 1 Answer'. You just need to add the recursive clause.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= *
/* Problem 3 Answer */
sumlist([], 0).
sumlist([X|Xs], Sum) :- sumlist(Xs, Y), add(X, Y, Sum).
add(F, G, Output) :- Output is F + G.

/* Problem 3 Test */
/* There should be no warnings when compiling,tests which are supposed to fail are written as such */
:- sumlist([], 0).
:- sumlist([], 1) -> fail ; true.
:- sumlist([1,2,3,4], 10).
:- sumlist([1], 1).

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 4: Write the predicate sumlist2(List,Sum) which succeeds if Sum is the sum total of all the elements of List. Instead of adding the current value to the
result of the sum of the tail, you will calculate the partial sum of the all the elements you have reached so far. You will need an extra argument to store the 
partial sum, so you will write an auxilitary predicate sumlist2/3 to handle the extra argument.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Problem 4 Answer */
sumlist2(List, Sum) :- sumlist2(List, 0, Sum).
sumlist2(List, Accumulator, Sum) :- List = [], Sum is Accumulator.

sumlist2([X|Xs], Accumulator, Sum) :- update(X, Accumulator, NewAcc), sumlist2(Xs, NewAcc, Sum).
update(Value, Curr, ChangedAccumulator) :- Filler is Value, ChangedAccumulator is Curr + Filler.

/* Problem 4 Test */
:- sumlist2([], 0).
:- sumlist2([], 1) -> fail ; true.
:- sumlist2([1,2,3,4], 10).
:- sumlist2([1], 1).

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 5: Write the predicate sumPartialR(N, SumLst), which succeeds as follows: given a number N, SumLst is a sequence of sums such that first number in
S is the sum of all the numbers from N to 1, the second number in S the sum of all the numbers from N-1 down to 1, and so on. This problem should be solved by 
writing exactly 2 clauses. In other words, SumLst = [N+(N-1)+..+1, (N-1)+(N-2)+..+1, ..., 1]. For example: This problem should be solved by writing exactly 2 clauses.
     ?- sumPartialR(6,S).
     S = [21, 15, 10, 6, 3, 1] .
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Problem 5 Answer */
sumPartialR(N, [1]) :- N = 1.
sumPartialR(N, [X|Xs]) :- N > 1, N1 is N - 1, sumPartialR(N1, Xs), append([Next|_], _, Xs), X is Next + N.

/* Problem 5 Test */
:- sumPartialR(1, [1]).
:- sumPartialR(1, []) -> fail ; true.
:- sumPartialR(2, [3, 1]).
:- sumPartialR(6, [21, 15, 10, 6, 3, 1]).

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 6: We will use a predicate edge(X,Y) to encode a graph. edge(X,Y) is true if there is a directed edge from X to Y. The following is a mini graph encoded 
in Prolog. 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

edge(a,b).
edge(a,f).
edge(a,c).
edge(b,a).
edge(b,c).
edge(b,d).
edge(c,e).
edge(f,e).

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Using your knowledge of backtracking and the findall predicate, write predicates outgoing/2 and incoming/2. outgoing(X,Y) should succeed if Y is a list of all 
immediate vertices reached from X's outgoing edges. incoming(X,Y) should succeed if Y is a list of all vertices that have outgoing edges to X.
You can find definitions of graph terms at https://en.wikipedia.org/wiki/Glossary_of_graph_theory_terms
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Problem 6 Answer */
/* Sources -> https://www.swi-prolog.org/pldoc/man?predicate=bagof/3 */
outgoing(X, Y) :- bagof(Z, (edge(X,Z), member(Z,[a,b,c,d,e,f])), Y), !.
outgoing(_, Y) :- !, Y = [].

incoming(X, Y) :- bagof(Z, (edge(Z,X), member(Z,[a,b,c,d,e,f])), Y), !.
incoming(_, Y) :- !, Y = [].

/* Problem 6 Test */
:- outgoing(a,X), X = [b,f,c].
:- outgoing(e,X), X = [].
:- incoming(a,X), X = [b].
:- incoming(f,X), X = [a].

:- outgoing(e,X), X = [a] -> fail ; true.
:- incoming(e,X), X = [] -> fail ; true.

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 7: A good example of symbolic computation is symbolic differentiation. Below are the rules for symbolic differentiation where U, V are mathematical 
expressions, C is a number constant, N is an integer constant and x is a variable:
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */
/*
       dx/dx = 1
       d(C)/dx = 0.
       d(Cx)/dx = C
       d(-U)/dx = -(dU/dx)
       d(U+V)/dx = dU/dx + dV/dx
       d(U-V)/dx = dU/dx - dV/dx
       d(U*V)/dx = U*(dV/dx) + V*(dU/dx)
       d(U^N)/dx = N*U^(N-1)*(dU/dx)

  Translate these rules into Prolog. (Please keep the order of the rules the same for testing purposes).
  You can use number/1, to check if a value is a number.
*/

/* Problem 7 Answer: */

d(x, 1).
d(C, 0) :- number(C).
d(C*x, C) :- number(C).
d(-U, Y) :- d(U, YU), Y = -YU.
d(U+V, Y) :- d(U, YU), d(V, YV), Y = YU + YV.
d(U-V, Y) :- d(U, YU), d(V, YV), Y = YU - YV.
d(U*V, Y) :- d(U, YU), d(V, YV), Y = U*YV + V*YU.
d(U^N, Y) :- integer(N), N>0, d(U, PU), M is N-1, Y = N*U^M*PU.
d(U^N, Y) :- integer(N), N<0, d(U, PU), M is N-1, Y = N*U^M*PU.

/* Problem 7 Test: */

:- d(x,R), R = 1 .
:- d(7*x,R), R = 7 .
:- d(x +2*(x^3 + x*x),Result), Result = 1+ (2* (3*x^2*1+ (x*1+x*1))+ (x^3+x*x)*0) .
:- d(-(1.24*x -x^3),Result), Result = - (1.24-3*x^2*1) .
:- d(-(1.24*x -2*x^3),Result), Result = - (1.24- (2* (3*x^2*1)+x^3*0)) .

% Pay careful attention to why this fails.
:- d(x +2*(x^3 + x*x),Result), Result = 1+ (2* (3*x^(3-1)*1+ (x*1+x*1))+ (x^3+x*x)*0) -> fail ; true.

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 8: (Adapated from Prolog Minimanual) The towers of Hanoi is a classic puzzle.  In the puzzle, there are three pegs (A, B, and C). Peg A has a stack of 
successively smaller disks on it.  The objective is to move the stack from peg A to peg C, such that:
    1) Disks may only be moved from peg to peg.
    2) Only one disk may be moved at a time.
    3) The only disks that may be moved are the top disks on the pegs.
    4) A disk may only be placed on the base level, or on a larger peg.

You may enjoy trying to work out a technique to move the pegs yourself, so this is a spoiler warning for a solving technique below.Solving: You can solve the 
towers of Hanoi with this recursive algorithm: if N is the number of disks:
      1) move N - 1 disks from the source peg to the spare peg
      2) move the Nth disk from the source peg to the destination peg
      3) Finally, move the N - 1 disks from the spare peg to the destination peg
      
Consider: how is this procedure recursive?  What is the base case?  How do you know when you are finished? The below code is the start of prolog program to 
solve the towers of Hanoi puzzle for an arbitrary N. hanoi(N) will print the solution. Report prints the required steps.  move should recursively call itself and 
call report to output the steps.  However, only the base case of move is provided. Provide a recursive case for move so that hanoi(N) correctly solves the
towers of Hanoi puzzle.  This recusive case should call report, and (by definition of recursion) call move at least once.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Problem 8 Answer: */
/* Source -> https://www.geeksforgeeks.org/c/c-program-for-tower-of-hanoi-2/ */

hanoi(N) :- move(N, source, destination, spare).
report(X, Y) :- write('Move the top disk from the '), write(X), write(' peg to the '),  write(Y), write(' peg.'), nl.

move(0, _, _, _) :- !.
move(N, Pegdisk, TargetPeg, TempPeg) :- N > 0, recursive(N, Pegdisk, TargetPeg, TempPeg).
recursive(N, Pegdisk, TargetPeg, TempPeg) :- N1 is N - 1, 
   move(N1, Pegdisk, TempPeg, TargetPeg), 
   once(report(Pegdisk, TargetPeg)), 
   move(N1, TempPeg, TargetPeg, Pegdisk).

/* Test Cases I created to test my code */ 
%:- hanoi(1).
%:- hanoi(2).
%:- hanoi(3).
%:- hanoi(4).

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Problem 9: The Ackermann function, named for and invented by Wilhelm Ackermann, is one of the earliest discoved total non-primitive recursive functions.  
A total function is a function that is defined on every element of it's input domain (in this case, the natural numbers.)  A primitive recursive function is, 
roughly, a function that can be written as a for loop- that, is the number of required recursive calls has an upper bound. One variation of the Ackermann function 
is: 
  ack(m, n) = n + 1                        if m = 0
  ack(m, n) = ack(m - 1, 1)                if n = 0 and m > 0 
  ack(m, n) = ack(m - 1, ack(m, n - 1))    if n > 0 and m > 0

(There are several different variants of this function. All are called Ackermann's functions and their values do not necessarily agree!) The Ackermann Number 
N of a compiler is the largest N for which ack (3,N)  gives an answer without a stack overflow.  In earlier decades a variation had been used as a of the 
benchmarking algorithms.  
   (a) Define a prolog relation ack/3.  Determine (by testing) the Ackermann Number of your prolog intepreter
   (b) Define a prolog relation ackmemo/3.  This relation should make use of memoization, as discussed in class.

Based on your observations, how does performance of ackmemo compare to ack?
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Based on your observations, how does performance of ackmemo compare to ack? 
   Answer) Based on my observations, the performance of ackmemo/3 is better than ack/3. However, ackmemo/3 uses memoization to store previously 
   computed results in the dynamic database with lookup/3. This means that when the same subproblem is encountered again, the result can be retrieved instantly 
   without recalculating it. This shows that ackmemo/3 avoids redundant computation and runs faster than ack/3.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= */

/* Sources -> https://literateprograms.org/ackermann_function__prolog_.html */

/* Problem 9a Answer: */
ack(X, Y, Z) :- X = 0, Z is Y + 1.
ack(X, Y, Z) :- X > 0, Y = 0, succ(X1, X), ack(X1, 1, Z).
ack(X, Y, Z) :- Y > 0, Y1 is Y - 1, ack(X, Y1, Z1), X1 is X - 1, ack(X1, Z1, Z).

/* Problem 9b Answer: */
:- dynamic lookup/3.

ackmemo(X, Y, Z) :- once(lookup(X, Y, Z)).
ackmemo(X, Y, Z) :- X = 0, Z is Y + 1, asserta(lookup(0, Y, Z)).
ackmemo(X, Y, Z) :- X > 0,  Y = 0, succ(X1, X), ackmemo(X1, 1, Z), asserta(lookup(X, 0, Z)).

ackmemo(X, Y, Z) :- X > 0, Y > 0, Y1 is Y - 1, ackmemo(X, Y1, Z1), red(X, Z1, Z), asserta(lookup(X,Y,Z)).
red(X, Z1, Z) :- X1 is X -1, ackmemo(X1, Z1, Z). 


/* Test Cases For 9A that I created */
:- ack(0, 0, R), R = 1.
:- ack(0, 5, R), R = 6.
:- ack(1, 0, R), R = 2.

/* Test Cases For 9B that I created */
:- ackmemo(0, 0, R), R = 1.
:- ackmemo(1, 1, R), R = 3.
:- ackmemo(3, 1, R1), ackmemo(3, 1, R2), R1 = R2, R1 = 13.