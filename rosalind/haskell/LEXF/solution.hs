import Control.Monad (replicateM)
import Data.List (intercalate)
import Solve (solveLines)

solve :: [String] -> String
solve (a:n:[]) = intercalate "\n" . map (intercalate "") $ replicateM (read n :: Int) (words a)

main :: IO()
main = solveLines solve
