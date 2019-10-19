{-
    Contoh ekspresi:
    y = C 8 :+ C 6
-}
data Expr = C Float 
            | Expr :+ Expr 
            | Expr :- Expr 
            | Expr :* Expr 
            | Expr :/ Expr
            | V String 
            | Let String Expr Expr
        deriving Show

{- MapExp -}
mapExp :: (Float->Float) -> Expr -> Expr
mapExp f (C x) = C (f x)
mapExp f (i :+ j) = (mapExp f i) :+ (mapExp f j)
mapExp f (i :- j) = (mapExp f i) :- (mapExp f j)
mapExp f (i :* j) = (mapExp f i) :* (mapExp f j)
mapExp f (i :/ j) = (mapExp f i) :/ (mapExp f j)

{-
    Perbedaan:
    Map hasilnya pasti ekspresi
    Fold belum tentu ekspresi
    Contoh:
        y = C 8 :+ C 6
    Pemanggilan map = mapExpr (+2) y
    jika di map output = C 10.0 :+ C 8.0

    Pemanggilan fold = foldExp (+) (+2) y
    jika di fold output = 18.0
-}

{- FoldExp -}
foldExp :: (a->a->a) -> (Float->a) -> Expr -> a
foldExp combine constFn (C x) = constFn x
foldExp combine constFn (i :+ j) = combine (foldExp combine constFn i) (foldExp combine constFn j)
foldExp combine constFn (i :- j) = combine (foldExp combine constFn i) (foldExp combine constFn j)
foldExp combine constFn (i :* j) = combine (foldExp combine constFn i) (foldExp combine constFn j)
foldExp combine constFn (i :/ j) = combine (foldExp combine constFn i) (foldExp combine constFn j)

{-
    Combine berfungsi untuk menggabungkan 
-}

{- Evaluate untuk mengubah ekspresi menjadi angka float -}
evaluate :: Expr -> Float
evaluate (C x) = x
evaluate (i :+ j) = evaluate i + evaluate j
evaluate (i :- j) = evaluate i - evaluate j
evaluate (i :* j) = evaluate i * evaluate j
evaluate (i :/ j) = evaluate i / evaluate j
evaluate (Let v h i) = evaluate (subst v h i)
evaluate (V _) = 0.

subst :: String -> Expr -> Expr -> Expr
subst v0 h (V v1) = if (v0 == v1) then h else (V v1)
subst _ _ (C c) = (C c) 
subst v0 h (i :+ j) = subst v0 h i :+ subst v0 h j
subst v0 h (i :- j) = subst v0 h i :- subst v0 h j
subst v0 h (i :* j) = subst v0 h i :* subst v0 h j
subst v0 h (i :/ j) = subst v0 h i :/ subst v0 h j
subst v0 h (Let v1 i j) = Let v1 i (subst v0 h j)