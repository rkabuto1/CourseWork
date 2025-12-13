{---------------------------------------------------------------------------------------------------------
Rick Kabuto
CS471

Add your code to this file in the positions indicated with "Problem N Answer:". The names of the functions 
SHOULD NOT BE CHANGED. We may grade (parts of) this assignment with a script - if your code doesn't define 
the functions with the exact names specified, they will be assumed skipped. We WILL NOT adjust by hand to 
account for this. Give type signatures for all top level functions. Once you've finished editing this file, 
submit on BrightSpace as normal.
---------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------
Running instructions: The lab computers have GHC 8.8.4 installed.  GHC is the most widely used Haskell 
comiler. It also comes with an intepreter ghci, which makes it easy to quickly test Haskell code
(this is what I've been using to demo Haskell in class.) To start ghci, start the command line and type:
    ghci
To (re)load this file type:
    :l HW8.hs

If you want to install GHC on your personal computer, there are a number of options here:
https://www.haskell.org/downloads/

Keep in mind that submissions are required to work on the lab computers, so even if you are working on your 
personal computer, run a quick test in the lab before submission.
---------------------------------------------------------------------------------------------------------}

module HW9 where

import Prelude hiding (map, filter, lookup)

{---------------------------------------------------------------------------------------------------------
Problem 1: Consider the below Map data structure, which allows mapping keys k to values v. Implement insert, 
to insert key/value pairs into the Map.  If you insert a key that is already present, overwrite the existing 
value. Implement lookup, to lookup the value of a particular key (or nothing, if that key is not in the Map.)
Design your functions to use a binary search.

You may add typeclass requirements to the type signatures, but do not change them in any other way.
---------------------------------------------------------------------------------------------------------}
data Map k v = Branch (Map k v) k v (Map k v) | Leaf deriving Show

insert :: Ord k => k -> v -> Map k v -> Map k v
insert key val Leaf = Branch Leaf key val Leaf
insert key val (Branch l k v r) =
  case compare key k of
    LT -> Branch (insert key val l) k v r
    GT -> Branch l k v (insert key val r)
    _  -> Branch l key val r

-- *HW9> insert 5 6 (insert 9 6 (insert 4 12 (insert 7 1 Leaf)))
-- Branch (Branch Leaf 4 12 (Branch Leaf 5 6 Leaf)) 7 1 (Branch Leaf 9 6 Leaf)

lookup :: Ord k => k -> Map k v -> Maybe v
lookup key Leaf = Nothing
lookup key (Branch l k v r) =
  case compare k key of
    EQ -> Just v
    GT -> lookup key l
    _  -> lookup key r

-- *HW9> lookup 9 (Branch (Branch Leaf 4 12 (Branch Leaf 5 6 Leaf)) 7 1 (Branch Leaf 9 6 Leaf))
-- Just 6
-- *HW9> lookup 1 (Branch (Branch Leaf 4 12 (Branch Leaf 5 6 Leaf)) 7 1 (Branch Leaf 9 6 Leaf))
-- Nothing
{---------------------------------------------------------------------------------------------------------
Problem 2: Fill in the below Functor and Foldable instances for Map. Keep in mind that the intializer passed 
to a fold function should be used exactly once. When folding, the values in the Map should be passed to the 
combining operator in descending order of their associated keys (assuming a valid binary tree.) You may find 
it helpful to define a helper function to implement Foldable.
---------------------------------------------------------------------------------------------------------}
instance Functor (Map k) where
    fmap f t =
      case t of
        Leaf -> Leaf
        Branch l k v r ->
          let left  = fmap f l
              right = fmap f r
          in case right of
               _ -> Branch left k (f v) right

-- *HW9> fmap (+ 1) (Branch (Branch Leaf 4 8 Leaf) 9 6 (Branch (Branch Leaf 7 21 Leaf) 8 5 Leaf))                          
-- Branch (Branch Leaf 4 9 Leaf) 9 7 (Branch (Branch Leaf 7 22 Leaf) 8 6 Leaf)

instance Foldable (Map k) where
    foldr f z t =
      case t of
        Leaf -> z
        Branch l k v r ->
          case foldr f z r of
            combined -> foldr f (f v combined) l

-- *HW9> foldr (-) 0 (Branch (Branch Leaf 4 8 Leaf) 6 6 (Branch (Branch Leaf 7 21 Leaf) 8 5 Leaf))  
-- 18

{---------------------------------------------------------------------------------------------------------
Problem 3: Hoogle is a search engine for Haskell functions: https://hoogle.haskell.org You can enter function 
names, type names, or typeclass names into Hoogle to find those functions. You can also enter types, and 
find functions with those types.  For example, if you enter: (p -> q) -> [p] -> [q]. Hoogle will find the 
function: map :: (a -> b) -> [a] -> [b] (and a large number of slight variants on map.)

The Applicative typeclass extends Functors to allow applying functions wrapped in a Functor. Look up Applicative 
using Hoogle. Also note the laws for the Applicative typeclass. You will need to consider these laws to answer
the following question.

Consider the below definition of an Applicative instance for Map. What is wrong with this definition of Applicative?  
Is it fixable?  Explain. Write your answer in a comment.
---------------------------------------------------------------------------------------------------------}

instance Ord k => Applicative (Map k) where
    pure x = Leaf
    m1 <*> m2 = foldr f Leaf (keyValPairs m2) 
        where
            f (k, v) m = case lookup k m1 of
                                Just f -> insert k (f v) m
                                Nothing -> m

keyValPairs :: Map k v -> [(k, v)]
keyValPairs (Branch l k v r) = keyValPairs l ++ (k, v):keyValPairs r
keyValPairs Leaf = []


{- Problem 3 Answer: The problem is not fixable because a normal Map cannot satisfy the laws for Applicative. 
Pure is already wrong because pure must put a value into the structure, but pure x = Leaf throws the value away. 
This breaks the Applicative identity law. Furthermore,the operator <*> cannot work either. Applicative needs 
both structures to line up. Map lines up by keys. Two maps can have different keys, so their shapes will not 
match. -}

{---------------------------------------------------------------------------------------------------------
Problem 4: Both map and filter can be defined by passing the correct function and initalizer to foldr.
Fill in the below two definitions to define map and filter using foldr.
---------------------------------------------------------------------------------------------------------}
map :: (a -> b) -> [a] -> [b]
map f = foldr ((:) . f) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr step []
  where step x = if p x then (x:) else id

{---------------------------------------------------------------------------------------------------------
Problem 5: Write a function `member` that checks if an element exists in a Foldable structure. Your function 
should terminate when passed an infinite structure if the element exists a finite distanace from the left 
hand side.

You may use any function(s) from the Foldable type class EXCEPT the built in `elem` function (this question is 
essentially asking you to implement elem.)

ghci> 3 `member` [1, 2, 3, 4, 5]
True
ghci> 3 `member` [1, 2, 4, 5]
False
ghci> 3 `member` ([1, 2, 4, 5] ++ [1..])
True
---------------------------------------------------------------------------------------------------------}
member :: (Foldable t, Eq a) => a -> t a -> Bool
member x = any (== x)

{---------------------------------------------------------------------------------------------------------
Problem 6: Peano numbers are a way of representing the natural numbers using a Zero constructor and a Succ 
(or Successor) constructor.
    - 0 is represented as Zero.
    - 1 is represented as (Succ Zero).
    - 2 is represented as (Succ (Succ Zero)).
    - 3 is represented as (Succ (Succ (Succ Zero))).
    - And so on...
---------------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------------
(6a) Use a deriving clause to get Eq, Ord, and Show instances for the below definition of Peano numbers.
Test the instances.  What bug do you notice?  Adjust the data definition to fix the bug.
---------------------------------------------------------------------------------------------------------}
data Peano = Base | Step Peano deriving (Eq, Ord, Show)

{- The bug that I noticed is that when you write Zero after Succ, then we get an error. This is because
Haskell is going to compare constructors in the order that they are defined. So if Succ comes first,
then every sucessor number is seen as smaller than Zero. Therefore, we need to put Zero first. -}

{---------------------------------------------------------------------------------------------------------
(6b) Using Hoogle, look up the Enum typeclass.  Define (by hand) an instance of Enum for Peano. (In practical 
cases, Enum can be derived, just like Eq or Ord.) You may assume that toEnum is passed a non-negative Int.
---------------------------------------------------------------------------------------------------------}
instance Enum Peano where
    toEnum n = case compare n 0 of EQ -> Base; _ -> Step (toEnum (pred n))
    fromEnum x = case x of Base -> 0; Step nxt -> succ (fromEnum nxt)

{---------------------------------------------------------------------------------------------------------
(c) Define an instance of Num for Peano. Strictly speaking, Num does not have any laws, but often instances 
are expected to form a Ring -> https://mathworld.wolfram.com/Ring.html 

Is this possible in the case of Peano?  Are there compromises or decisions you had to make in defining the 
Num instance?   Explain in a comment.

Problem 6c Answer: A full Ring structure is impossible because Peano numbers only represent non-negative 
integers. There is no additive inverse, so subtraction and negation cannot be properly defined. We approximate 
Num by defining negate as an error and omitting negative results.
---------------------------------------------------------------------------------------------------------}
instance Num Peano where
    Base + n = n
    Step m + n = Step (m + n)

    Base * _ = Base
    Step m * n = n + (m * n)

    abs x = x
    signum x = case x of Base -> Base; Step _ -> Step Base
    fromInteger i = case compare i 0 of EQ -> Base; _ -> Step (fromInteger (i - 1))
    negate _ = error "Error"

{--------------------------------------------------------------------------------------------------------
(d) Define an instance of Foldable for Peano, or explain why defining an instance of Foldable for Peano is 
not possible/does not make sense. 
---------------------------------------------------------------------------------------------------------}

{-Problem 6d Answer: Defining Foldable for Peano does not make sense because Peano represents a single numeric 
quantity. So, there is no sequence or container structure to traverse. -}