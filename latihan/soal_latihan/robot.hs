import Data.Array
import Data.List
import Control.Monad
import Control.Applicative


data Direction = North | East | South | West
            deriving (Eq, Show, Enum)

data Color = Black | Blue | Green | Cyan
            | Red | Magenta | Yellow | White
            deriving (Eq, Ord, Bounded, Enum, Ix, Show, Read)
            
right :: Direction -> Direction
right d = toEnum(succ (fromEnum d) `mod` 4)

data RobotState = RobotState {  position :: Position
                             ,  facing   :: Direction
                             ,  pen      :: Bool
                             ,  color    :: Color
                             ,  treasure :: [Position]
                             ,  pocket   :: Int
                            } deriving Show

type Position = (Int,Int)

type Grid = Array Position [Direction]

newtype Robot a = Robot (RobotState -> Grid -> (RobotState, a))

updateState u = Robot (\s  -> return (u s, ()))

turnRight :: Robot ()
turnRight = updateState (\s -> s {facing = right (facing s)})