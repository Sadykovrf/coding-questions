checkL:: Int -> Bool

checkL x y l m = (if (l!!x + l!!y == m) then True else False)

twoSums:: [Int] -> Int -> (Int, Int)

twoSums [] _ = (-1,-1)

twoSums l m =  \x y -> (head (filter (\z->) x), g y)

main = putStrLn $ show $ twoSums [2,7,11,15] 9