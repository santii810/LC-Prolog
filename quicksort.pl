quicksort([],[]).
 ) :-
	partir(Car,Cdr,Izq,Der),
	quicksort(Izq,IzqO),
	quicksort(Der,DerO),
	append(IzqO,[Car|DerO],R).


partir(_,[],[],[]).
partir(Pivote,[Car|Cdr],[Car|Izq],Der):- 
	Car =< Pivote, 
	partir(Pivote,Cdr,Izq,Der).

partir(Pivote,[Car|Cdr],Izq,[Car|Der]):- 
	Car > Pivote, 
	partir(Pivote,Cdr,Izq,Der).
