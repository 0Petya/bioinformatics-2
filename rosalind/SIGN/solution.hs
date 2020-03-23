import Data.List (intercalate, nub, permutations)
import Solve (solveFile)

solve :: String -> String
solve n = (show $ length xs) ++ "\n" ++ intercalate "\n" [intercalate " " $ map show x | x <- xs]
    where xs = nub $ filter (\y -> (length . nub $ map abs y) == length y) [take n_ y | y <- permutations (ys ++ map negate ys)]
          ys = [1..n_]
          n_ = read n :: Int

main :: IO()
main = solveFile solve
