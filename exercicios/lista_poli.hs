{-Escreva a uma função polimórfica chamada aplicacaoExclusiva que receba como parâmetro duas
funções e duas listas polimórficas. A primeira função (de retorno booleano) deve validar quais
elementos da primeira e segunda listas são elegíveis para serem aplicados à segunda função.
Logo, o resultado final deve ser uma lista com o retorno da aplicação da segunda função a cada
um dos elementos selecionados pela primeira.
Exemplo:
aplicacaoExclusiva (>2) (+) [1,2,3,4] [9,5,0] = [12,8,13,9]-}
aplicacaoExclusiva :: (t->Bool) -> (t->t->t) -> [t] -> [t] -> [t]
aplicacaoExclusiva f1 f2 l1 l2 = [f2 x y|x<-(filter f1 l1), y<-(filter f1 l2)]

{-Escreva a uma função polimórfica chamada contaVizinhosIguais que receba como parâmetro
  uma lista de um tipo qualquer. Esta função deve retornar a quantidade de pares de vizinhos iguais
  presentes na lista.
  Exemplo:
  contaVizinhosIguais "abbcddd" = 3
  contaVizinhosIguais [0,4,3,2,2,6,1,1] = 2-}
contaVizinhosIguais :: Eq t => [t] -> Int
contaVizinhosIguais [x] = 0
contaVizinhosIguais (x:xs)
    |x == (head xs) = 1 + contaVizinhosIguais xs
    |otherwise = contaVizinhosIguais xs

{-Escreva a uma função polimórfica chamada contador que receba como parâmetros uma função de
  retorno booleano e uma lista qualquer. A função contador deve retornar a quantidade de
  elementos da lista para os quais o retorno da função passada como parâmetro seja True.
  Exemplo:
  contador (/='a') "banana" = 3
  contador (>2) [0,-4,3,2,6] = 2-}

contador :: (t->Bool) -> [t] -> Int
contador f l= length (filter f l)

{-Escreva a uma função polimórfica chamada filtraPar que receba como parâmetro duas funções e
  duas listas de tipos quaisquer. A primeira função deve selecionar quais elementos da primeira lista
  serão processados e a segunda função deve validar quais elementos da segunda lista serão
  processados. Como resultado, a função filtraPar deve retornar uma lista de tuplas contendo os
  pares resultantes desta aplicação.
  Exemplos:
  filtraPar (>3) (<4) [1,2,3,4,5,6] [8,4,7,1,5,2] -> [(4,1),(4,2),(5,1),(5,2),(6,1),(6,2)]
  filtraPar (isLower) (isUpper) "aBcDEf" "ZxYk" -> [(‘a','Z'),('a','Y'),('c','Z'),('c','Y'),('f','Z'),('f','Y')]
  filtraPar (isLower) (<=2) "aEIoU" [3,0,2,4,1] -> [(‘a',0),('a',2),('a',1),('o',0),('o',2),('o',1)]-}

filtraPar :: (t->Bool) -> (u->Bool) -> [t] -> [u] -> [(t,u)]
filtraPar f1 f2 l1 l2 = [(x,y)|x<-(filter f1 l1), y<-(filter f2 l2)]