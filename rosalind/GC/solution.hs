import Data.List (isPrefixOf, sortOn)

type Sequence = String

data FastaSequence = FastaSequence { id_ :: String, seq_ :: Sequence }

readFasta :: [String] -> [FastaSequence]
readFasta [] = []
readFasta (x:xs) = go [FastaSequence x ""] xs
    where go acc [] = acc
          go acc (y:ys)
              | isPrefixOf ">" y = go (FastaSequence (tail y) "" : acc) ys
              | otherwise = go (top { seq_ = seq_ top ++ y } : tail acc) ys
                  where top = head acc

computeGCContent :: Sequence -> Float
computeGCContent seq__ = (*) 100 . flip (/) (fromIntegral $ length seq__) . fromIntegral . length $ filter (\x -> x == 'G' || x == 'C') seq__

solve :: [String] -> String
solve rawFasta = id__ ++ "\n" ++ show gcContent
    where (id__, gcContent) = head . reverse . sortOn snd . map (\FastaSequence{id_=id_, seq_=seq_} -> (id_, computeGCContent seq_)) $ readFasta rawFasta

main :: IO()
main = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve . lines $ content
