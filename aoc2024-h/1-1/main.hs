module Main where
import Data.List ( sort )

main :: IO ()
main = do {
    io <- getContents
    ; let ls = lines io
    ; let i32s = map words ls
    ; let parsed_i32s = map (\[x, y] -> (read x :: Integer, read y :: Integer)) i32s
    ; let (a, b) = unzip parsed_i32s
    ; let (c, d) = (sort a, sort b)::([Integer], [Integer])
    ; let final_i32s = zip c d
    ; let res = foldl (\acc (x, y) -> (+) acc $ abs  (x - y)) 0 final_i32s
    ; print res
}