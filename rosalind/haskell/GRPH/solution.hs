import Data.List (intercalate)
import Fasta (Fasta(..), readFasta)
import Solve (solveLines)

findOverlaps3 :: Fasta -> [Fasta] -> [Fasta]
findOverlaps3 Fasta{seq_=sourceSeq} = filter (isOverlap sourceSeq . seq_)
    where isOverlap seqA seqB = seqA /= seqB && (reverse . take 3 . reverse $ seqA) == take 3 seqB

solve :: [String] -> String
solve rawFasta = display . concat $ [[(id_ fasta, id_ overlap) | overlap <- findOverlaps3_ fasta] | fasta <- fastas]
    where fastas = readFasta rawFasta
          findOverlaps3_ = (flip findOverlaps3) fastas
          display = intercalate "\n" . map (\(idA, idB) -> idA ++ " " ++ idB)

main :: IO()
main = solveLines solve
