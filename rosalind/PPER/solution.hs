import Solve (solveFile)

nPr :: Int -> Int -> Int
nPr n r = foldl (\a b -> mod (a * b) 1000000) 1 [x..n]
    where x = n - r + 1

solve :: String -> Int
solve params = nPr n r
    where (n, r) = (read a :: Int, read b :: Int)
          (a:b:[]) = words params

main :: IO()
main = solveFile (show . solve)
