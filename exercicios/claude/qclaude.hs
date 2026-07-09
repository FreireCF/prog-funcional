{-1. Escreva uma função polimórfica chamada mapeiaCondicional que receba como parâmetro uma
  função de retorno booleano e duas outras funções, além de uma lista de um tipo qualquer. Para
  cada elemento da lista, se a primeira função retornar True o elemento deve ser transformado pela
  segunda função, caso contrário deve ser transformado pela terceira função.
  Exemplo:
  mapeiaCondicional even (*2) (+1) [1,2,3,4] = [2,4,4,8] -}

--mapeiaCondicional :: (t->Bool) -> (t->t->t) -> (t->t->t) -> [t] -> [t]
mapeiaCondicional _ _ _ [] = []
mapeiaCondicional f1 f2 f3 (x:xs)
    |f1 x == True = (f2 x) : mapeiaCondicional f1 f2 f3 xs
    |otherwise = (f3 x) : mapeiaCondicional f1 f2 f3 xs

{-2. Escreva uma função polimórfica chamada combinaAteMenor que receba como parâmetro uma
função binária e duas listas de tipos quaisquer. A função deve combinar as listas elemento a
elemento até que a menor delas se esgote.
Exemplo:
combinaAteMenor (+) [1,2,3] [10,20] = [11,22]-}
combinaAteMenor :: (t->t->t) -> [t] -> [t] -> [t]
combinaAteMenor _ [] _ = []
combinaAteMenor _ _ [] = []
combinaAteMenor f1 (x:xs) (y:ys) = (f1 x y) : combinaAteMenor f1 xs ys

{-3. Escreva uma função polimórfica chamada contaSatisfazendoAninhada que receba como
  parâmetro uma função de retorno booleano e uma lista de listas de um tipo qualquer. A função deve
  retornar a quantidade total de elementos, dentre todas as sublistas, que satisfazem a condição.
  Exemplo:
  contaSatisfazendoAninhada even [[1,2,3],[4,5],[6]] = 3-}

contaSatis :: (t->Bool) -> [[t]] -> Int
contaSatis f1 l1 = length [(filter (f1) x)| x<-l1]

{-4. Escreva uma função polimórfica chamada particiona que receba como parâmetro uma função de
  retorno booleano e uma lista de um tipo qualquer. A função deve retornar uma tupla contendo, na
  primeira posição, os elementos que satisfazem a condição e, na segunda posição, os elementos
  que não satisfazem, mantendo a ordem original.
  Exemplo:
  particiona even [1,2,3,4,5,6] = ([2,4,6],[1,3,5])-}

particiona :: (t->Bool) -> [t] -> ([t],[t])
particiona f1 l = ([x| x<-filter f1 l], [y| y<-filter (not . f1) l])

{-5. Escreva uma função polimórfica chamada removeAdjacentesIguais que receba como parâmetro
  uma lista de um tipo qualquer. A função deve remover elementos duplicados que estejam lado a
  lado, mantendo apenas a primeira ocorrência de cada sequência.
  Exemplo:
  removeAdjacentesIguais "aabbbcca" = "abca"-}
removeAdjacentesIguais:: Eq t => [t] -> [t]
removeAdjacentesIguais [] = []
removeAdjacentesIguais [x] = [x]
removeAdjacentesIguais (x:xs)
    |x /= (head xs) = [x] ++ removeAdjacentesIguais xs
    |otherwise = removeAdjacentesIguais xs

{-6. Escreva uma função polimórfica chamada iteraAte que receba como parâmetro uma função, uma
  função de retorno booleano e um valor inicial de um tipo qualquer. A função deve aplicar
  repetidamente a primeira função ao valor, acumulando cada resultado em uma lista, até que o
  resultado satisfaça a condição (o elemento que satisfaz a condição deve ser incluído na lista).
  Exemplo:
  iteraAte (*2) (>20) 1 = [1,2,4,8,16,32]
  vai aplicando o parâmetro na função até satisfazer o condição (intervalo aberto)
  -}
iteraAte :: (t->t) -> (t->Bool) -> t -> [t]
iteraAte f1 f2 i
    |f2 i == True = [i]
    |otherwise = i: iteraAte f1 f2 (f1 i)

{-7. Escreva uma função polimórfica chamada indexaLista que receba como parâmetro uma lista de um
  tipo qualquer. A função deve retornar uma lista de tuplas associando cada elemento ao seu índice,
  começando em 0.
  Exemplo:
  indexaLista "abc" = [(0,'a'),(1,'b'),(2,'c')]-}
gambiarra :: Int -> Int
gambiarra n = n+1

indexaLista :: [t] -> [(Int, t)]
indexaLista [] = []
indexaLista list = zip [i| i<-[0..length list]] [c| c<-list]

{-8. Escreva uma função polimórfica chamada filtraPorIndice que receba como parâmetro uma função
  de retorno booleano (que opera sobre índices) e uma lista de um tipo qualquer. A função deve
  retornar apenas os elementos cujas posições satisfazem a condição.
  Exemplo:
  filtraPorIndice even [10,20,30,40,50] = [10,30,50]-}

filtraPorIndice :: (Num t, Enum t) => (t->Bool) -> [u] -> [u]
filtraPorIndice f l = [x| (x, i)<-zip l [0..], f i]

{-10. Escreva uma função polimórfica chamada agrupaAdjacentesIguais que receba como parâmetro
  uma lista de um tipo qualquer. A função deve agrupar elementos consecutivos iguais em
  sublistas.
  Exemplo:
  agrupaAdjacentesIguais "aabbbc" = ["aa","bbb","c"]-}
agrupaAdjacentesIguais :: Eq t => [t] -> [[t]]
agrupaAdjacentesIguais [] = []
agrupaAdjacentesIguais [x] = []
agrupaAdjacentesIguais (x:xs)
    |x == head xs = [[x] ++ [head xs]] ++ agrupaAdjacentesIguais xs
    |otherwise = agrupaAdjacentesIguais xs