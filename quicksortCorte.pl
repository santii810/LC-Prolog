quicksort([],[]).
quicksort([Car|Cdr],R) :-
	partir(Car,Cdr,Izq,Der),
	quicksort(Izq,IzqO),
	quicksort(Der,DerO),
	append(IzqO,[Car|DerO],R).
  
 
partir(_,[],[],[]).
partir(Pivote,[Car|Cdr],[Car|Izq],Der):- 
	Car =< Pivote, !,
	partir(Pivote,Cdr,Izq,Der).
 
%solo se emplea cuando el Car > Pivote, sino salta el corte
partir(Pivote,[Car|Cdr],Izq,[Der|Car]):-  
	partir(Pivote,Cdr,Izq,Der).
