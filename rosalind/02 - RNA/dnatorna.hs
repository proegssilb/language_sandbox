
import System.Environment

dnaToRna :: String -> String

dnaToRna str = map (\c -> if c == 'T' then 'U' else c ) str

main = do
	args <- getArgs
	contents <- readFile (head args)
	putStr (dnaToRna contents)
