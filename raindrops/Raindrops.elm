module Raindrops exposing (..)


plXnger : String -> Int -> Int -> String -> String   
plXnger letter factor input collect = 
    if input % factor == 0 then 
        collect ++ "Pl" ++ letter ++ "ng"  
    else 
        collect

raindrops : Int -> String 
raindrops int = 
    let
        pling = 
            plXnger "i" 3 int
        plang = 
            plXnger "a" 5 int
        plong = 
            plXnger "o" 7 int   
        worded = 
            ""
            |> pling 
            |> plang 
            |> plong 
    in 
        if (String.isEmpty worded) then 
            toString int 
        else 
            worded 