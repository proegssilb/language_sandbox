
import System.Environment

hammdist :: String -> String -> Int
hammdist s1 s2 = sum (map diff (zip s1 s2))
	where diff (c1, c2) = if c1 /= c2 then 1 else 0

main = do 
	args <- getArgs
	contents <- readFile (head args)
	(dna1, dna2) <- return ((lines contents) !! 0, (lines contents) !! 1)
	putStr (show $ hammdist dna1 dna2)
