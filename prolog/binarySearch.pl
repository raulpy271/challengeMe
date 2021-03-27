%% Algoritmo de busca binária
:- [sublist].


binarySearch(List, Element) :-
    [ElementInList] = List,
    ElementInList == Element.


binarySearch(List, Element) :-
    len(Length, List),
    getIntergerDivisionByTwo(Half, Length),
    sublist( [ FirstElementOfSecondList | _ ], List, Half, Length),
    FirstElementOfSecondList == Element.


binarySearch(List, Element) :-
    len(Length, List),
    getIntergerDivisionByTwo(Half, Length),
    sublist(FirstSublist, List, 0, Half),
    sublist( [ FirstElementOfSecondList | _ ], List, Half, Length),
    Element < FirstElementOfSecondList,
    binarySearch(FirstSublist, Element).


binarySearch(List, Element) :-
    len(Length, List),
    getIntergerDivisionByTwo(Half, Length),
    sublist( [ FirstElementOfSecondList | SecondSublist ], List, Half, Length),
    Element > FirstElementOfSecondList,
    binarySearch(SecondSublist, Element).


getIntergerDivisionByTwo(Division, Number) :-
    0 is Number mod 2,
    Division is Number / 2.


getIntergerDivisionByTwo(Division, Number) :-
    Division is ( Number - 1) / 2.


testsBinarySearch :-
    getIntergerDivisionByTwo(1, 3),
    getIntergerDivisionByTwo(2, 4),
    \+ binarySearch([], _),
    \+ binarySearch([1], 3),
    \+ binarySearch([1, 2, 5], 3),
    binarySearch([[]], []),
    binarySearch([_, _, X, _, _], X),
    binarySearch([1, 2, 3, 4], 1),
    binarySearch([1, 2, 3, 4], 4).

