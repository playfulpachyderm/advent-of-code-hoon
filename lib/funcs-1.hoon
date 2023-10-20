/+  utils

|%
::
:: An elf is just carrying a bunch of calories
+$  elf  (list @ud)
::
:: Given a text block representing an elf, return the elf
++  parse-elf
  |=  [txt=tape]
  ^-  elf
  %-  turn  :-
    (split:utils txt "\0a")
  |=  [num=tape]  ~&  num  (scan num dem)
::
:: Calculate how many total calories the elf is carrying
++  total-elf-cals
  |=  [=elf]
  ^-  @ud
  (roll elf add)
--
