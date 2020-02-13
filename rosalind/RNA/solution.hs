import Solve (solveFile)
import Sequence (Sequence)

transcribe :: Char -> Char
transcribe nt
    | nt == 'T' = 'U'
    | otherwise = nt

solve :: Sequence -> Sequence
solve = map transcribe

main :: IO()
main = solveFile solve
