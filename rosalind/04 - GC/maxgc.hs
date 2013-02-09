
import Data.List
import System.Environment
import Fasta

dnagc :: String -> Double
dnagc str = fromIntegral ((count 'G' str) + (count 'C' str)) / fromIntegral (length str)

count :: Char -> String -> Int	
count c str = length (elemIndices c str)
	
calcGCs :: [(String, String)] -> [(String, String, Double)]
calcGCs dnas = map (\(lbl, dna) -> (lbl, dna, dnagc dna)) dnas

maxGC :: [(String, String)] -> (String, String, Double)
maxGC dnas = last $ sortBy sortfunc (calcGCs dnas)
	where sortfunc dna1 dna2 = compare (third dna1) (third dna2)

third (_, _, c) = c

main = do
	args <- getArgs
	contents <- readFile (head args)
	(label, dna, gc) <- return (maxGC $ fastaToDict contents)
	putStrLn label
	putStrLn (show (gc*100))
