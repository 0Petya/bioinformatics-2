import Data.List (intercalate)
import Data.Map.Strict (Map, fromList, (!), adjust)
import Sequence (Sequence)
import Solve (solveFile)

count :: Char -> Map Char Int -> Map Char Int
count nucleotide counts = adjust ((+) 1) nucleotide counts

solve :: Sequence -> String
solve sequence = intercalate " " $ map (show . (!) counts) ['A', 'C', 'G', 'T']
    where counts = foldr count (fromList [(x, 0) | x <- ['A', 'C', 'G', 'T']]) sequence

main :: IO()
main = solveFile solve
