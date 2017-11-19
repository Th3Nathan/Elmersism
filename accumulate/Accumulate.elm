module Accumulate exposing (..)
accumulate : (a -> b) -> List a -> List b
accumulate func list = 
    let 
        first = List.head list 
    in 
        case first of 
            Nothing -> []
            Just first -> func first :: (accumulate func (List.drop 1 list))


    