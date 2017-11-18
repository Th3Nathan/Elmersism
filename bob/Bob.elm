module Bob exposing (..)
import String exposing (..)

angry : String -> Bool
angry phrase = 
    (toUpper phrase == phrase) && (toLower phrase /= phrase)

question : String -> Bool 
question phrase = 
    right 1 phrase == "?" 

empty : String -> Bool 
empty phrase = 
    isEmpty (trim phrase)

type PhraseType = Angry | Empty | Question | Other 

getPhraseType : String -> PhraseType 
getPhraseType phrase = 
    if (angry phrase) then
        Angry
    else if (question phrase) then
        Question
    else if (empty phrase) then
        Empty
    else 
        Other


hey : String -> String
hey phrase =
    let 
        phraseType = 
            getPhraseType phrase   
    in 
        case phraseType of 
            Angry -> "Whoa, chill out!" 
            Question -> "Sure."
            Empty -> "Fine. Be that way!"
            Other -> "Whatever."