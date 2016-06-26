{-
This is a "stub" file.  It's a little start on your solution. It's not a
complete solution though; you have to write some code.

The module name is expected by the test program and must match the name of this
file. It has to stay just the way it is.
-}

module HelloWorld (..) where

import Maybe exposing (..)
-- It's good style to include a types at the top level of your modules.


helloWorld : Maybe String -> String
helloWorld name =
  "Hello, " ++ Maybe.withDefault "World" (name) ++ "!"
