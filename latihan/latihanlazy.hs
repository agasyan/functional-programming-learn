{- Nomor 2 divisor n -}
divisor n = [ x | x <- [1..n], n `mod` x == 0 ]

{-
    Berfungsi untuk mencari apa pembagi 20 apa saja jika inputnya 20
-}

{- Pytha Triple-}
pythaTriple = [(x,y,z) |  z <- [5 ..]
                        , y <- [z, z-1 .. 1]
                        , x <- [y, y-1 .. 1]
                        , x*x + y*y == z*z ]

{- Karena segitiga pythagoras pertama 5 
dan untuk mempercepat pencarian pythagoras 
pada elemen lain jika bilangan bulat tidak 
dimulai dari elemen yang sama dengan z, tetapi
elemen yang sama dengan y

-}