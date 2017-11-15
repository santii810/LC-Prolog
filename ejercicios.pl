concatenar([],X,X).
concatenar([Car|Cdr],L,[Car|T]):- 
	concatenar(Cdr,L,T).

invertir([],[]).
invertir([Car|Cdr],R):- 
	invertir(Cdr,T), 
	concatenar(T,[Car],R).
	
	