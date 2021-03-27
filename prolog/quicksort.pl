%% implementação do algoritmo de ordenamento quicksort
:- [concat].


quicksort([], []).
quicksort(ListSorted, List) :-
    [First | Tail ] = List,
    FirstMinusOne is First - 1,
    

    getSublistWithElementsLessThanX(
        SublistWithElementsLessThanFirst, First, Tail),
    getSublistWithElementsHigherThanX(
        SublistWithElementsHigherThanFirstOrEqual, FirstMinusOne, Tail),


    quicksort(
        SublistSortedWithElementsLassThanFirst,
        SublistWithElementsLessThanFirst),
    quicksort(
        SublistSortedWithElementsHigherThanFirst,
        SublistWithElementsHigherThanFirstOrEqual),


    concat(ListSorted, SublistSortedWithElementsLassThanFirst, 
        [ First | SublistSortedWithElementsHigherThanFirst ]).


getSublistWithElementsLessThanX([], _, []).
getSublistWithElementsLessThanX(ListFiltered, X, List) :-
    [ Head | Tail ] = List,
    Head < X,
    getSublistWithElementsLessThanX(SublistFiltered, X, Tail),
    ListFiltered = [ Head | SublistFiltered ].


getSublistWithElementsLessThanX(ListFiltered, X, List) :-
    [ _ | Tail ] = List,
    getSublistWithElementsLessThanX(SublistFiltered, X, Tail),
    ListFiltered = SublistFiltered.


getSublistWithElementsHigherThanX([], _, []).
getSublistWithElementsHigherThanX(ListFiltered, X, List) :-
    [ Head | Tail ] = List,
    Head > X,
    getSublistWithElementsHigherThanX(SublistFiltered, X, Tail),
    ListFiltered = [ Head | SublistFiltered ].


getSublistWithElementsHigherThanX(ListFiltered, X, List) :-
    [ _ | Tail ] = List,
    getSublistWithElementsHigherThanX(SublistFiltered, X, Tail),
    ListFiltered = SublistFiltered.


testsWork :-
    testsConcat,
    ListSorted             = [0, 1, 2, 3],
    ListNonSorted          = [3, 2, 1, 0],
    getSublistWithElementsHigherThanX([3], 2, ListSorted),
    getSublistWithElementsLessThanX([0, 1], 2, ListSorted),
    quicksort([], []),
    quicksort([1, 2], [2, 1]),
    quicksort(ListSorted, ListNonSorted).

