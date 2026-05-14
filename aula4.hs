main::IO()
main = do
  putStrLn "Digite um número "
  s1 <- getLine
  putStrLn "Digite outro número "
  s2 <- getLine
  putStr "Soma dos números digitados: "
  let n1 = read s1 :: Double
  let n2 = read s2 :: Double
  putStrLn (show(n1+n2))