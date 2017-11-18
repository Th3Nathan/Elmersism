module Leap exposing (..)

isDivisibleBy : Int -> Int -> Bool 
isDivisibleBy start factor =
    start % factor == 0

isLeapYear : Int -> Bool 
isLeapYear year = 
    let 
        divByYear = 
            isDivisibleBy year 
    in 
        if divByYear 4 then 
            if divByYear 100 then 
                divByYear 400
            else 
                True
        else 
            False 