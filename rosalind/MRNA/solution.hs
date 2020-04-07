import Data.Map.Strict (Map, fromList, (!))
import Sequence (Sequence)
import Solve (solveFile)

aminoAcidCounts :: Map Char Int
aminoAcidCounts = fromList [('R', 6), ('V', 4), ('T', 4), ('A', 4), ('G', 4), ('S', 6), ('P', 4), ('F', 2), ('L', 6), ('Y', 2), ('*', 3), ('C', 2), ('W', 1), ('I', 3), ('M', 1), ('H', 2), ('N', 2), ('D', 2), ('Q', 2), ('K', 2), ('E', 2)]

solve :: Sequence -> Int
solve = foldl (\a b -> mod (a * b) 1000000) 1 . map ((!) aminoAcidCounts) . (++) "*"

main :: IO()
main = solveFile (show . solve)
