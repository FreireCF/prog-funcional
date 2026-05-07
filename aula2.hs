-- Casamento de padrões
fat::Int->Int
fat 0 = 1
fat n = n*fat(n-1)

--Sem casamento de padrões 
fatSCP::Int->Int
fatSCP n  
  |n==0 = 1
  |otherwise = n*fatSCP(n-1)

--Exercício 
fibo::Int->Int
fibo n 
  |n==0 = 0
  |n==1 = 1
  |otherwise = fibo(n-1)+fibo(n-2)

--Casamento de padrões 
fiboCP::Int->Int 
fiboCP 0 = 0
fiboCP 1 = 1
fiboCP n = fiboCP(n-1) + fiboCP(n-2)