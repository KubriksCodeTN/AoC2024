module Main where
import Data.Foldable (find)
import Data.List (elemIndex)
import Data.Maybe (fromMaybe)
import qualified Data.Vector.Unboxed as V
import qualified Data.Vector.Unboxed.Mutable as VM
import Control.Monad (forM_)

rotateGuard :: Char -> Char
rotateGuard '^' = '<'
rotateGuard '<' = 'v'
rotateGuard 'v' = '>'
rotateGuard '>' = '^'
rotateGuard _ = error "invalid Char"

solve :: Int -> Int -> Int -> [String]

main :: IO ()
main = do 
    io <- getContents
    let
        ls = lines io
        n = length . head $ ls
        m = length ls
        pos = fromMaybe 0 $ elemIndex '^' io
        ret = solve m n pos ls
    print ret