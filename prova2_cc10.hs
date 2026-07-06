--q1
contaFreq :: [String] -> String -> Int
contaFreq [] _ = 0  
contaFreq (x:xs) p
  |x == p = 1 + contaFreq xs p
  |otherwise = contaFreq xs p

removePalavra :: [String] -> String -> [String]
removePalavra [] _ = []
removePalavra list p = [x| x<-list, x/=p] 

tuplaFreq :: [String] -> [(String, Int)]
tuplaFreq [] = []
tuplaFreq (x:xs) = [(x, contaFreq (x:xs) x)] ++ tuplaFreq (removePalavra xs x)

sort :: [(String, Int)] -> [String]
sort [] = []
sort ((a, b) : xs) = sort [(x,y)| (x,y)<-xs, y>b] ++ [a] ++ sort [(x,y)| (x,y)<-xs, y<=b]

questao :: [String] -> [String]
questao l1 = sort (tuplaFreq l1)

--q2 
hamming :: String -> String -> Int
hamming [] p = length p
hamming p [] = length p
hamming (x:xs) (y:ys)
  |x == y = hamming xs ys
  |otherwise = 1 + hamming xs ys

sortFreq :: [(String, String, Int)] -> [(String, String, Int)]
sortFreq [] = []
sortFreq ((a,b,c) : xs) = sortFreq [(x,y,z)| (x,y,z) <- xs, z<=c]
  ++ [(a,b,c)] 
  ++ sortFreq [(x,y,z)| (x,y,z) <- xs, z > c]

listaHamming :: [String] -> [String] -> [(String, String, Int)] 
listaHamming list1 list2 = sortFreq [(x,y, hamming x y)| x<-list1, y<-list2]