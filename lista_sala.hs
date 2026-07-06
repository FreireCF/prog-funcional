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

--q4 
retira_nesimo:: Int -> [a] -> [a]
retira_nesimo _ [] = []
retira_nesimo n list = take (n-1) list ++ drop n list 

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
retorna_primeira :: [Char] -> [Char] 
retorna_primeira [] = []
retorna_primeira (x:xs)
  |x /= ' ' = x : retorna_primeira xs
 -- |x == ',' = x : retorna_primeira xs
  |otherwise = []

--q9 
move_dir :: [a] -> Int -> [a]
move_dir [] _ = [] 
move_dir list n 
  |n > tam = move_dir list (n `mod` tam)
  |otherwise = drop (tam - n) list ++ take (tam - n) list
  where
    tam = length list

--q10
intercede:: [Int] -> [Int] -> [Int]
intercede x [] = []
intercede [] y = []
intercede l1 l2
  |head l1 == head l2 = head l1 : head l2 : intercede (tail l1) (tail l2)
  |otherwise = intercede (tail l1) (tail l2)

--q11
split::Int -> [Int] -> ([Int], [Int])
split n l1 = (drop n l1, take n l1) 

split_rec :: Int -> [a] -> ([a], [a])
split_rec _ [] = ([], [])
split_rec 0 l = (l , [])  
split_rec n list = (prim, (head list):sec)
  where
    (prim, sec) = split_rec (n-1) (tail list)

{-q12 errada
indices::[a] -> Int -> Int -> [a] 
indices [] _ _ = []
indices _ 0 0 = []
indices l1 a b
  |l1 !! <= b = l1 !! a : [] ++ indices l1 a+1 b 

--q14
-}

-- ordenar_reg:: [(Int,String)] -> [(Int, String)] 
-- ordenar_reg [] = [] 
-- ordenar_reg reg
--   |
--   where 
--     reg = [(15,”Ana”),(22,”Pedro”),(2,”Maria”),(12,”João”),(14,”Pablo”),(23,”Poliana”)]

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
classifica::[(Int, Float, Float)] -> [(Int, String, Float)]
classifica [] = []
classifica ((a,b,c): xs)
  |b <= 0 = (a, "peso inválido", imc) : classifica xs 
  |c <= 0 = (a, "altura inválida", imc)  : classifica xs
  |imc < 18.5 = (a, "baixo peso" , imc) : classifica xs
  |imc < 25 = (a, "peso normal", imc) : classifica xs
  |imc < 30 = (a, "excesso de peso", imc) : classifica xs
  |otherwise = (a, "obesidade", imc) : classifica xs
  where 
    imc = (b/(c*c)) 

--q22 
aux :: Integer -> Integer -> [Integer]
aux _ 0 = []
aux a b
  |a `mod` b == 0 = b : aux a (b-1)  
  |otherwise = aux a (b-1)

divprop :: Integer -> [Integer]
divprop 0 = [0]
divprop n = reverse (aux n (n-1))

--q25
alfabeto = ['A'..'Z']

desloca::  Int -> Char -> String -> Char
desloca 0 c _ = c
desloca n c [] = desloca n c alfabeto
desloca n c (x:xs)
    |c/=x = desloca n c xs
    |otherwise = desloca (n-1) (head xs) xs

cifrar :: Int -> String -> String
cifrar _ [] = []
cifrar n palavra = [desloca n x alfabeto| x<-palavra]

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


--quick sort
qsort[] = [] 
qsort (x:xs) = qsort xs1 ++ [x] ++ qsort xs2
  where 
    xs1 = [x' | x'<-xs, x'<=x]
    xs2 = [x' | x'<-xs, x'>x]

fatores n = [x| x<-[n-1, n-2..1], mod n x == 0]

perfeitos n = [x| x <- [1..n], sum(fatores x) == x]

concatena list = [y| x<-list, y<-x]

-- questão 1 CC10
--  ["casa", "bola", "casa", "rua", "rua", "casa"]
--  [(3, "casa"), (1, "bola"), (2, "rua")]
--  [(3, "casa"), (2, "rua"), (1, "bola")]
-- conta::[String] -> String -> Int
-- conta [] _ = 0
-- conta (x:xs) p
--   |x == p = 1 + conta xs p
--   |otherwise = conta xs p

-- montaTupla::[String] -> String -> (Int, String)
-- montaTupla [] p = (0, p)
-- montaTupla [] = []
-- montaTupla l p = (monta l p, p)

-- percorrer::[String] -> [(Int, String)]
-- percorrer [] = []
-- percorrer (x:xs) = [montaTupla (x:xs) x] ++ percorrer xs
  
-- removePalavra::[String] -> String -> [String]
-- removePalavra (x:xs) p
--   |x == p = removePalavra xs p
--   |otherwise = a:(removePalavra xs p)   