|%
::
:: Split `txt` using `sep` as a separator, returning a list of tapes
++  split
  |=  [txt=tape sep=tape]
  ^-  (list tape)
  :: If it's empty, return [~]
  ?~  txt
    ~
  ::
  =/  i  (fall (find sep txt) (lent txt))
  :-  (scag i `tape`txt) :: the part before the sep
  $(txt (slag (add (lent sep) i) `tape`txt)) :: keep splitting the part after the sep
::
:: Split a file into lines
++  lines
  |=  [txt=tape]
  ^-  (list tape)
  (split txt "\0a")
::
:: Get an input file
++  get-input-file
  |=  [bec=beak now=@da num=@t]
  ^-  tape
  (trip .^(@t %cx /(scot %p p.bec)/advent/(scot %da now)/inputs/[num]/hoon))
++  eq
  |=  [a=* b=*]
  =/  t1  -:!>(a)
  =/  t2  -:!>(b)
  ?.  .=  -:!>(a)  -:!>(b)
    ~&  "Types don't match: {<t1>} vs {<t2>}"
    %.n
  ?.  .=  a  b
    ~&  "Values differ: {<a>} vs {<b>}"
    %.n
  %.y
--

::(split "thing1, thing2, thing3" ", ")
