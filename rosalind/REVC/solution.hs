complement :: Char -> Char
complement nt
    | nt == 'A' = 'T'
    | nt == 'T' = 'A'
    | nt == 'C' = 'G'
    | nt == 'G' = 'C'
    | otherwise = nt

solve :: String -> String
solve = reverse . map complement

main :: IO()
main = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve $ content
