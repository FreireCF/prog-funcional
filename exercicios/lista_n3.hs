import Data.Char
--q1 (usar map para lista)
triplica :: Int -> Int
triplica n = 3*n

--q4
{-Defina twice :: (a -> a) -> a -> a tal que
twice f x = f (f x).
Exemplo: twice (+3) 10 == 16
aplica a função duas vezes a um parâmetro-}

--q5
aplica_lista :: (Int -> Int) -> [Int] -> [Int]
aplica_lista func arg = map func arg

--q6
retorna_pares :: [Int] -> [Int]
retorna_pares l1 = filter even l1

--q7
retorna_num :: String -> String
retorna_num l1 = filter isDigit l1

-- com char:
retorna_char :: String -> String
retorna_char l1 = filter (not . isDigit) l1

--q10
dobro :: Int -> Int
dobro n = n * 2

dobra_lista :: [Int] -> [Int]
dobra_lista l1 = map dobro l1

todoP :: [Int] -> Bool
todoP [] = True
todoP (x:xs)
    |x < 0  = False
    |otherwise = todoP xs

--avançados
--q1
aux_reaj :: Double -> Double
aux_reaj n = n + (n*0.15)

reajusta :: [Double] -> [Double]
reajusta [] = []
reajusta l1 = map aux_reaj l1

--q2
aux_est :: Int -> Bool
aux_est n = n < 10

estoque_critico :: [Int] -> [Int]
estoque_critico [] = []
estoque_critico l1 = filter aux_est l1

--q3
aux_F :: Double -> Double
aux_F n = n * 1.80 + 32

paraFahrenheit :: [Double] -> [Double]
paraFahrenheit l1 = map aux_F l1

--q4
totalSaques :: [Double] -> Double
totalSaques l1 = foldr (+) 0 l1

--q5
aux_aprov :: Double -> Bool
aux_aprov n = n >= 6

aprovados :: [Double] -> [Double]
aprovados l1 = filter aux_aprov l1

--q6
contaMaisculas :: String -> Int
contaMaisculas l1 = length (filter isUpper l1)

{-q7
Um sistema recebe uma lista de números inteiros e deve: descartar os negativos,
elevar cada restante ao quadrado e somar tudo. Implemente processaDados :: [Int] -> Int usando
composição de funções-}

quadrado :: Int -> Int
quadrado n = n * n

processaDados :: [Int] -> Int
processaDados l1 = (sum . map quadrado . filter (>=0)) l1

{- q8
Uma loja aplica um cupom que dobra o valor e depois subtrai 10 de cada item
de um carrinho. Usando map com uma composição de seções de operadores,
implemente aplicaCupom :: [Double] -> [Double]-}

dobra :: Double -> Double
dobra n = n * 2

desconto :: Double -> Double
desconto n = n-10

aplicaCupom :: [Double] -> [Double]
aplicaCupom l1 = map (desconto . dobra) l1

--q9
positivo :: a -> Bool
positivo n = n < 0

retornaP :: [a] -> Bool
retornaP l1 = filter (==False) (map (>0) l1 == [])

--q10
{-Receber uma função f.
  Receber um número n.
  Considerar todas as entradas de 0 até n.
  Aplicar f em cada uma delas.
  Comparar os resultados.
  Retornar o menor resultado encontrado.-}
menor :: [Int] -> Int
menor [x] = x
menor (x:xs)
    |x < menor xs = x
    |otherwise = menor xs

lista_Fn :: (Int -> Int) -> Int -> [Int]
lista_Fn f n = map f [0..n]

menorConsumo :: (Int -> Int) -> Int -> Int
menorConsumo f n = menor (lista_Fn f n)