,  cell0 = int n
 
[  loop until cell0 turn zero | this loop copy cell0 to cell1 and cell2
  >+  add one to cell1 
  >+  add one to ecll2
  <<  go to cell0
  -   decrement cell0
]

> go to cell1

[ loop until cell1 turn zero
  - decrement cell1
  >+< add one to cell2 and go to cell1
]

>. print cell2
