-- Soal 2

-- Soal 3 last dengan foldr atau l

myLast :: Num a => [a] -> a
myLast = foldl (\x y -> y) 0

-- Soal 4 dan 5

{-
    Sama seperti kelas A
-}

-- Soal 6 PFS

-- Before

monthlyPercentage persen = (persen/12)/100

-- After PFS

div12 x = x/12

div100 x = x/100

monthlyPercentagePFS = div100 . div12

{-
"Point-free style — aims to reduce some of the visual clutter by removing unnecessary parameter-argument mapping." 
-}

-- Soal 7

-- Soal 8