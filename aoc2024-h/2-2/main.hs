module Main where
import Data.List (subsequences)

sorted :: (Num a, Ord a) => [a] -> Bool
sorted l = notElem 0 l_tmp && same (map (>0) l_tmp)
    where 
        same l = all (==head l) l
        l_tmp = zipWith (-) l (tail l)

pairUp :: [a] -> [(a, a)]
pairUp l = zip l (tail l)

combinations :: Int -> [a] -> [[a]]
combinations k = filter ((k==) . length) . subsequences

-- prob could be better but idk how
main :: IO ()
main = do 
    io <- getContents
    let
        io_str = map words $ lines io
        io_int = map (map (\w -> read w :: Int)) io_str
        lambda l = sorted l && all (\(a, b) -> abs (a - b) <= 3) (pairUp l)
        bools = map lambda io_int
        res = sum $ map fromEnum bools
        wrong_ones = map fst $ filter (\(l, b) -> not b) $ zip io_int bools
        possibles = map (\l -> combinations (length l - 1) l) wrong_ones
        bools1 = map (any lambda) possibles
        res1 = res + sum (map fromEnum bools1)
    print res1