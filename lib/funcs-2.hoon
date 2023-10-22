/+  utils

|%
+$  game  $:(them=@ud us=@ud)
::
:: Parse a three-letter string as a game of rock-paper-scissors
++  parse-game
  |=  [txt=tape]
  ^-  game
  :-  +((sub (snag 0 txt) 'A'))
  +((sub (snag 2 txt) 'X'))
::
:: Same as above but for part 2 of puzzle
++  parse-game-2
  |=  [txt=tape]
  ^-  game
  =/  them  +((sub (snag 0 txt) 'A'))
  =/  result  (sub (snag 2 txt) 'V')
  =/  us  (add result them)
  :-  them
  |-  ?:  (gth us 3)
    $(us (sub us 3))
  us
::
:: Evaluate the score of a game
++  score-game
  |=  [=game]
  ^-  @ud
  %-  add  :-
    us.game
  ?:  =(us.game them.game)
    3  :: Tie
  ?:  ?|(=(us.game +(them.game)) =((add us.game 2) them.game))
    6  :: Win!
  0
--
