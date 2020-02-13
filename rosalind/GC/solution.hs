import Data.List (sortOn)
import Fasta (Fasta(..), readFasta)
import Sequence (Sequence)
import Solve (solveLines)

computeGCContent :: Sequence -> Float
computeGCContent seq__ = (*) 100 . flip (/) (fromIntegral $ length seq__) . fromIntegral . length $ filter (\x -> x == 'G' || x == 'C') seq__

solve :: [String] -> String
solve rawFasta = id__ ++ "\n" ++ show gcContent
    where (id__, gcContent) = head . reverse . sortOn snd . map (\Fasta{id_=id_, seq_=seq_} -> (id_, computeGCContent seq_)) $ readFasta rawFasta

main :: IO()
main = solveLines solve
