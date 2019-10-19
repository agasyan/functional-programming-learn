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