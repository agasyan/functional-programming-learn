-- Soal 1

{-
Given a sentence, define a function called capitalise which returns the same sentence with all words capitalised except the ones from a given list.
(source: https://www.fer.unizg.hr/)
capitalise :: String -> [String] -> String
capitalise "this is a sentence." ["a", "is"]
"This is a Sentence."
-}


getWord word [] = (word,[])
getWord word (x:xs) | x == ' ' = (word, xs)
                    | x /= ' ' = getWord (word ++ [x]) xs  

-- >>> getWord [] "this is a sentence"
-- ("this","is a sentence")
--

splitter lw []  = lw
splitter lw inp = let (word, rest) = getWord "" inp
                  in splitter (lw ++ [word]) rest 
                  
-- >>> splitter [] "this is a sentence."
-- ["this","is","a","sentence."]
--

-- >>> Char.toUpper 'a'
-- 'A'
--

upper el word = if word `elem` el 
                then word 
                else Char.toUpper (head word) : (tail word)

-- >>> upper ["is","a"] "this"
-- "This"
--

combine []  = []
combine [a] = a
combine (a:xs) = a ++ " " ++ (combine xs)

-- >>> combine ["this","is","a","sentence."]
-- "this is a sentence."
--

capitalise el inp = let lw = splitter [] inp
                    in combine (map (upper el) lw) 

capitalise el inp = combine (map (upper el) (splitter [] inp)) 

capitalise el  =  combine . (map (upper el)) . (splitter []) 


-- >>> capitalise "this is a sentence." ["a", "is"]
-- "This is a Sentence. "

-- Soal 2 compose (.) dot function

dot :: (b -> c) -> (a -> b) -> a -> c
dot f g = \x -> f (g x)

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

-- Soal 7 referential transparency

{-
    An expression is said to be referentially transparent
    when it can be replaced with its corresponding value
    without changing the application's behavior. 

    Contoh:

    ###yang iya

    val volCube = (rusuk:Int) => math.pow(rusuk,3)
    > volCube(3) + volCube(4) 
    => Bisa didefiniskan satu - satu
    volCube(3) = math.Pow(3,3)

    ### yang tidak 
    var total = 0

    def addToTotal(x:Int): Int = {
        total += x
        return total
    }
    >assert (addToTotal(10)==addToTotal(10)) ---> False


    Catatan:

    # Partial

    function add(a:number, b?:number){
        if(b!==undefined){
            return a+b;
        } else {
            return (b2:number) => {
                return a+b2;
            };
        }
    }

    > add10 = add(10) as (b:number)
    > let res = add10(5)



-}

-- Soal 8 useReducer Cimplete

{-

const completeReducer = (state, action) => {
      return state.map((item) =>
        item.id === action.id
          ? { ...item, complete: !item.complete }
          : item
      )

const [todos, dispatch] = useReducer(completeReducer, initialState);}
-}

{- Nomor 9 title react hooks pure function

Before:
componentDidMount() {
    document.title =
      this.state.name + " " + this.state.surname;
  }
​
  componentDidUpdate() {
    document.title =
      this.state.name + " " + this.state.surname;
  }

After:

Karena isi nya mengubah efek yang sama yaitu judul maka bisa dipakai ulang

function useDocumentTitle(title) {
  useEffect(() => {
    document.title = title;
  });
}

---- Use Window Width

handleResize() {
    this.setState({ width: window.innerWidth });
  }

After:

function useWindowWidth() {
  const [width, setWidth] = useState(window.innerWidth);
  useEffect(() => {
    const handleResize = () => setWidth(window.innerWidth);
    window.addEventListener("resize", handleResize);
    return () => {
      window.removeEventListener("resize", handleResize);
    };
  });
  return width;
}

-}

{- Soal 10 True False lambda calculus dan True And False = False -}

{-
    T = \xy.x
    F = \xy.y
    And = ∧ ≡ λxy.xy(λuv.v) ≡ λxy.xyF

    Definisi:
    True And False ≡ F

    (left hand-side)
    ≡ T AND F
    ≡ T (λuv.uvF) F
    ≡ T (λv.FvF)
    ≡ (λxy.x) (λv.FvF)
    ≡ (λy.(λv.FvF))
    ≡ (λy.(λv.(λab.b)v(λcd.d)))
    ≡ (λy.(λv.(λb.b)(λcd.d)))
    ≡ (λy.(λv.(λcd.d)))
    ≡ (λcd.d)
    ≡ F


-}