type Sequence = String

hammingDistance :: Sequence -> Sequence -> Int
hammingDistance = (.) (length . filter id) . zipWith (/=)

solve :: [String] -> Int
solve [] = 0
solve (seqA:[]) = 0
solve (seqA:seqB:_) = hammingDistance seqA seqB

main :: IO()
main = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . show . solve . lines $ content
