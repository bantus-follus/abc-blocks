/+  *test
/=  abc-blocks  /gen/abc-blocks
|%
::  test for failure of incomplete alphabet
::
++  test-01
  =/  blocks  `(list (pair @t @t))`[['a' 'b'] ['c' 'd'] ['e' 'f'] ['g' 'h'] ['i' 'j'] ['k' 'l'] ['m' 'n'] ['o' 'p'] ['q' 'q'] ['s' 't'] ['u' 'v'] ['w' 'x'] ['y' 'z'] ~]
  =/  word  `@t`'foo'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-02
  =/  blocks  `(list (pair @t @t))`[['a' 'b'] ['c' 'd'] ['e' 'f'] ['g' 'h'] ['i' 'j'] ['k' 'l'] ['m' 'n'] ['q' 'r'] ['s' 't'] ['u' 'v'] ['w' 'x'] ['y' 'z'] ~]
  =/  word  `@t`'foo'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-03
  =/  blocks  `(list (pair @t @t))`[['A' 'B'] ['C' 'D'] ['E' 'F'] ['G' 'H'] ['I' 'J'] ['K' 'L'] ['M' 'N'] ['O' 'P'] ['Q' 'R'] ['S' 'A'] ['U' 'V'] ['W' 'X'] ['Y' 'Z'] ~]
  =/  word  `@t`'foo'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-04
  =/  blocks  `(list (pair @t @t))`[['A' 'B'] ['C' 'D'] ['e' 'f'] ['G' 'H'] ['I' 'J'] ['K' 'L'] ['M' 'N'] ['O' 'P'] ['Q' 'R'] ['S' 'A'] ['U' 'V'] ['W' 'X'] ['Y' 'Z'] ['A' 'B'] ['j' 'x']~]
  =/  word  `@t`'foo'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-05
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'foo'
  %-  expect-fail  |.  (abc-blocks blocks word)
::  test for failure of input word
::
++  test-06
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'foo bar'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-07
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'foo1bar'
  %-  expect-fail  |.  (abc-blocks blocks word)
++  test-08
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'foo!bar'
  %-  expect-fail  |.  (abc-blocks blocks word)
::  test for success with various capitalizations and alphabets
::
++  test-09
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'TRAP'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
++  test-10
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'trap'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
++  test-11
  =/  blocks  `(list (pair @t @t))`[['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'tRaP'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
++  test-12
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'a'] ['c' 't'] ['r' 'o'] ['p' 'n'] ['e' 'y'] ~]
  =/  word  `@t`'TRAP'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
++  test-13
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'A'] ['c' 't'] ['R' 'o'] ['p' 'n'] ['e' 'y'] ~]
  =/  word  `@t`'trap'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
++  test-14
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'A'] ['c' 't'] ['R' 'o'] ['p' 'n'] ['e' 'y'] ['x' 'y'] ['a' 'b'] ~]
  =/  word  `@t`'fsixqhgjvtrnyyb'
  %+  expect-eq
    !>  %.y
    !>  (abc-blocks blocks word)
::  test for being unable to make a word
::
++  test-15
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'A'] ['c' 't'] ['R' 'o'] ['p' 'n'] ['e' 'y'] ['x' 'y'] ['a' 'b'] ~]
  =/  word  `@t`'fsixqhgjvtrnyyyb'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
++  test-16
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'A'] ['c' 't'] ['R' 'o'] ['p' 'n'] ['e' 'y'] ['x' 'y'] ['a' 'b'] ~]
  =/  word  `@t`'fsixqhgujvtrnyyb'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
++  test-17
  =/  blocks  `(list (pair @t @t))`[['f' 'm'] ['w' 's'] ['i' 'b'] ['d' 'x'] ['q' 'k'] ['z' 'h'] ['g' 'l'] ['u' 'j'] ['v' 'A'] ['c' 't'] ['R' 'o'] ['p' 'n'] ['e' 'y'] ['x' 'y'] ['a' 'b'] ~]
  =/  word  `@t`'AAA'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
++  test-18
  =/  blocks  `(list (pair @t @t))`[['A' 'B'] ['C' 'D'] ['E' 'F'] ['G' 'H'] ['I' 'J'] ['K' 'L'] ['M' 'N'] ['O' 'P'] ['Q' 'R'] ['S' 'T'] ['U' 'V'] ['W' 'X'] ['Y' 'Z'] ~]
  =/  word  `@t`'AGENTT'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
++  test-19
  =/  blocks  `(list (pair @t @t))`[['A' 'B'] ['C' 'D'] ['E' 'F'] ['G' 'H'] ['I' 'J'] ['K' 'L'] ['M' 'N'] ['O' 'P'] ['Q' 'R'] ['S' 'T'] ['U' 'V'] ['W' 'X'] ['Y' 'Z'] ['S' 'T'] ~]
  =/  word  `@t`'AGENTtT'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
++  test-20
  =/  blocks  `(list (pair @t @t))`[['A' 'Z'] ['A' 'Z'] ['F' 'M'] ['W' 'S'] ['I' 'B'] ['D' 'X'] ['Q' 'K'] ['Z' 'H'] ['G' 'L'] ['U' 'J'] ['V' 'A'] ['C' 'T'] ['R' 'O'] ['P' 'N'] ['E' 'Y'] ~]
  =/  word  `@t`'ZAZAZ'
  %+  expect-eq
    !>  %.n
    !>  (abc-blocks blocks word)
--