-- minimalist syntax example
insert:: (Int,Int) -> [(Int,Int)] -> [(Int,Int)]
insert x [] = []
insert x [a] = x:[a]
insert x (a:as) = [x]++[a]++(insert x as)

checkTarget:: Int -> Int -> Int -> Bool
checkTarget x y m = (if (x + y == m) then True else False)

findTarget:: [(Int,Int)] -> Int -> [(Int,Int)]
findTarget [] m = []
findTarget [x] m = []
findTarget (x:xs) m = case (filter (\f-> checkTarget (snd x) (snd f) m) xs) of {
                         [] -> [];
                         [a] -> x:[a];
                         a:as -> insert x (a:as)}

listedtwoSums:: [(Int,Int)] -> Int -> [(Int,Int)] 
listedtwoSums [x] _ = []
listedtwoSums (x:xs) m = (findTarget (x:xs) m) ++ (listedtwoSums xs m)

splitAnswer::[Int] -> [(Int,Int)]
splitAnswer [] = [] 
splitAnswer [a] = []
splitAnswer (a:as) = [(a, (head as))] ++ splitAnswer (tail as) 

twoSums:: [Int] -> Int -> (Int,Int)
twoSums [] _ = (-1,-1)
twoSums [x] _ = (-1,1)
twoSums (x:xs) m = head $ splitAnswer $ (map fst) $ listedtwoSums (zip [0..length xs] (x:xs)) m 

main = putStrLn $ show $ twoSums [2,7,11,15, 1, 2, 7, 8] 9