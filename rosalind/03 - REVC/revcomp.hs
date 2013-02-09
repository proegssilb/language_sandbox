
import System.Environment

dnaReverseComplement :: String -> String

dnaReverseComplement = reverse . dnaComplement

dnaComplement :: String -> String
dnaComplement str = map baseComp str
	where baseComp c
		| c == 'A' = 'T'
		| c == 'T' = 'A'
		| c == 'C' = 'G'
		| c == 'G' = 'C'
		| c == c = c

main = do
	args <- getArgs
	contents <- readFile (head args)
	putStr (dnaReverseComplement contents)
