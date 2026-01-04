module Main where

import Text.Regex.Posix( (=~), AllTextMatches (getAllTextMatches) )
import Data.Text ( stripPrefix, stripSuffix, pack, split, unpack, Text, splitOn )
import Data.Maybe ( fromJust )
-- import Data.List.Split ( splitOn )

multStr :: Text -> Int
multStr s = case split (==',') s of
    [a, b] -> (read (unpack a) :: Int) * (read (unpack b) :: Int) 
    _ -> error "???"
    
solve_p1 :: String -> Int
solve_p1 s = sum $ map multStr stripped
    where
        regexGraph = "mul\\([0-9]{1,3},[0-9]{1,3}\\)"
        matches = getAllTextMatches (s =~ regexGraph) :: [String]
        stripped = map (fromJust . stripPrefix (pack "mul(") . fromJust . stripSuffix (pack ")") . pack) matches

main :: IO ()
main = do
    io <- getContents
    let
        l = splitOn (pack "don't") (pack io) 
        (h, split_dont) = (head l, tail l) -- this is bad
        split_do = map (splitOn $ pack "do") split_dont
        oks = map tail split_do
        res1 = solve_p1 . unpack $ h
        res2 = map (sum . map (solve_p1 . unpack)) oks
    print $ res1 + sum res2
