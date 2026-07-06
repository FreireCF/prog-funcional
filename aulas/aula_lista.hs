replicaChar::String -> Int -> [String]
replicaChar c n
  |n == 0 = []
  |otherwise = c : replicaChar c (n-1)

inverteLista :: [Char] -> [Char]
inverteLista [] = [] 
inverteLista (x:xs) = inverteLista xs ++ x:[]

{-
inverteLista IFMA
inverteLista FMA ++ I:[]
inverteLista MA ++ F : []
inverteLista A ++ M : [] 
inverteLista [] ++ A : []
[] ++ 'A' : [] + 'M' : [] + 'F' : [] + 'I' : []

-}