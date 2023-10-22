/+  utils
/+  *funcs-2

=>
:: Tests
|%
++  test-parse-game
  ?&
    %-  eq:utils  :-
      (parse-game "A Y")
    `game`[us=1 them=2]
    %-  eq:utils  :-
      (parse-game "C Z")
    `game`[us=3 them=3]
  ==
++  test-parse-game-2
  ?&
    %-  eq:utils  :-
      (parse-game-2 "A Y")
    `game`[us=1 them=1]
    %-  eq:utils  :-
      (parse-game-2 "B X")
    `game`[them=2 us=1]
    %-  eq:utils  :-
      (parse-game-2 "C Z")
    `game`[them=3 us=1]
  ==
++  test-score-game
  ?&
    %-  eq:utils  :-
      (score-game [3 1])
    7
    %-  eq:utils  :-
      (score-game [2 1])
    1
    %-  eq:utils  :-
      (score-game [1 3])
    3
    %-  eq:utils  :-
      (score-game [3 3])
    6
    %-  eq:utils  :-
      (score-game (parse-game "A Y"))
    8
  ==
--
::
:: Puzzle
:-  %say
|=  $:  [now=@da eny=@uv bec=beak]
        ~
        ~
    ==
:-  %noun
:: Run the tests
?>  test-parse-game
?>  test-parse-game-2
?>  test-score-game
::
=/  input-text  (get-input-file:utils bec now '2')
=/  games-text  (split:utils input-text "\0a")
::=/  games       (turn games-text parse-game)  :: Part 1
=/  games       (turn games-text parse-game-2)  :: Part 2
=/  scores      (turn games score-game)
(roll scores add)
