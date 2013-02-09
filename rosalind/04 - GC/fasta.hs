
module Fasta 
( fastaToDict
, dictToFasta
) where

import Data.List

fastaToDict :: String -> [(String,String)]

fastaToDict str = lineListMapper (lines str)

lineListMapper (('>':label):lns) = (label, concat dnaStrings):(lineListMapper rest)
	where (dnaStrings, rest) = break islabel lns
lineListMapper _ = []

islabel str = (head str) == '>'

dictToFasta :: [(String, String)] -> String

dictToFasta listIn = unlines (concat linesList)
	where linesList = map (\(label, dna) -> ['>':label, dna]) listIn
