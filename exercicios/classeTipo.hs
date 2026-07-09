--todosIguais :: Int -> Int -> Int -> Bool
todosIguais :: Eq a => a -> a -> a -> Bool
todosIguais a b c = (a==b) && (b==c)