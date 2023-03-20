twoSums :: [Int] -> Int -> [(Int, Int)]
twoSums [] _ = []
twoSums nums target
  | target > maximum nums = []
  | otherwise = calc 0 nums []
  where
    calc _ [] res = res
    calc i (x:xs) res =
      let indices = filter (\j -> nums !! j == target - x) [i+1..length nums-1]
      in calc (i+1) xs ([(i, j) | j <- indices] ++ res)
 
main = print $ twoSums [2, 7, 11, 15, 2, 7] 9
