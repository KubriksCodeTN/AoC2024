module Main where

import Text.Regex.Posix( (=~), AllTextMatches (getAllTextMatches) )
import Data.Text ( stripPrefix, stripSuffix, pack, split, unpack, Text )
import Data.Maybe ( fromJust )

multStr :: Text -> Int
multStr s = (read (unpack a) :: Int) * (read (unpack b) :: Int) 
    where
        [a, b] = split (==',') s
    

main :: IO ()
main = do
    io <- getContents
    let
        regexGraph = "mul\\([0-9]{1,3},[0-9]{1,3}\\)"
        matches = getAllTextMatches (io =~ regexGraph) :: [String]
        stripped = map (fromJust . stripPrefix (pack "mul(") . fromJust . stripSuffix (pack ")") . pack) matches
        values = sum $ map multStr stripped
    print values
