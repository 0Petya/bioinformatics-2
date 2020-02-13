import Sequence (Sequence)
import Solve (solveFile)

complement :: Char -> Char
complement nt
    | nt == 'A' = 'T'
    | nt == 'T' = 'A'
    | nt == 'C' = 'G'
    | nt == 'G' = 'C'
    | otherwise = nt

solve :: Sequence -> Sequence
solve = reverse . map complement

main :: IO()
main = solveFile solve
