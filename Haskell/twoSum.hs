ntwoSums:: [Int] -> Int -> Int -> Bool-> Int-> [(Int, Int)]
ntwoSums [] _ _ _ _ = []
ntwoSums [_] _ _ _ _ = []
ntwoSums (x:y:xs) i j f target
    | target == x + y = [(i, j)]
    | f==True = ntwoSums (x:xs) (i) (j+1) True target
    | otherwise = ntwoSums (x:xs) (i) (j+1) True target ++ ntwoSums (y:xs) (i+1) (j+1) False target
twoSums::[Int] -> Int -> [(Int, Int)]
twoSums (x:y:xs) target = ntwoSums (x:y:xs) (0::Int) (1::Int) False target

main = putStrLn $ show $ head $ twoSums [2,7,11,15] 9