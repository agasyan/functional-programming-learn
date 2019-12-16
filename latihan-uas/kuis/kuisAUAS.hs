{- Quiz Pra UAS Pemfung-}

{- Nomor 1
> weirdFilter :: [String] -> [String]
> weirdFilter ["abc", "bananae", "fuzzy", "c1c2"]
Output: ["abc"]
-}

-- numberRemoval on string
notNumber x = x `notElem` "1234567890"
numberRemoval = filter notNumber

-- isThreeOrLessVowels filter
isVowel x = x `elem` "aiueoAIUEO"
countVowel = length . filter isVowel
isThreeOrLessVowels str = countVowel str < 4

-- isNotAppearTwiceInARow filter
isNotAppearTwiceInARow (a:b:ls) | (a==b) = False
isNotAppearTwiceInARow (a:ls) = isNotAppearTwiceInARow ls
isNotAppearTwiceInARow [] = True

weirdFilter :: [String] -> [String]
weirdFilter = filter isThreeOrLessVowels
            . filter isNotAppearTwiceInARow
            . map numberRemoval

{- Catatan Pengerjaan:
    - Filter merupakan sebuah fungsi evaluasi nerima sebuah objerk
    - Menggunakam pointfreestyle
    - Haskell dari belakang
-}

{-
Nomor 2
-- >>> rotabc "scyc sukc kcmu"
-- "saya suka kamu"
-}


rotabc :: String -> String
rotabc = map abc
    where abc 'a' = 'b'
          abc 'b' = 'c'
          abc 'c' = 'a'
          abc x = x

{- Soal 3 point-free style last -}

lastPFS = head . reverse

{- Soal 4 zcb -}

-- Pemanggilan fungsi zcb t x k , menyatakan bahwa pada waktu t , 
-- contract ini akan senilai dengan x pada kurs k .

-- one :: Currency -> Contract
-- -- Receive one unit of currency immediately

-- scale :: Float -> Contract -> Contract
-- -- Acquire specified number of contracts

-- at :: Date -> Contract -> Contract
-- -- Acquire the contract at specified date

{--
zcb :: Date -> Double -> Currency -> Contract
zcb t x k =  at t (scale x (one k))
--}
{- Soal 5 Penerapan Functional Style -}


monthlyPercentage persen = (persen/12)/100

geometricSequence start yearly = \bulan -> 
    start * (1 + (monthlyPercentage yearly)) ** (bulan - 1)

listKenaikanPerBulan start bulan persen = 
    map (geometricSequence start persen) [1..bulan]

-- PFS
div12 x = x/12

div100 x = x/100

monthlyPercentagePFS = div100 . div12

{-
Penjelasan: 
1.  Fungsi monthlyPercentage untuk mendapat persen bulanan dari persen reksa dana yang merupakan per tahun. 
    Input persen per tahun, output persen per bulan.

2.  Fungsi geometricSequence untuk mencari nilai deret geometric dari nilai awal dan ratio per bulan. Membutuhkan
    fungsi monthlyPercentage untuk mencari rasio dari hasil persen per bulan.

3.  listKenaikanPerBulan mengembalikan jumlah kenaikan tabungan per bulan dari tabungan.

Functional pada: mapping pada list yang menerima sebuah function untuk diterapkan ke elemen bulan 
-}

{- Soal 6 Applicative Functor -}

{-
    Kelompok kami menggunakan React Hooks yang merupakan Applicative Functor
    pada React. Salah satu penggunaannya adalah useState dan useEffect. UseEffect berfungsi
    untuk memberi tahu komponen setelah render contohnya adalah mengubah judul halaman. Contoh 
    lain yaitu penggunaan useEffect untuk initial state agar grafik tidak kosong dan memberikan
    initial value, setelah itu grafik akan mengubah isi sesuai state yang di set.
-}

{- Soal 7 Pure Function javascript -}
{-
    function isRootPath(pathname) {
        return pathname === "/";
    }
-}

{- Contoh lain:
    
    const add = (x, y) => x + y;

-}

{- Soal 8 useReducer example -}

{- Soal 9 useState abstraction -}

{-
    Karena name dan surname menggunakan useState dengan cara yang sama,
    yaitu pada input field, keduanya dapat diabstraksikan kembali sehingga
    menjadi fungsi form yang menerima label.

    pseudocode:
    function formInput(label) {
        const [value, setValue] = useState(label);
        // handle function
        return {value, onChange: setValue}
    }

    fungsi di atas akan dipanggil untuk name dan surname sehingga dapat 
    digunakan sebagai hooks seperti semula.

-}

{- Soal 10 True False lambda calculus -}

{-
    T = \xy.x
    F = \xy.y

    Definisi if P then E1 else E2, PE1E2
    Jika P = T, (\xy.x)E1E2 = (\y.E1)E2 = E1
    Jika P = F, (\xy.y)E1E2 = (\y.y)E2 = E2
-}