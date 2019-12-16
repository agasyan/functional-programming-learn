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