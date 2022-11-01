-- Once finished, this file can be compiled
-- and run using GHC and the following commands
-- on the command line:
--    ghc --make fmal_h10.hs
--    fmal_h10

import System.CPUTime

{-
Use:   insertAt z i x
Pre:   z is a list of type [a],
       x is of type a,
       i is an Int, 0<=i<=(length z)
Value: A list of type [a] where x has been
       inserted into z at position i, where
       position 0 is in front of all other
       values.
Note:  Do not change this implementation.
-}
insertAt :: [a] -> Int -> a -> [a]
insertAt z 0 x = x:z
insertAt (z:zs) i x = z:(insertAt zs (i-1) x)

{-
Use:   permutations1 x
Pre:   x is a finite list of type [a].
Value: A list of type [[a]] containing all
       the permutations of x.
Note:  Do not change this implementation.
-}
permutations1 :: [a] -> [[a]]
permutations1 [] = [[]]
permutations1 (x:xs) =
    [ z |   let ps = permutations1 xs,
            let n = length xs,
            z <- [ insertAt p i x | p <- ps, i<-[0..n] ]
    ]

{-
Use:   permutations2 x
Pre:   x is a finite list of type [a].
Value: A list of type [[a]] containing all
       the permutations of x.
-}
permutations2 :: [a] -> [[a]]
permutations2 [] = [[]]
permutations2 (x:xs) =
    concatMap
        ... -- Put some arguments here.
        ... -- Do not use any list comprehensions
        ... -- and call no permutation functions
        ... -- other than permutations2.

{-
Use:   permutations3 x
Pre:   x is a finite list of type [a].
Value: A list of type [[a]] containing all
       the permutations of x.
-}
permutations3 :: [a] -> [[a]]
permutations3 [] = [[]]
permutations3 (x:xs) =
    mapReduceR1
        ... -- put some arguments here
            -- do not use any list comprehensions

{-
Use:   mapReduceR1 f op u x
Pre:   f is of type a->b,
       op is of type c -> b -> c,
       u is of type c,
       x is of type [a], i.e. a list
       [x1,x2,...,xN] of values of
       type a.
Value: A result of type c computed as
       (f x1) ! (f x2) ! ... ! (f xN) ! u
       where a!b = (op a b), computed
       from right to left.
-}
mapReduceR1 :: (a -> b) -> c -> (b -> c -> c) -> [a] -> c
mapReduceR1 f u op [] = u
mapReduceR1 f u op (x:xs) = op ... -- put some arguments here
                                   -- do not use any functions
                                   -- other than f, op, and 
                                   -- mapReduceR1

{-
Use:   mapReduceR2 f op u x
Pre:   f is of type a->b,
       op is of type c -> b -> c,
       u is of type c,
       x is of type [a], i.e. a list
       [x1,x2,...,xN] of values of
       type a.
Value: A result of type c computed as
       (f x1) ! (f x2) ! ... ! (f xN) ! u
       where a!b = (op a b), computed
       from right to left.
-}
mapReduceR2 :: (a -> b) -> c -> (b -> c -> c) -> [a] -> c
mapReduceR2 f u op x = ... -- put some expression here
                           -- do not use any functions
                           -- other than f, op, foldr,
                           -- and map

{-
Use:  dur <- measure s
Pre:  s is a finite list of strings.
      We must be inside the IO monad for
      this call to be legal.
Post: The last string in the list s has
      been written to stdout.
      dur contains the time taken to find
      the last string in s, in picoseconds,
Note: Do not change this implementation.
-}
measure :: [String] -> IO Integer
measure x = do
    start <- getCPUTime
    print (last x)
    end <- getCPUTime
    return (end-start)

{-
Use:   main
Pre:   Nothing.
Post:  Some time measurements and test
       results have been written on stdout
Note:  You may modify this function if you
       wish to do more tests.
-}
main :: IO ()
main = do
    dur <- measure (permutations1 "abcdefghijk")
    print dur
    dur <- measure (permutations2 "abcdefghijk")
    print dur
    dur <- measure (permutations3 "abcdefghijk")
    print dur
    print (mapReduceR1 (^3) 0 (-) [1..100])
    print (mapReduceR2 (^3) 0 (-) [1..100])
