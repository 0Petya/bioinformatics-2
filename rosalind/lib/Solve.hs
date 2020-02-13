module Solve where

solveFile :: (String -> String) -> IO()
solveFile solve = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve $ content

solveLines :: ([String] -> String) -> IO()
solveLines solve = do
    putStrLn "Insert file name:"
    fileName <- getLine
    content <- readFile fileName
    putStrLn . solve . lines $ content
