import Sequence (Sequence)
import Solve (solveLines)

hammingDistance :: Sequence -> Sequence -> Int
hammingDistance = (.) (length . filter id) . zipWith (/=)

solve :: [Sequence] -> Int
solve [] = 0
solve (seqA:[]) = 0
solve (seqA:seqB:_) = hammingDistance seqA seqB

main :: IO()
main = solveLines (show . solve)
