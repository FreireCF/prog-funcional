{-Escreva a uma função polimórfica chamada aplicacaoExclusiva que receba como parâmetro duas
  funções e duas listas polimórficas. A primeira função (de retorno booleano) deve validar quais
  elementos da primeira e segunda listas são elegíveis para serem aplicados à segunda função.
  Logo, o resultado final deve ser uma lista com o retorno da aplicação da segunda função a cada
  um dos elementos selecionados pela primeira.
  Exemplo:
  aplicacaoExclusiva (>2) (+) [1,2,3,4] [9,5,0] = [12,8,13,9-}

aplicacaoExclusiva:: (t->Bool) -> (t->t->u) -> [t] -> [t] -> [u]
aplicacaoExclusiva f1 f2 l1 l2 =  [f2 e1 e2| e1<-(filter (f1) l1),  e2<-(filter (f1) l2)]

contador :: (t->Bool) -> [t] -> Int
contador f l = length (filter f l)

filtraPar:: (t->Bool) -> (u->Bool) -> [t] -> [u] -> [(t,u)]
filtraPar f1 f2 l1 l2 = [(e1, e2)| e1<-(filter (f1) l1), e2<-(filter (f2) l2)]

selecionaExecuta :: (t->Bool) -> (t->u) -> [t] -> [u]
selecionaExecuta f1 f2 l1 = map f2 (filter (f1) l1)

--q2 prova cc10
{-2.
  Atualmente, existem diversos algoritmos e técnicas para compressão de dados.
  Suas aplicações na transmissão de informações pela Internet são fundamentais para servidores de arquivos,
  streaming de vídeo e áudio, carregamento de imagens etc. Dentre as técnicas de compressão, destacamos as
  classificadas como "Lossless", ou seja, métodos em que não ocorre perda de informação (ex: Huffman coding,
  Run-length, bzip2, etc.). Considere um algoritmo de compressão do tipo Lossless que quantifica o número
  de repetições consecutivas de uma lista de dados.

  Ou seja, o algoritmo deve agrupar as informações repetidas junto com a quantidade de repetições.
  Por exemplo, se o algoritmo encontrar 5 caracteres "x" em sequência ("xxxxx"), ele deve comprimir os dados
  para ('x',5); se forem 4 caracteres "z" em sequência ("zzzz"), origina-se a tupla ('z',4) e assim por diante.
  Com base no exposto, escreva uma função polimórfica em Haskell que receba uma lista de dados quaisquer e gere
  como saída sua versão comprimida utilizando o método descrito acima. (6,0)
  Exemplos:
  Haskell
  "abcaaaabcaaawxyzeeeeeeeee" -> [("abc",1),("a",4),("b",1),("c",2),("a",3),("wxyz",1),("e",9)]
  [9,9,9,1,2,3,4,4,5,5,5,5] -> [([9],3), ([1,2,3],1), ([4],2), ([5],4)]-}

contaRep:: (Eq t) => [t] -> Int
contaRep [] = 0
contaRep [a] = 0
contaRep (x:xs)
   |xs == [] = 0
   |x == (head xs) = 1 + contaRep xs
   |otherwise = contaRep xs

listaRep :: Eq t => [t] -> [([t], Int)]
listaRep [] = []
listaRep list = ([head list], cont) : listaRep (drop cont list)
   where
       cont = contaRep list

-- juntaVizinhos
