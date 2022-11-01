-- Once finished, this file can be compiled
-- and run using GHC and the following commands
-- on the command line:
--    ghc --make fmal_e10.hs
--    fmal_e10

{-
Use:   ...? (Put the appropriate text here)
Pre:   ...? (Put the appropriate text here)
Value: ...? (Put the appropriate text here)
Hints: The reader of this description needs
       to know what conditions are fulfilled
       by the values in each of the three
       lists in the triple returned.
-}
partition :: (a -> Bool) -> (a -> Bool) -> [a] -> ([a],[a],[a])
partition a b [] = ([],[],[])
partition a b (x:xs) =
    let
        (p1,p2,p3) = partition a b xs
    in
        if a x then
            (x:p1,p2,p3)
        else if b x then
            (p1,p2,x:p3)
        else
            (p1,x:p2,p3)

{-
Use:   ...? (Put the appropriate text here)
Pre:   ...? (Put the appropriate text here)
Value: ...? (Put the appropriate text here)
Hints: The reader of this description needs
       to know (among other things) what
       comparison operators are appropriate.
       For example can we use any or all of
       the following to sort numbers: (<),
       (>), (<=), and (>=)?
-}
quicksort :: (a -> a -> Bool) -> [a] -> [a]
quicksort (<) [] = []
quicksort (<) [x] = [x]
quicksort (<) (x:xs) =
    let
        (p1,p2,p3) = partition (<x) (x<) (x:xs)
    in
        -- (quicksort (<) p3) ++ p2 ++ (quicksort (<) p1)
       quicksort (<) p1 ++ p2 ++ quicksort (<) p3

{-
Use:   ...? (Put the appropriate text here)
Pre:   ...? (Put the appropriate text here)
Value: ...? (Put the appropriate text here)
-}
split :: [a] -> ([a],[a])
split [] = ([],[])
split [x] = ([x],[])
split (x1:x2:xs) =
    let
        (p1,p2) = split xs
    in
        (x1:p1,x2:p2)

{-
Use:   ...? (Put the appropriate text here)
Pre:   ...? (Put the appropriate text here)
Value: ...? (Put the appropriate text here)
Hints: The reader of this description needs
       to know (among other things) what
       comparison operators are appropriate.
       For example can we use any or all of
       the following to sort numbers: (<),
       (>), (<=), and (>=)?
-}
merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
merge (<) [] x = x
merge (<) x [] = x
merge (<) (x:xs) (y:ys) =
    if x<y then
        x : (merge (<) xs (y:ys))
    else
        y : (merge (<) (x:xs) ys)

{-
Use:   ...? (Put the appropriate text here)
Pre:   ...? (Put the appropriate text here)
Value: ...? (Put the appropriate text here)
Hints: The reader of this description needs
       to know (among other things) what
       comparison operators are appropriate.
       For example can we use any or all of
       the following to sort numbers: (<),
       (>), (<=), and (>=)?
-}
mergesort :: (a -> a -> Bool) -> [a] -> [a]
mergesort (<) [] = []
mergesort (<) [x] = [x]
mergesort (<) xs =
    let
        (p1,p2) = split xs
    in
        merge (<) (mergesort (<) p1) (mergesort (<) p2)
        

{-
Use:   repeatList n x
Pre:   x is some list of type [a],
       n is an Int, n>=0.
Value: The list that results from concatenating
       x with itself n times.
Note:  Do not change this implementation.
-}
repeatList :: Int -> [a] -> [a]
repeatList 0 x = []
repeatList n x = x++(repeatList (n-1) x)

{-
Use:   main
Pre:   Nothing.
Post:  Some test results have been written
       to stdout.
Note:  You may modify this function if you
       wish to do more tests.
-}
main :: IO ()
main = do
    --- list defined
    let s = repeatList 10 "abcde"
    let i = repeatList 10 "35872"
    putStrLn "unsorted string list"
    putStrLn s
    putStrLn "unsorted integer list"
    putStrLn i

    --- quicksort tests
    putStrLn "\nquicksort descending"
    putStrLn (quicksort (<) s)
    putStrLn (quicksort (<) i)

    putStrLn "\nquicksort ascending"
    putStrLn (quicksort (>) s)
    putStrLn (quicksort (>) i)
    
    --- mergesort tests
    putStrLn "\nmergesort ascending:"
    putStrLn (mergesort (>) s)
    putStrLn (mergesort (>) i)

    putStrLn "\nmergesort descending:"
    putStrLn (mergesort (<) s)
    putStrLn (mergesort (<) i)
