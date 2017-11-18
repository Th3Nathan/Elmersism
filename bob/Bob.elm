module Bob exposing (..)
import Regex exposing (contains, regex)
import Array exposing (..)
-- gotta split the string on periods then take the last valid one


parseMaybe : Maybe String -> String 
parseMaybe str = 
    case str of 
        Nothing -> ""
        Just str -> str 

lastSentence : String -> String 
lastSentence phrase = 
    let sentances = 
        Array.fromList (String.split "." phrase)
    in 
        if (Array.length sentances == 1) then 
                parseMaybe (Array.get 0 sentances)
            else 
                String.dropLeft 1 (parseMaybe (Array.get (Array.length sentances - 1) (Array.filter (\w -> w /= "") sentances)))


filterAbbs : String -> String 
filterAbbs phrase = 
    String.join " " (List.filter (\word -> word /= "DMV." && word /= "OK" && word /= "OK?") (String.words phrase))

angry : String -> Bool
angry phrase = 
    contains (regex "[A-Z]") (String.dropLeft 1 (filterAbbs (lastSentence phrase))) 

question : String -> Bool 
question phrase = 
    String.slice -2 -1 phrase == "?" 

hey : String -> String
hey phrase = 
    if (angry phrase) then "Whoa, chill out!" 
    else if (question phrase) then "Sure."
    else "Whatever."