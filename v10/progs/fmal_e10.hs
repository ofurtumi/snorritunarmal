-- Once finished, this file can be compiled
-- and run using GHC and the following commands
-- on the command line:
--    ghc --make fmal_e10.hs
--    fmal_e10

{-
Use:    partition a b x
Pre:    a and b are comparison functions,
        x is a list of values with same type
Value:  three lists containing of the split values of x
        lists are split according to a and b
        first list contains values left of a
        second list contains values right of a and left of b
        third list contains calues right of b
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
Use:    quicksort comp x
Pre:    comp is the comparison operator that the sorting algorithm uses
        available comparison operators: 
            (<) to get a list of ascending values
            (>) to get a list of descending values            
        x is a list of same typed values which is to be sorted
Value:  returns list of values sorted according to comp
-}
quicksort :: (a -> a -> Bool) -> [a] -> [a]
quicksort (<) [] = []
quicksort (<) [x] = [x]
quicksort (<) (x:xs) =
    let
        (p1,p2,p3) = partition (x<) (<x) xs
    in
       quicksort (<) p1 ++ x:p2 ++ quicksort (<) p3

{-
Use:    split x
Pre:    x is a list
Value:  two lists, 
        the first list includes all values where the index is 0 or an even number
        the second list includes all values where the index is an odd number
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
Use:    merge comp x y
Pre:    comp is any of these comparison operators:
            (<), (>), (<=), and (>=)?
        x and y are lists with values of the same type
Value:  merged list of x and y where comp controls the order of merge
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
Use:    mergesort comp x
Pre:    comp is either of the comparison operators, (<), (>)
        x is a list with values of the same type
Value:  sorted list in ascending or descending order
        (<) returns list in ascending order 
        (>) returns list in ascending order 
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
    --- utility function tests
    putStrLn "utility function tests"
    print (partition (>3) (3>) [1,2,3,4,5])
    print (split [1])
    print (merge (>=) [1,2,3,6,3] [1,2,5])

    --- list defined
    let s = repeatList 10 "abcde"
    let i = repeatList 10 "35872"
    putStrLn "\nunsorted string list:"
    putStrLn s
    putStrLn "unsorted integer list:"
    putStrLn i

    --- quicksort tests
    putStrLn "\nquicksort ascending"
    putStrLn (quicksort (>) s)
    putStrLn (quicksort (>) i)

    putStrLn "\nquicksort descending"
    putStrLn (quicksort (<) s)
    putStrLn (quicksort (<) i)
    
    --- mergesort tests
    putStrLn "\nmergesort ascending:"
    putStrLn (mergesort (<) s)
    putStrLn (mergesort (<) i)

    putStrLn "\nmergesort descending:"
    putStrLn (mergesort (>) s)
    putStrLn (mergesort (>) i)
