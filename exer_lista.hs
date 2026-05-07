import Control.Monad.Cont (cont)
-- Questões do exer_lista.md

--q1
somaPares::[Int]->Int
somaPares [] = 0
somaPares (x:xs)
  |x`mod`2 == 0 = x + somaPares xs
  |otherwise = somaPares xs


--q2
contImpar::[Int] -> Int 
contImpar [] = 0
contImpar (x:xs)
  |x `mod` 2 /= 0 = 1 + contImpar xs
  |otherwise = contImpar xs 

--q3 
maior::[Int] -> Int
maior [x] = x
maior (x:xs) 
  |x > maior xs = x
  |otherwise = maior xs

--q4
menor::[Int] -> Int
menor[x] = x
menor (x:xs)
  |x < menor xs = x
  |otherwise = menor xs 

--q5
pertence:: Eq a => a -> [a] -> Bool
pertence _ [] = False
pertence n (x:xs)
  |n == x = True
  |otherwise = pertence n xs

--q6
contOcorrencias::Eq a => a -> [a] -> Int
contOcorrencias _ [] = 0
contOcorrencias n (x:xs)
  |x == n = 1 + contOcorrencias n xs
  |otherwise = contOcorrencias n xs  

--q7
dobrarLista::[Int] -> [Int]
dobrarLista [] = []
dobrarLista (x:xs) = 2*x : dobrarLista xs 

--q8
maioresQue::Int -> [Int] -> [Int] 
maioresQue _ [] = []
maioresQue 0 a = a
maioresQue n (x:xs)
  |x>n = x : maioresQue n xs
  |otherwise = maioresQue n xs

--q9
removeN::Int -> [Int] -> [Int]
removeN _ [] = []
removeN n (x:xs) 
  |n == x = removeN n xs
  |otherwise = x : removeN n xs 

--q10
substitui :: Eq a => a -> a -> [a] -> [a]
substitui _ _ [] = []
substitui a b (x:xs)
  |x == a = b : substitui a b xs 
  |otherwise = x : substitui a b xs

--q11 
somaListas::[Int] -> [Int] -> [Int] 
somaListas [] [] = [] 
somaListas (x:xs) (y:ys) 
  = x+y : somaListas xs ys

--q12 
intercalar::[a] -> [a] -> [a] 
intercalar [] [] = []
intercalar (x:xs) (y:ys) 
  = x : y : intercalar xs ys

--q13 
ordenada::[Int] -> Bool
ordenada [] = True
--ordenada (x:xs) 

---q14 
quadrados::[Int] -> [Int] 
quadrados [] = []
quadrados (x:xs) = 
  x*x : quadrados xs

--q15 
positivos::[Int] -> [Int]
positivos [] = [] 
positivos (x:xs) 
  |x >= 0 = x : positivos xs
  |otherwise = positivos xs

--q16
maiorQueZero::[Int] -> Int
maiorQueZero [] = 0
maiorQueZero (x:xs)
  |x >= 0 = 1 + maiorQueZero xs 
  |otherwise = maiorQueZero xs