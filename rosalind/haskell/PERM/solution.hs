import Data.List (intercalate, permutations)
import Solve (solveFile)

solve :: String -> String
solve n = (show $ length xs) ++ "\n" ++ intercalate "\n" [intercalate " " $ map show x | x <- xs]
    where xs = permutations [1..(read n :: Int)]

main :: IO()
main = solveFile solve
