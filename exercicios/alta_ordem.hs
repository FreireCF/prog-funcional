{-recebe ou retorna uma função
operador $ para substituir ()

composição de funções
o operador (.) recebe duas funções e retorna outra função que
é a composição das funções de entrada

filtro
a função filter do prelúdio recebe uma função e uma lista de argumento
e filtra os elementos da lista em que a função dada resulta em verdadeira

filter even [1..199] //filtra os pares

função map
recebe uma função e uma lista como argumento
aplica a função a cada elemento da lista

foldl
reduz uma lista usando uma função bin e um valor inicial
associação a esquerda
foldl (+) 0 [1,2,4] ==> 7
foldl (*) 2 [1,2,3] ==> 12

foldr
reduz uma lista usando uma função bin e um valor inicial
associação a direita
foldr (+) 0 [1,2,4] ==> 7
foldr (*) 2 [1,2,3] ==> 12

foldl1 e foldr1 são variantes de foldl e foldl que não tem valor inicial,
e portanto deve ser aplicada a listas não vazias

foldr (+) [1,2,4] ==> 7
foldr (*) [1,2,4] ==> 8

EXERCÍCIOS

Defina funções que tomem uma lista de inteiros L e
▪Retorne a lista dos quadrados dos elementos de L
▪Retorne a soma dos quadrados dos elementos de L
▪Verifique se todos os elementos da lista são positivos
-}

--retorna a lista dos quadrados
quad :: a -> a
quad n = 2*n

list_quad :: [a] -> [a]
list_quad l1 = map quad l1

--retorna a soma dos quadrados dos elementos
soma_quad :: [Int] -> Int
soma_quad l1 = (sum . list_quad) l1

--verifica se todos os num são positivos
positivo :: [Int] -> Bool
positivo [] = True
positivo (x:xs)
    |x<0 = False
    |otherwise = positivo xs