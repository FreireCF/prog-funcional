{-Escreva uma função polimórfica chamada contaVizinhosIguai que receba
como parÂmetro uma lista de um tipo qualquer. Esta função deve retornar
a quantidade de pares vizinho iguai presentes na lista
contaVizinhosIguai "abbcddd" = 3
contaVizinhosIguai [0,4,3,2,2,6,1,1] = 2
-}
--contaIgual :: [a] -> Int]
--contaIgual :: Eq a => [a] -> Int
--contaIgual [x:[]] = 0
--contaIgual (x:xs)
--    |x == (head xs) = 1 + contaIgual xs
--    |otherwise = contaIgual xs

--contaVizinhosIguais :: [a] -> Int
--contaVizinhosIguais l1 = map contaIgual l1