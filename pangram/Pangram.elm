module Pangram exposing (..)

import Set exposing (fromList, size)
import Regex exposing (..)
import String exposing (split, toLower)
import List exposing (map, filter)
-- to list of letters, filter non ascii, convert to set, do size 
{-

i think this is crappy because all these variables hang in memory for no reason 

isPangram : String -> Bool 
isPangram phrase = 
    let 
        letters = String.split "" phrase 
        downcased = List.map (\c -> String.toLower c) letters 
        onlyLetters = List.filter (\c -> contains (regex "[a-z]") c) downcased
        uniq = Set.fromList onlyLetters 
    in 
        Set.size uniq == 26 
-}

removeNotAZ : String -> List String 
removeNotAZ strings = 
    map .match (find All (regex "[a-z]") strings)


isPangram : String -> Bool 
isPangram phrase =     
    phrase 
        |> toLower
        |> removeNotAZ
        |> fromList
        |> \set -> size set == 26