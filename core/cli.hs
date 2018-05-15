import Data.Maybe
import Control.Monad (join)
import System.IO

-- ================= --

import Tournament.Naive
import Core.Parser
import Core.Data

-- ================= --

readEntries :: IO [ Entry ]
readEntries = getLine >>= return . splitEntries

readChoice :: String -> IO Choice
readChoice s =
        putStrLn s >> hFlush stdout >>
        getLine >>=
        (return . parseChoice) >>=
        (\x -> case x of
            Just x -> return x
            Nothing -> putStrLn "Wrong input" >> hFlush stdout >> readChoice s
        )

-- ================= --

main :: IO ()
main = readEntries >>= (chooseEntry readChoice) >>= putStrLn