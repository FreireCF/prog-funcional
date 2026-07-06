--q1
{-Escreva uma função em Haskell que receba uma lista de strings e retorne uma lista de tuplas
contendo cada string distinta e sua quantidade de ocorrências, ordenadas da maior frequência
para a menor frequência. (5,0)
Exemplo:
frequencia ["ana","joao","ana","maria","joao","ana"]
[("ana",3),("joao",2),("maria",1)]-}

removePalavra :: String -> [String] -> [String]
removePalavra _ [] = []
removePalavra p list = [x| x<-list, x/=p] 

contaFreq :: String -> [String] -> Int
contaFreq _ [] = 0
contaFreq p (x:xs)
  |p == x = 1 + contaFreq p xs
  |otherwise = contaFreq p xs

frequencia :: [String] -> [(String, Int)]
frequencia [] = [] 
frequencia (x:xs) = ((x, contaFreq x (x:xs))) : frequencia (removePalavra x xs)

sort :: [(String, Int)] -> [(String, Int)]
sort [] = [] 
sort ((a,b):xs) = sort [(x,y)| (x,y) <- xs, y > b] ++ [(a,b)] ++ sort[(x,y)| (x,y) <- xs, y<=b] 

resolve ::[String] -> [(String, Int)]
resolve list = sort (frequencia list)

{-2.  Em sistemas de comunicação digital, uma forma de medir a semelhança entre duas mensagens
é contar quantos caracteres estão em posições diferentes. Essa medida é conhecida como
distância de Hamming.
Escreva uma função em Haskell que receba duas listas de strings e retorne uma lista de tuplas
contendo todas as combinações possíveis entre as strings das duas listas e suas respectivas
distâncias de Hamming. Considere apenas os caracteres comparados até o tamanho da menor
string. (5,0)
Exemplo:
comparar ["rede","casa"] ["rato","caso"]
[("rede","rato",3), ("rede","caso",4), ("casa","rato",2), ("casa","caso",1)]-}

hamming :: String -> String -> Int
hamming [] x = length x
hamming x [] = length x
hamming (x:xs) (y:ys)
    |x /= y = 1 + hamming xs ys
    |otherwise = hamming xs ys

comparar :: [String] -> [String] -> [(String, String, Int)]
comparar list1 list2 = [(x, y, hamming x y)| x<-list1, y<-list2]

--recebe lista e retorna números pares ao quadrado
pares_quadrados :: [Int] -> [Int]
pares_quadrados [] = []
pares_quadrado list = [x*x| x<-list, mod x 2 == 0]

--recebe lista de string retorna tupla com palavra e tamanho
tamanho :: [String] -> [(String, Int)]
tamanho list = [(x, length x)| x<-list]

--recebe dois inteiros n e m e retorna os pares (a,b) em que
--1 <= a <= n, 1 <=b <= m e a+b é primo
divisores :: Int -> [Int]
divisores n = [x| x<- [1..n], mod x n == 0]

primo :: Int -> Bool
primo x
    |length (divisores x) == 2 = True
    |otherwise = False

paresSomaPrima :: Int -> Int -> [(Int, Int)]
paresSomaPrima n m = [(a,b)| a<-[1..n], b<-[1..m], primo (a+b)]

--recebe lista de string e retorna apenas as que são palindomos
palindromo :: String -> Bool
palindromo p = p == reverse p
    where
    reverso :: String -> String
    reverso [] = []
    reverso (x:xs) = reverso xs ++ x : []

listaPalindromos :: [String] -> [String]
listaPalindromos [] = []
listaPalindromos list = [y| y<-list, palindromo y]

identidade :: Int -> [[Int]]
identidade n = [[fromEnum (i == j)]| i<-[1..n], j<-[1..n]]

--retorna tupla onde x/= y, x<y, x+y é multiplo de 3
paresMult3 :: [Int]-> [(Int, Int)]
paresMult3 list = [(x, y)| x<-list, y<-list, x/=y, x<y, mod (x+y) 3 == 0]

--recebe duas listas de inteiros retorna produto elemento por elemento
produtos :: [Int] -> [Int] -> [Int]
produtos list1 list2= [x*y| (x,y) <- zip list1 list2, x>=0, y>=0 ]

--recebe uma matriz e retorna transposta
transposta :: [[Int]] -> [[Int]]
transposta [] = []
transposta ([]:xs) = transposta xs
transposta matriz = [head x| x<- matriz] : transposta [tail x| x<-matriz]

multMatriz :: [[Int]] -> [[Int]] -> [[Int]]
multMatriz a b =
    [[sum [x*y | (x,y) <- zip linha coluna]
     | coluna <- transposta b]
     | linha <- a]

somaMatriz ::  [[Int]] -> [[Int]] -> [[Int]]
somaMatriz a b = [[x+y| (x,y) <- zip linhaA linhaB]
    |(linhaA, linhaB) <- zip a b]

--availação 4
--q1
divisiveis :: [Int] -> [Int]
divisiveis list = [x| x<- list, (mod x 3 == 0 || mod x 5 ==0) && not (mod x 3 == 0 || mod x 5 ==0)]

--q2
maioresIdade :: [(String, Int)] -> [String]
maioresIdade list = [x| (x,y) <- list, y>=18]

--q4
todaDiferente :: String -> Bool
todaDiferente (x:[]) = True
todaDiferente (x:xs)
    |x `elem` xs = False
    |otherwise = todaDiferente xs

palavrasSemRepeticao :: [String] -> [String]
palavrasSemRepeticao list = [x| x<-list, todaDiferente x]
