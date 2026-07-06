{-q1
recebe uma lista de tuplas e retorna uma lista com a seq. genética
[('A', 3), ('T', 2), ('C', 1), ('G', 4)] -> "AAATTCGGGG"
[('G', 2), ('A', 2), ('T', 5)] -> "GGAATTTTT"-}

descompacta :: [(Char, Int)] -> String
descompacta [] = []
descompacta (x:xs) = aux x ++ descompacta xs

aux :: (Char, Int) -> String
aux (c, 0) = []
aux (c,i) = c : aux (c, i-1)

{-
receba uma lista de tuplas e retorne quantos
pares são compostos por números amigáveis
contaAmigaveis [(1184,1210), (121,333), (220,284), (220,220), (6,36)] = 2
    
AMIGAVEIS ==> sum divisores x == y && sum divisores y == x
-}
contaAmigaveis :: [(Int, Int)] -> Int
contaAmigaveis [] = 0
contaAmigaveis (x:xs)
    |amigavel x == True = 1 + contaAmigaveis xs
    |otherwise = contaAmigaveis xs

amigavel :: (Int, Int) -> Bool
amigavel (x,y) = sum (divisores x) == y && sum (divisores y) == x

divisores :: Int -> [Int]
divisores 0 = []
divisores n = [x| x<-[1..n `div` 2], mod n x == 0]
