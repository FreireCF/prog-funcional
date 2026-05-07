venda::Int->Int 
venda 0 = 5
venda 1 = 6
venda 2 = 0   
venda 3 = 8
venda 4 = 2
venda 5 = 17

maiorVenda::Int->Int
maiorVenda n
  |n == 0 = venda 0
  |otherwise = max (maiorVenda (n-1)) (venda n)

totalVenda::Int->Int
totalVenda n
  |n ==  0 = venda 0
  |n > 0 = venda n + totalVenda(n-1)
  |otherwise = 0

semanaMaisVenda::Int->Int
semanaMaisVenda n
  |n == 0 = n
  |venda n > maiorVenda (n-1) = maiorVenda(n-1)
  |otherwise = venda n

nadaVendido :: Int -> Bool
nadaVendido n
  |venda n > 0 = False
  |otherwise = True

semanaSemVenda :: Int->Int
semanaSemVenda n
  |n < 0 = 0
  |venda n == 0 = n  
  |otherwise = semanaSemVenda(n-1)

nAnd::Bool -> Bool -> Bool  
nAnd True True = False 
nAnd x y = False 

{-Defina uma função numEquallMax::Int->Int->Int->Int
onde numEquallMax n m p retorna a quantidade de
números iguais ao máximo entre n, m e p-}

numEquallMax::Int->Int->Int->Int
numEquallMax n m p 
  |n == m && m == p = 3
  |n == m && (maximo n m p == n) = 1
  |n == p && (maximo n m p == n) = 1  
  |m == n && (maximo n m p == m) = 1
  |m == p && (maximo n m p == m) = 1 
  |otherwise = 0
  where
    maximo::Int->Int->Int->Int
    maximo x y z
      |x >= (max y z) = x 
      |y >= (max x z) = y 
      |z >= (max x y) = z 