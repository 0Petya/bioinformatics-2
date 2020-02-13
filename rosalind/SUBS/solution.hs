import Data.List (intercalate)

type Sequence = String

slidingSlice :: Int -> Sequence -> [(Sequence, Int)]
slidingSlice size sequence = go 1 sequence
    where go i s
            | size > length s = []
            | size == length s = [(s, i)]
            | otherwise = (take size s, i) : go (i + 1) (drop 1 s)

findSliceIndicies :: Sequence -> [(Sequence, Int)] -> [Int]
findSliceIndicies t = map snd . filter ((==) t . fst)

solve :: [String] -> String
solve [] = error "Empty file" 
solve (s:[]) = error "No T"
solve (s:t:_) = intercalate " " . map show . findSliceIndicies t $ slidingSlice (length t) s

main :: IO()
main = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve . lines $ content
