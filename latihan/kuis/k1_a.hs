{- Nomor 1 MaxTiga Berfungsi untuk mencari nilai terbesar dari tiga bilangan -}
{- Ordinal, ada order 
   foldl dan foldr kalo foldl dari kiri dan foldr dari kanan
-}

maxTiga :: Ord x => x -> x -> x -> x
maxTiga i j k = foldr max i [j,k] 

{- Nomor 2 Evaluasi Fungsi -}
no2 = [ (x,y) | x <- [1 .. 4], y <- [2 .. 6], x * 2 == y]
    {- Jawaban:
        Output : >> [(1,2),(2,4),(3,6)]
        Menghasilkan list berisi pasangan angka yang berasal dari lst x dan y dimana y adalah
        2 kali dari bilangan. Untuk list x = [1,2,3,4] dan list y = [2,3,4,5,6]
        Evaluasi mengecek apakah ada elemen y yang merupakan 2 kali elemen x dan jika iya akan 
        mengeluarkannya ke output
    -}

{- Nomor 3 Definisi fungsi Quicksort -}
    
    {- Jawaban:
        Jika ada 2 definisi perlu ada "::" untuk membedakan definisi fungsi.
    -}
qSort :: (Ord x) => [x] -> [x]
qSort [] = []
qSort (x:xs)= (qSort [y | y <- xs, y <= x]) ++ [x] ++ (qSort [y | y <- xs, y > x])

{-
    Contoh input & Output:
    Input: [1,3,4,1,3,2]
    Output: [1,1,2,3,3,4]
-}

{- Nomor 4 jumlahList -}
jumlahList xs = foldl (+) 0 xs

{- Penjelasan:  Akan melakukan penjumlahan dari 0 ke elemen pertama sampai terakhir
                Contoh input = [1,2,3,4]
                output = 10
-}

{- Nomor 5 -}
misteriNo5 xs ys = concat (map (\x -> map (\y -> (x,y)) ys) xs)

{-
    Jawaban:
    input: misteriNo5 [1,2,3] [4,5,6]
    Output: [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]
    Evaluasi:
    concat (map (\x -> map (\y -> (x,y)) ys) xs)
    concat (map (\y -> (1,y)) [4,5,6], [map (\y -> (2,y)) [4,5,6]], [map (\y -> (3,y)) [4,5,6])
    concat ([(1,4),(1,5),(1,6)],[(2,4),(2,5),(2,6)],[(3,4),(3,5),(3,6)])
    [(1,4),(1,5),(1,6)] ++ [(2,4),(2,5),(2,6)] ++ [(3,4),(3,5),(3,6)]
    [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)]

    ## Concat untuk menggabungkan semua elemen dalam argumen
    ## map menjalankan semua fungsi ke semua elemen list lain
-}

{- Nomor 6 Primes dari infinite list menggunakan sieve of erasthothenes -}
primes = sieve [2..]
    where sieve (k:ks) = k:(sieve [l|l <- ks, l `mod` k /= 0])

{- Penjelasan:
    Fungsi sieve adalah mengambil tiap angka setelah 2 maka mencari modulo yang bukan 0 jika dibagikan dengan elemen prima yang sudah ada
    : adalah concat
-}

{- Nomor 7 Flip dan contohnya -}
tes7 :: Num a => a -> a -> a
tes7 x y = 2*x + y

newFlip :: (a -> b -> c) -> b -> a -> c
newFlip f = (\a b -> f b a)

{-
    Penjelasan: Pada :: tipe definisi fungsi menukar a dan menjadi b dan a untuk menghasilkan c
    sehingga pada pembuatan definisi flip menukar lambda a b ke fungsi b a
    Contoh input dan output
    input: newFlip tes7 1 2
    output: 5

    Jika tidak di flip maka jawabannya 4
-}