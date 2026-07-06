import Prelude

type Data = (Int, Int, Int)

valida :: Data -> Bool
valida (d, m, a) 
  |d < 1 = False
  |(m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m ==12) && d <= 31 
  = False
  |(m == 4 || m == 6 || m == 9 || m == 11) && d <= 30 = True
  |(m == 2 && (bissexto (d, m, a))) && d <= 29 = True
  |m < 1 || m > 12 = False 
  |otherwise = False

bissexto :: Data -> Bool 
bissexto (_, _, a) 
  |a `mod` 100 == 0 && a `mod`400 == 0 = True
  |a `mod` 4 == 0 = True
  |otherwise = False