{-Questão 1: Considere que você necessita contar quantos números pares existem em
  uma lista de números ou contar quantos caracteres maiúsculos existem em um texto.
  Em ambos os casos existe a necessidade de contar quantos elementos de uma lista
  preenchem um determinado critério.
  Desta forma, escreva uma função polimórfica
  chamada totalFiltro que receba como parâmetros uma função de retorno booleano e
  uma lista de um tipo qualquer. A função totalFiltro deve retornar a quantidade total de
  elementos na lista informada que satisfazem a função passada como parâmetro.
  Exemplos:
  totalFiltro (=='a') "caxias" -> 2
  totalFiltro (/='a') "caxias" -> 4
  totalFiltro (>5) [8,-2,0,3,0,7,5,9,7] -> 4
  totalFiltro isUpper "IFMA Campus Caxias" -> 6-}

totalFiltro :: (a->Bool) -> [a] -> Int
totalFiltro func list = length (filter func list)

{-Questão 2: Suponha que você precise desenvolver um programa para descomprimir
  dados compactados. Neste caso considere que você pode receber uma lista de tuplas
  em que o primeiro elemento é de um tipo qualquer e o segundo elemento é um inteiro
  indicando quantas vezes este elemento se repete. Neste caso você deve programar
  uma função utilizando polimorfismo para repetir os elementos destas tuplas e gerar
  uma lista final com os dados descompactados de acordo com os exemplos abaixo.
  [('a',3),('b',5),('c',1),('a',2),('c',4)] -> "aaabbbbbcaacccc"
  [(7,2),(3,4),(8,1),(3,2),(5,3)] -> [7,7,3,3,3,3,8,3,3,5,5,5]-}
  --recebe uma tupla (a,Int) -> a repete Int vezes -> String
repete :: (a, Int) -> [a]
repete (a, 1) = [a]
repete (c,n) = [c] ++ repete (c, n-1)

descompacta :: [(a, Int)] -> [a]
descompacta t = foldl (++) [] (map repete t)