%% Calcula tamanho de uma list


len(Length, List) :- List = [], Length is 0.
len(Length, List) :-
    [ _ | Tail ] = List,
    len(LengthOfTail, Tail),
    Length is 1 + LengthOfTail.


testsLength :-
    len(0, []),
    len(1, [ _ ]),
    len(2, [ _, _]).

