import Prelude

type Hora = (Int, Int, Int) --horas, minutos, segundos 

pega_hora:: IO (Int, Int, Int) 
pega_hora = do

  putStrLn "Digite as horas: "
  p1 <- getLine 
  let h = read p1 :: Int 

  putStrLn "Digite os minutos: "
  p2 <- getLine 
  let m = read p2 :: Int 

  putStrLn "Digite os segundos: "
  p3 <- getLine 
  let s = read p3 :: Int

  return (h, m, s)

valida :: Hora -> Bool -- função 1
valida (h, m, s)
  |h < 0 || h > 23 = False
  |m < 0 || m > 59 = False
  |s < 0 || s > 59 = False
  |otherwise = True

cont_seg :: Hora -> Int --função2
cont_seg (h, m, s)
  |valida (h, m, s) = h*3600 + m*60 + s
  |otherwise = 0 

converteToH :: Int -> Hora --função 3
converteToH s1 
  |s1 < 60 = (0, 0, s1)
  |s1 < 3600 = (0, s1 `div` 60, s1`mod`60)
  |otherwise = (h, m, s)
  where 
    h = s1 `div` 3600 
    m = (s1`mod`3600) `div` 60
    s = (s1 `mod` 3600) `mod` 60
  
diferenca :: Hora -> Hora -> Hora
diferenca (a, b, c) (x, y, z)
  |valida (a, b, c) && valida(x, y, z) = converteToH total 
  |otherwise = (0,0,0) 
    where
      h1 = abs ((a*3600) - (x*3600))
      m1 = abs ((b*60) - (y*60))
      s1 = abs (c - z)
      total = h1 + m1 + s1

chama_func::Int -> IO()
chama_func 1 = do
  putStrLn "Função para verificar horário válido"
  hora <- pega_hora
  putStrLn(show(valida hora))

chama_func 2 = do
  putStrLn "[2] - Função para retornar a quantidade de segundos de 0 até h"
  hora <- pega_hora
  putStrLn(show(cont_seg hora))

chama_func 3 = do
  putStrLn "[3] - Função para converter segundos em horas"
  putStrLn "Digite os segundos: "
  s1 <- getLine 
  let s = read s1 :: Int
  putStrLn(show(converteToH s))

chama_func 4 = do
  putStrLn "[4] - Função para retornar a diferença entre dois horários"
  putStrLn "Digite o primeiro horário: "
  horario1 <- pega_hora 

  putStrLn "Digite o segundo horário: "
  horario2 <- pega_hora 

  putStrLn(show(diferenca horario1 horario2))

chama_func _ = putStrLn "Função inválida"

main :: IO()
main = do
  putStrLn "[1] - Função para verificar horário válido"
  putStrLn "[2] - Função para retornar a quantidade de segundos de 0 até h"
  putStrLn "[3] - Função para converter segundos em horas"
  putStrLn "[4] - Função para retornar a diferença entre dois horários"

  putStrLn"Escolha sua função: "
  fct <- getLine
  let f = read fct :: Int 
  chama_func f