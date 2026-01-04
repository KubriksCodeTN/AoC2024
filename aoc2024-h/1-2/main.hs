module Main where
import Data.Map.Strict
import Data.Map
import Data.Maybe (fromMaybe)

main :: IO ()
main = do
    io <- getContents
    let ls = lines io
    let f (fst,  snd) str = 
            let [x, y] = words str 
            in 
                (Data.Map.Strict.insertWith (+) (read x :: Integer) 1 fst, 
                Data.Map.Strict.insertWith (+) (read y :: Integer) 1 snd)
    let (h1, h2) = Prelude.foldl f (empty, empty) ls
    let g = (\snd k a result -> result + k * a * fromMaybe 0 (Data.Map.lookup k snd)) h2
    let res = Data.Map.foldrWithKey g 0 h1
    print res