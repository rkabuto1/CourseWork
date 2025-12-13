{---------------------------------------------------------------------------------------------------------------
Rick Kabuto CS471
Due: November 24 2025

Add your code to this file after the Problem statements. The names of the functions SHOULD NOT BE CHANGED. We 
may grade (parts of) this assignment with a script - if your code doesn't define the functions with the exact names
specified, they will be assumed skipped. We WILL NOT adjust by hand to account for this. Give type signatures for
 all top level functions.

Written answers should be submitted as comments in this file.

Once you've finished editing this file, submit on BrightSpace as normal.
---------------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------------
Running instructions: The lab computers have GHC 8.8.4 installed.  GHC is the most widely used Haskell comiler.
It also comes with an intepreter ghci, which makes it easy to quickly test Haskell code (this is what I've been 
using to demo Haskell in class.) To start ghci, start the command line and type:
    ghci
To (re)load this file type:
    :l HW8.hs

If you want to install GHC on your personal computer, there are a number of options here: 
https://www.haskell.org/downloads/

Keep in mind that submissions are required to work on the lab computers, so even if you are working on your personal 
computer, run a quick test in the lab before submission.
---------------------------------------------------------------------------------------------------------------}

module HW8 where

import Prelude hiding (lookup, iterate, isSubsequenceOf)

{---------------------------------------------------------------------------------------------------------------
Problem 1: Write a function "prodAll" that takes a list of Int's and returns their product. Use pattern matching 
and recursion to directly manipulate the list.

Example:
...> prodAll [2,7,4]
56


prodAll :: [Int] -> Int
prodAll [] = 1
prodAll [a] = a
prodAll (b:c:as) = b * c * prodAll as
---------------------------------------------------------------------------------------------------------------}

prodAll :: (Foldable t, Num a) => t a -> a
prodAll x = product(x)

{---------------------------------------------------------------------------------------------------------------
Problem 2: Define a function composeList which composes a list of unary functions into a single function. The empty 
list should be treated as the identity function. Use pattern matching and recursion to directly manipulate the list.

Example:
...> composeList [ (*) 2, (*) 2] 2
8
...> composeList [ (-) 3 , (*) 2, (+) 5 ] 7 
-21
Notice, the output of composeList [ (-) 3, (*) 2, (+) 5] is the function f(x) = (3 - (2 * (5 + x))).
---------------------------------------------------------------------------------------------------------------}

composeList :: [a -> a] -> (a -> a)
composeList [] = \z -> z
composeList (func:funcs) = \z -> let a = composeList funcs in func (a z)

{---------------------------------------------------------------------------------------------------------------
Problem 3: Write a function iterate that takes a function (f :: a -> a) and a value (x :: a), and returns an 
infinite list of repeated applications of f to x iterate f x == [x, f x, f (f x), f (f (f x)), ...]
---------------------------------------------------------------------------------------------------------------}

iterate :: (t -> t) -> t -> [t]
iterate func y = helpbuild y
  where
    helpbuild z = z : helpbuild (func z)

{---------------------------------------------------------------------------------------------------------------
Problem 4: Write a function isSubsequenceOf that takes two lists and returns True if all elements of the first 
list occur, in order, in the second. The elements do not have to occur consecutively.

Example:
...> isSubsequenceOf [1, 5, 10] [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
True
...> isSubsequenceOf [1, 2, 3] [1, 1, 2]
False
...> isSubsequenceOf [1, 2, 3] [3, 2, 1]
False
---------------------------------------------------------------------------------------------------------------}

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf subs list = recursivehelp subs list
  where
    recursivehelp [] _ = True
    recursivehelp _ [] = False
    recursivehelp (sub:subs) list = 
      case dropWhile (/= sub) list of 
        [] -> False 
        (_:lists) -> recursivehelp subs lists

{---------------------------------------------------------------------------------------------------------------
Problem 5: Short Answer Questions

a) What would be a more logical name for the function f, defined below?  
    Answer)  A more logical name for the function f defined below would be opposite or reverse because we are 
    returning a the original list in reverse order.

b) What is the computational complexity of f, in terms of the length of the input list? (++) is defined as part 
of the Haskell standard library, which is also called the "Prelude". Assume its implementation is the same as was 
presented in class.
    Answer) The computational complexity is O(n²). Its O of n squared because the opeartor ++ is going to transverse
    through the whole list each time it adds an element. Then as the list gets bigger, we transverse through even more 
    elements. These repeated traversals add up across the whole process, resulting in a total cost that grows O(n²)

---------------------------------------------------------------------------------------------------------------}

f :: [a] -> [a]
f [] = []
f (x:xs) = f xs ++ [x]

{---------------------------------------------------------------------------------------------------------------
Problem 6: Write a definition for the inside function, which returns True if and only if point2 lies inside a 
circle of radius around point1. You may add typeclass requirements to inside's type signature, but do not change 
it in any other way.
---------------------------------------------------------------------------------------------------------------}

data Point a = Point a a deriving Show

inside :: (Floating a, Ord a) => a -> Point a -> Point a -> Bool
inside radius p1 p2 = length p1 p2 <= radius
  where
    length (Point a1 b1) (Point a2 b2) = sqrt ((a1 - a2) ^ 2 + (b1 - b2) ^ 2)

{---------------------------------------------------------------------------------------------------------------
Problem 7: Do & and #, as defined below, return the same result in all cases? That is, could you replace any 
occurrence of & with # or any occurrence of # with & in a program, and obeserve the same behavior of the program?  
Explain.
    Answer) No the & operator and the # operator are not going to produce the same result. After testing and
    evaluating the code, the & operator is going to keep the the pattern of Bs from the first value on the left
    while the # operator pushes each B from the left argument into the right argument, changing the tree shape
    which is going to give different orders on how the Bs are built from each scenario.

---------------------------------------------------------------------------------------------------------------}
data AB = A | B AB deriving Show

(&) :: AB -> AB -> AB
A & y = y
(B x) & y = B (x & y)

(#) :: AB -> AB -> AB
A # y = y
(B x) # y = x # B y