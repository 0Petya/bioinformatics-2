transcribe :: Char -> Char
transcribe nt
    | nt == 'T' = 'U'
    | otherwise = nt

solve :: String -> String
solve = map transcribe

main :: IO()
main = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve $ content
