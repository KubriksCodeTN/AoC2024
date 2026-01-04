module Main where

sorted :: (Num a, Ord a) => [a] -> Bool
sorted l = notElem 0 l_tmp && same (map (>0) l_tmp)
    where 
        same l = all (==head l) l
        l_tmp = zipWith (-) l (tail l)

pairUp :: [a] -> [(a, a)]
pairUp l = zip l (tail l)

-- prob could be better but idk how
main :: IO ()
main = do 
    io <- getContents
    let
        io_str = map words $ lines io
        io_int = map (map (\w -> read w :: Int)) io_str
        bools = map (\l -> sorted l && all (\(a, b) -> abs (a - b) <= 3) (pairUp l)) io_int
        res = sum $ map fromEnum bools
    print res