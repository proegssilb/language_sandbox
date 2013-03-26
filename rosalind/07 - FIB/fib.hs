
fibh :: Integer -> Integer -> Integer -> Integer
fibh prev prevprev k = prevprev*k+prev

fibh2 currN maxN k p pp 
	| currN == maxN = fibh p pp k
	|     1 == 1    = fibh2 (currN+1) maxN k (fibh p pp k) p

fib :: Integer -> Integer -> Integer
fib 0 k = 0
fib 1 k = 1
fib n k = fibh2 2 n k 1 0
	where 
