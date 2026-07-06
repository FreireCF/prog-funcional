abono::Int->Int 
abono n
  |n <= 10 = 100
  |n <= 20 = 200
  |n <= 30 = 300
  |n <= 40 = 400
  |otherwise = 500

passagem::Double->Int->Double
passagem x y
  |y >= 60 = x - (x*0.40)
  |y >= 2 && y <= 10 = x - (x*0.5)
  |y < 2 = x - (x*0.9)
  |otherwise = x

--Faça uma função que recebe um numero e retorna verdadeiro se o numero for par.
isEven::Int->Bool
isEven n
  |n `mod` 2 == 0 = True
  |otherwise = False

--recebe duas listas e retorna uma terceiro concatenada
concatena lista1 lista2 = lista2+lista2

produto::[Int]->Int
produto [] = 1
produto (x:xs) = x * produto xs

--recebe uma lista qualquer e retorna o número de elementos na lista (sem usar length)
tamanho::[list] -> Int
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

--função que retorna uma lista com todas as letra do alfabeto
alfabeto = ['a'..'z']

--função que retorna os número de 100 a 0
decrescente = [100,99.. 0]

--funcao que retorna o inverso de uma lista
inverso::[lista]->[lista]
inverso[] = []
inverso (x:xs) = (inverso xs) ++ [x]

--pegar os n primeiros elementos 
n_primeiros:: Int -> [list] -> [list]
n_primeiros 0 _ = []
n_primeiros _ [] = []
n_primeiros n (x:xs) = x : n_primeiros (n-1) xs

--remover os n primeiros elementos 
remove_n_primeiros::Int -> [list] -> [list]
remove_n_primeiros 0 a = a
remove_n_primeiros _ [] = []
remove_n_primeiros n (x:xs) = remove_n_primeiros (n-1) xs

--função que remove o último elemento de uma lista 
remove_ultimo::[a]->[a]
remove_ultimo (x:[]) = []
remove_ultimo (x:xs) = x : remove_ultimo xs