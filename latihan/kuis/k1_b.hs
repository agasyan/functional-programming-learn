{- Fungsi KPK Nomor 1
    KPK adalah Kelipatan Persetukan terKecil
    KPK:  Hasil kali semua faktor dan ambil faktor dengan pangkat terbesar untuk faktor yang sama
    Jadi jika ada 2 3 maka KP nya bisa 6 12 tapi KPK adalah 6
-}

kpk x y = foldl (min) (x*y) [a | a <- (map (*x) [1..y]), b <- (map (*y) [1..x]), a == b]

{-
    Penjelasan: mencari nilai perkalian terkecil dari list yang ada, Map berfungsi untuk menjalankan semua fungsi x
    terhadap semua elemen list, hasil dari list di kanan adalah elemen jika i dan j sama jika dikalikan.
    Contoh input: 20 12
    Output: 60
-}

{- Nomor 2 Evaluasi fungsi  -}

no2 = [(x,y) | x<-[1..3], y<-[1..(2*x)]]

{-
    Jawaban:
    Hasil: [(1,1),(1,2),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6)]
    Mencari semua pasangan di y dan mengeluarkannya karena array x sampai 3 dan y sampai 6
-}

{- Nomor 3 Merge Sort -}

merge :: Ord x => [x] -> [x] -> [x]
merge []  as = as
merge bs [] = bs
merge (a:as) (b:bs) | a < b = a:merge as (b:bs)
                    | otherwise = b:merge (a:as) bs

mSort :: ([x] -> [x] -> [x]) -> [x] -> [x]
mSort merge as
    | length as < 2 = as
    | otherwise = merge (mSort merge frst) (mSort merge scnd)
    where frst = take half as
          scnd = drop half as
          half = length as `div` 2

{- Pemanggilan: mSort merge ~arr~ -}