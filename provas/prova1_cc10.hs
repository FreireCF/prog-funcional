t::Int->Int
t n = (n*(n+1)) `div` 2

aux::Int->Int->Bool
aux a b
  |t b > a = False
  |t b == a = True
  |otherwise = aux a (b+1)

triangular:: Int -> Bool
triangular p
  |p==1 = True
  |otherwise = aux (p)(1)

aux_cont::Int->Int->Int
aux_cont a b
  |b == 1 = 1
  |triangular(b) == True = 1 + aux_cont a (b-1)
  |otherwise = aux_cont a (b-1)

cont_triangular::Int-> Int
cont_triangular n 
  |n >= 3 && n > 1 = 1
  |otherwise = aux_cont n (n-1)