
import System.Environment
import Text.Printf

--Use only concrete types so printf doesn't get confused.
countDNAString :: String -> (Int, Int, Int, Int)
countDNAString s = foldl countChar (0,0,0,0) s
	where countChar (a, c, g, t) ch
		| ch == 'A' = (a+1, c, g, t)
		| ch == 'C' = (a, c+1, g, t)
		| ch == 'G' = (a, c, g+1, t)
		| ch == 'T' = (a, c, g, t+1)
		| ch == ch  = (a, c, g, t)

main = do
	args <- getArgs
	contents <- readFile (head args)
	putStr (let (a, c, g, t) = countDNAString contents;
		in printf "%d %d %d %d" a c g t)

