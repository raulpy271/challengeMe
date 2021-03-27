%% Algoritmo que extrai sublista de um lista
:- [lengthOfList].


sublist(Sublist, List, InitialPosition, EndPosition) :-
    InitialPosition >= 0,
    InitialPosition =< EndPosition,
    len(LengthOfList, List),
    EndPosition =< LengthOfList,
    ActualPosition = 0,
    sublistHelper(Sublist, List, InitialPosition, EndPosition, ActualPosition).


sublistHelper(Sublist, _, InitialPosition, EndPosition, ActualPosition) :-
    ActualPosition >= InitialPosition,
    ActualPosition == EndPosition,
    Sublist = [].


sublistHelper(Sublist, List, InitialPosition, EndPosition, ActualPosition) :-
    [ ElementInActualPosition | Tail] = List,
    ActualPosition >= InitialPosition,
    ActualPosition < EndPosition,
    IndexIncremented is ActualPosition + 1,
    sublistHelper(
        SublistOfTail, Tail, InitialPosition, EndPosition, IndexIncremented),
    Sublist = [ElementInActualPosition | SublistOfTail ].


sublistHelper(Sublist, List, InitialPosition, EndPosition, ActualPosition) :-
    [ _ | Tail] = List,
    IndexIncremented is ActualPosition + 1,
    sublistHelper(
        SublistOfTail, Tail, InitialPosition, EndPosition, IndexIncremented),
    Sublist = SublistOfTail.


testsSublist :-
    \+ sublist(_, _, -2, _),
    \+ sublist(_, [0, 1], 0, 10),
    sublist( [], _, 2, 2),
    sublist([0, 1], [0, 1, _, _], 0, 2),
    sublist([2, 3], [_, _, 2, 3], 2, 4).

