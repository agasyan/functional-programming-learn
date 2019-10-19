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