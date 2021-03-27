-- Description: https://www.codewars.com/kata/5266876b8f4bf2da9b000362/haskell

module Likes where

likes :: [String] -> String
likes [] = "no one likes this"
likes [person] = person ++ " likes this"
likes [person1, person2] = person1 ++ " and " ++ person2 ++ " like this"
likes [person1, person2, person3] = person1 ++ ", " ++ (likes [person2, person3])
likes persons = person1 ++ ", " ++ person2 ++ " and "
  ++ (show restPersons) ++ " others like this"
  where 
    person1 = persons !! 0
    person2 = persons !! 1
    restPersons = length $ tail $ tail persons
