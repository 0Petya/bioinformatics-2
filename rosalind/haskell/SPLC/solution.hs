import Fasta (readFasta, Fasta(..))
import Sequence (transcribe, translate, Sequence)
import Solve (solveLines)

remove :: Eq a => [a] -> [a] -> [a]
remove xs old = go xs
    where go (y:ys)
            | length (y:ys) >= lold = if take lold (y:ys) == old
                then [] ++ go (drop (lold - 1) ys)
                else y : go ys
            | otherwise = (y:ys)
          lold = length old

splice :: [Sequence] -> Sequence
splice (x:xs) = foldl remove x xs

solve :: [String] -> Sequence
solve = translate . transcribe . splice . reverse . map seq_ . readFasta

main :: IO()
main = solveLines solve
