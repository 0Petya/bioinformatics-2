module Sequence where

import Data.Map.Strict (Map, fromList, (!))

type Sequence = String

data Codon = Ok Char | Stop

codonTable :: Map Sequence Codon
codonTable = fromList [("UUU", Ok 'F'), ("CUU", Ok 'L'), ("AUU", Ok 'I'), ("GUU", Ok 'V'), ("UUC", Ok 'F'), ("CUC", Ok 'L'), ("AUC", Ok 'I'), ("GUC", Ok 'V'), ("UUA", Ok 'L'), ("CUA", Ok 'L'), ("AUA", Ok 'I'), ("GUA", Ok 'V'), ("UUG", Ok 'L'), ("CUG", Ok 'L'), ("AUG", Ok 'M'), ("GUG", Ok 'V'), ("UCU", Ok 'S'), ("CCU", Ok 'P'), ("ACU", Ok 'T'), ("GCU", Ok 'A'), ("UCC", Ok 'S'), ("CCC", Ok 'P'), ("ACC", Ok 'T'), ("GCC", Ok 'A'), ("UCA", Ok 'S'), ("CCA", Ok 'P'), ("ACA", Ok 'T'), ("GCA", Ok 'A'), ("UCG", Ok 'S'), ("CCG", Ok 'P'), ("ACG", Ok 'T'), ("GCG", Ok 'A'), ("UAU", Ok 'Y'), ("CAU", Ok 'H'), ("AAU", Ok 'N'), ("GAU", Ok 'D'), ("UAC", Ok 'Y'), ("CAC", Ok 'H'), ("AAC", Ok 'N'), ("GAC", Ok 'D'), ("UAA", Stop), ("CAA", Ok 'Q'), ("AAA", Ok 'K'), ("GAA", Ok 'E'), ("UAG", Stop), ("CAG", Ok 'Q'), ("AAG", Ok 'K'), ("GAG", Ok 'E'), ("UGU", Ok 'C'), ("CGU", Ok 'R'), ("AGU", Ok 'S'), ("GGU", Ok 'G'), ("UGC", Ok 'C'), ("CGC", Ok 'R'), ("AGC", Ok 'S'), ("GGC", Ok 'G'), ("UGA", Stop), ("CGA", Ok 'R'), ("AGA", Ok 'R'), ("GGA", Ok 'G'), ("UGG", Ok 'W'), ("CGG", Ok 'R'), ("AGG", Ok 'R'), ("GGG", Ok 'G')]

translate :: Sequence -> Sequence
translate = go
    where go (a:b:c:xs) = case codonTable ! [a, b, c] of
            Ok aminoAcid -> aminoAcid : go xs
            Stop -> []
          go _ = []

transcribe :: Sequence -> Sequence
transcribe = map go
    where go nt
            | nt == 'T' = 'U'
            | otherwise = nt
