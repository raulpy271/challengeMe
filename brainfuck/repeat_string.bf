           Description: https://www.codewars.com/kata/57a0e5c372292dd76d000d7e/bf

           cell0 = n
           cell1 = empty
           cell2_m = string

,          read cell0

>>,[>,]    read input in cell2 to cell_m

<[<]<      go to cell0

[          repeat until n is zero
  >>[.>]   print string
  <[<]<    go to cell0
  -        decrement n
]
