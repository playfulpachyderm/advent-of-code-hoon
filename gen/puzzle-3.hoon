/+  utils
/+  *funcs-3

=>
:: Tests
|%
++  test-parse-rucksack
  ?&
    %-  eq:utils  :-
      (parse-rucksack "vJrwpWtwJgWrhcsFMMfFFhFp")
    [a="vJrwpWtwJgWr" b="hcsFMMfFFhFp"]
  ==
++  test-in-both-compartments
  ?&
    %-  eq:utils  :-
      (in-both-compartments (parse-rucksack "vJrwpWtwJgWrhcsFMMfFFhFp"))
    "p"
    %-  eq:utils  :-
      (in-both-compartments (parse-rucksack "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"))
    "L"
  ==
++  test-get-priority
  ?&
    %-  eq:utils  :-
      (get-priority 'p')
    16
    %-  eq:utils  :-
      (get-priority 'L')
    38
  ==
++  test-in-all
  ?&
    %-  eq:utils  :-
      =/  txt  %-  trip
        '''
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        '''
      =/  txts  (split:utils txt "\0a")
      %-  in-all  (turn txts parse-rucksack)
    "r"
    %-  eq:utils  :-
      =/  txt  %-  trip
        '''
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
        '''
      =/  txts  (split:utils txt "\0a")
      %-  in-all  (turn txts parse-rucksack)
    "Z"
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
?>  test-parse-rucksack
?>  test-in-both-compartments
?>  test-in-all
?>  test-get-priority
::
=/  input         (split:utils (get-input-file:utils bec now '3') "\0a")
=/  rucksacks     (turn input parse-rucksack)
:: Part 1
::=/  commons       (turn rucksacks in-both-compartments)
::
:: Part 2
=/  commons  |-
  ?:  (lth (lent rucksacks) 3)
    ~
  :-
    %-  in-all  (scag 3 rucksacks)
  $(rucksacks (slag 3 rucksacks))
::
=/  priorities    (turn commons |=([a=tape] (get-priority (snag 0 a))))
(roll priorities add)
