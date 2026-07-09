{-Escreva uma função polimórfica chamada filtroExecucao que processe os dados de uma lista
utilizando duas funções, uma com o intuito de executar determinada operação sobre os dados
e outra que visa filtrar os resultados obtidos. (4,0)
  Exemplos:
  Haskell
  filtroExecucao fst isUpper [('A',1), ('b',2), ('C',3)] = "AC"
  filtroExecucao length (>2) ["if", "IFMA", "Cx", "Caxias", "mar"] = [4,6,3]-}

filtroExecucao :: (a->b) -> (b->Bool) -> [a] -> [b]
filtroExecucao func filtro list = filter (filtro) (map func list)

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

