--q1
pertence:: Int -> [Int] -> Bool
pertence _ [] = False 
pertence n (x:xs)
  |x == n = True
  |otherwise = pertence n xs

--q2
maior:: [Int] -> Int
maior [x] = x
maior (x:xs)
  |x > maior xs = x
  |otherwise = maior xs

--q3 
n_esimo:: Int -> [Int] -> Int
n_esimo _ [] = -1 
n_esimo n (x:xs)
  |n == 1 = x
  |otherwise = n_esimo (n-1) xs

--q4 NÃO FUNCIONA
retira_nesimo:: Int -> [Int] -> [Int]
retira_nesimo _ [] = []
retira_nesimo n (x:xs) 
  |x == d = retira_nesimo n xs
  |otherwise = x : retira_nesimo n xs
  where 
    d = n_esimo n (x:xs)
  
--q5
inverteLista :: [a] -> [a]
inverteLista [] = [] 
inverteLista (x:xs) = inverteLista xs ++ x:[]

eh_palindromo :: [Char] -> Bool
eh_palindromo [] = True
eh_palindromo lista = lista == inverteLista lista
  
--q6 
elimina_char :: [Char] -> [Char]
elimina_char [] = [] 
elimina_char (x:[]) = [x] 
elimina_char (x:xs)
  |x /= (head xs) = x : elimina_char xs
  |otherwise = elimina_char xs

--q7
duplica :: [Int] -> [Int] 
duplica [] = [] 
duplica (x:xs) = x : x : duplica xs

--q8 
{-
retorna_primeira :: [Char] -> [Char] 
retorna_primeira [] = []
retorna_primeira (x:xs)
  |x /= -} 

--q9 mais ou menos 
{-move_dir :: [a] -> Int -> [a]
move_dir [] _ = [] 
move_dir (x:xs) n
  |n == 0 = []
  |move_dir xs ++ x:[]
  |otherwise = move_dir (x:xs) n  -}

--q10
intercede:: [Int] -> [Int] -> [Int]
intercede l [] = []
intercede [] m = []
intercede l1 l2
  |head l1 == head l2 = head l1 : head l2 : intercede (tail l1) (tail l2)
  |otherwise = intercede (tail l1) (tail l2)

{-q11
split::Int -> [Int] -> ([Int], [Int])
split n l1
  |head l1 > n = ([head l1],[]) 
  |

--q12 errada
indices::[a] -> Int -> Int -> [a] 
indices [] _ _ = []
indices _ 0 0 = []
indices l1 a b
  |l1 !! <= b = l1 !! a : [] ++ indices l1 a+1 b 

--q13
-}

--q15 
intercala::[a]->[a]->[a]
intercala [] l2 = l2
intercala l1 [] = l1
intercala l1 l2 = (head l1) : (head l2) : intercala (tail l1) (tail l2)

--q18
metade :: [a] -> ([a], [a])
metade xs = splitAt (length xs `div` 2) xs

--q19
add_fim :: [a] -> a -> [a]
add_fim [] _ = [] 
add_fim l1 n = l1 ++ [n]

--q20 
passagem :: (Int, Double) -> Double
passagem (idade, valor)
  |idade >= 60 = valor - (valor * 0.4)
  |idade <=2 = valor * 0.1
  |idade <=10 = valor - (valor*0.5)

--q21
classifica::[(Int, Float, Float)] -> [(Int, String)]
classifica [] = []
classifica [(a,b,c)]
  |b <= 0 = [(a, "peso inválido")]  
  |c <= 0 = [(a, "altura inválida")]  
  |imc < 18.5 = [(a, "baixo peso")]
  |imc < 25 = [(a, "peso normal")]
  |imc < 30 = [(a, "excesso de peso")]
  |otherwise = [(a, "obesidade")]
  where 
    imc = (c/(b*b)) 

--q22 
aux :: Integer -> Integer -> [Integer]
aux _ 0 = []
aux a b
  |a `mod` b == 0 = b : aux a (b-1)  
  |otherwise = aux a (b-1)

divprop :: Integer -> [Integer]
divprop 0 = [0]
divprop n = reverse (aux n (n-1))

--q28
intersperse :: a -> [a] -> [a] 
intersperse _ [] = [] 
intersperse a l1 = head l1 : a : intersperse a (tail l1)

--q29
toBits :: Int -> [Int] 
toBits n 
  |n <= 0 = []
  |otherwise = toBits (n `div` 2) ++ n `mod` 2 : []

--q30
fromBits:: [Int] -> Int
fromBits [] = 0 
fromBits l1 = head l1 * (2 ^ ((length l1) - 1)) + fromBits (tail l1)