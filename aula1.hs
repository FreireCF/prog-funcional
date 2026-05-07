ex0r::Bool->Bool->Bool
ex0r True x = not x
ex0r False x = not x

multi:: Int -> Int -> Int 
multi m n
  |m==0 || n==0 = 0
  |otherwise = n + multi (m-1) n

-- função para tratar quando multi (que deveria receber 2 parâmetros) recebe somente 1 
-- f1 = mul 3

fat::Int -> Int
fat n
  |n==0 = 1
  |otherwise = n*fat(n-1)