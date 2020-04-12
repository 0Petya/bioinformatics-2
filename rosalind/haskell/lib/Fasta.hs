module Fasta where

import Data.List (isPrefixOf)
import Sequence (Sequence)

data Fasta = Fasta { id_ :: String, seq_ :: Sequence } deriving (Show)

readFasta :: [String] -> [Fasta]
readFasta [] = []
readFasta (x:xs) = go [Fasta (tail x) ""] xs
    where go acc [] = acc
          go acc (y:ys)
              | isPrefixOf ">" y = go (Fasta (tail y) "" : acc) ys
              | otherwise = go (top { seq_ = seq_ top ++ y } : tail acc) ys
                  where top = head acc
