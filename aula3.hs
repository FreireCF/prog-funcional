venda::Int->Int 
venda 0 = 1
venda 1 = 2
venda 2 = 2   
venda 3 = 10
venda 4 = 0
venda 5 = 18
venda _ = 0

{-Qual o total de vendas desde a semana 0 até a
semana n?-}
maiorVenda::Int->Int
maiorVenda n
  |n == 0 = venda 0
  |otherwise = max (maiorVenda (n-1)) (venda n)

--Qual a maior venda semanal entre as semanas 0 e n
totalVenda::Int->Int
totalVenda n
  |n ==  0 = venda 0
  |n > 0 = venda n + totalVenda(n-1)
  |otherwise = 0

--Em que semana ocorreu a maior venda?
semanaMaisVenda::Int->Int
semanaMaisVenda n
  |n == 0 = 0
  |venda n >= venda (semanaMaisVenda (n-1)) = n
  |otherwise = semanaMaisVenda (n-1)

--Existe alguma semana na qual nada foi vendido?
nadaVendido :: Int -> Bool
nadaVendido n
  |n < 0 = False 
  |venda n == 0 = True
  |otherwise = nadaVendido (n-1)  

--Em qual semana não houve vendas? (se é que houve alguma)
semanaSemVenda :: Int->Int
semanaSemVenda n
  |n < 0 = -1
  |venda n == 0 = n  
  |otherwise = semanaSemVenda(n-1)

{-Defina uma função nAnd::Bool->Bool->Bool que gera
como resultado True, exceto quando ambos os
argumentos são True-}

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