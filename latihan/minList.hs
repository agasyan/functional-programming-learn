{- MinList untuk mencari variabel terkecil dalam sebuah list -}
minList (x:xs) = foldr (min) x xs
{- 
    Contoh Pasangan input output
    input: [-1,0,-100,2,3,4,5]
    Output: -100
-}