|=  [blocks=(list (pair @t @t)) word=@t]
=<
=/  alphacheck  (alphabet-check merged-blocks)
?.  (character-check word)
    ~|  "Input word contains invalid characters."  !!
=/  spellcheck  (spell-check word)
spellcheck
|%
++  alphabet  "abcdefghijklmnopqrstuvwxyz"
::
::  merges all blocks into a single tape
++  merged-blocks  (merge blocks)
::
::  turns all blocks into individual tapes
++  tape-blocks    (turn (turn (turn (turn blocks pair-to-list) crip) trip) cass)
++  merge
    |=  blocks=(list (pair @t @t))
    ^-  tape
        (cass (trip (crip `(list @t)`(zing (turn blocks pair-to-list)))))
::
::  converts each pair to a (list @t)
++  pair-to-list
            |=  input=(pair @t @t)
            ^-  (list @t)
                [-:input +:input ~]
::
::  checks if input blocks cover all letters of the alphabet
++  alphabet-check
    |=  input=tape
    ^-  ?
        =/  i  0
        |-
        ?:  =(i 26)
            %.y
        ?~  (find [(snag i alphabet)]~ input)
            ~|  "Full alphabet not found. {<(snag i alphabet)>} not in blocks"  !!
        $(i +(i))
::
::  checks if input word has valid chaaracters. %.y means all characters are valid
++  character-check
    |=  word=@t
    ^-  ?
        =/  i  0
        =/  tapeword  (cass (trip word))
        |-
        ?:  =(+(i) (lent tapeword))
            %.y
        ?~  (find [(snag i tapeword)]~ alphabet)
            %.n
        $(i +(i))
::
::  checks if the word can be spelled using the input blocks
++  spell-check
    |=  word=@t
    ^-  ?
        =/  tapeword     (cass (trip word))
        =/  tape-blocks  tape-blocks
        =/  i  0
        =/  letter  (snag i tapeword)
        |-
        ?:  =(+(i) (lent tapeword))
            =/  blockcheck  (check-blocks [tape-blocks letter])
                ?.  check:blockcheck
                    %.n
            %.y
        =/  blockcheck  (check-blocks [tape-blocks letter])
        ?.  check:blockcheck
            %.n
        $(i +(i), letter (snag +(i) tapeword), tape-blocks (oust [num:blockcheck 1] tape-blocks))
::  cycles through blocks, checking for a letter
++  check-blocks
    |=  [tape-blocks=(list tape) letter=@t]
    ^-  [num=@ check=?]
        =/  i  0
        =/  block  (snag i tape-blocks)
        |-
        ?:  =(+(i) (lent tape-blocks))
            ?~  (find [letter]~ block)
                [~ %.n]
            [i %.y]
        ?~  (find [letter]~ block)
            $(i +(i), block (snag +(i) tape-blocks))
        [i %.y]
    --
