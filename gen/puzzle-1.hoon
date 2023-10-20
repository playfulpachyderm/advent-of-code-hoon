/+  utils
/+  *funcs-1

=>
:: Tests
|%
++  test-parse-elf
  =/  elf-txt  %-  trip
    '''
    1
    3
    5
    10
    '''
  %-  eq:utils  :-
    (parse-elf elf-txt)
  `elf`[1 3 5 10 ~]
++  test-total-elf-cals
  =/  elf  `elf`[1 3 5 10 ~]
  %-  eq:utils  :-
    (total-elf-cals elf)
  19
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
?>  test-parse-elf
?>  test-total-elf-cals
::
=/  input-text  (get-input-file:utils /(scot %p p.bec)/advent/(scot %da now)/inputs/1/hoon)
=/  elves-text  (split:utils input-text "\0a\0a")
=/  elves       (turn elves-text parse-elf)
=/  cals        (turn elves total-elf-cals)
=/  max-cals    (scag 3 (sort cals gth))
::  (roll cals max)  :: Part 1
(roll max-cals add)  :: Part 2
