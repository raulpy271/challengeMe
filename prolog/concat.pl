%% Functor que concatena duas listas 


concat(ListConcatened, FirstList, SecondList) :- 
    [] = SecondList, 
    ListConcatened = FirstList.


concat(ListConcatened, FirstList, SecondList) :- 
    [] = FirstList, 
    ListConcatened = SecondList.


concat(ListConcatened, FirstList, SecondList) :- 
    [ First | Tail ] = FirstList,
    concat(SubListConcatened, Tail, SecondList),
    ListConcatened = [First | SubListConcatened].


testsConcat :- 
    concat([], [], []),
    concat([1], [1], []),
    concat([1], [], [1]),
    concat([1, 1], [1], [1]),
    concat([1, 2, 3, 4], [1, 2], [3, 4]).

