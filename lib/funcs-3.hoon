/+  utils

|%
+$  compartment  tape
+$  rucksack  [a=tape b=tape]

::
:: Parse a tape into a rucksack
++  parse-rucksack
  |=  [txt=tape]
  ^-  rucksack
  [(scag (div (lent txt) 2) txt) (slag (div (lent txt) 2) txt)]
::
:: Find element in both compartments
++  in-both-compartments
  |=  [=rucksack]
  ^-  tape
  =/  set1  (silt a:rucksack)
  =/  set2  (silt b:rucksack)
  =/  common-elements  (~(int in set1) set2)
  ~(tap in common-elements)
::
:: Find the element that's in all the rucksacks
++  in-all
  |=  [sacks=(list rucksack)]
  ^-  tape
  =/  sets  (turn sacks |=(=rucksack (silt %-(weld rucksack))))
  =/  merge-sets
    |=  [s1=(set @tD) s2=(set @tD)]
    ^-  (set @tD)
    (~(int in s1) s2)
  =/  ret  (snag 0 sets)
  %~  tap  in
  ^-  (set @tD)
  |-
    ?:  (lth (lent sets) 1)
      ret
    $(sets (tail sets), ret (merge-sets ret (snag 0 sets)))
::
:: Convert an alphanumeric char to a "priority" (a-z = 1-26; A-Z = 27-52)
++  get-priority
  |=  [a=@]
  ^-  @ud
  ?:  ?&  (gte a 'a')  (lte a 'z')  ==
    +((sub a 'a'))
  (add 27 (sub a 'A'))
--
