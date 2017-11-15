%%Eliminar los 2 primeros elementos de una lista
eliminaPrimeros([_,_|X],X).



%%%Duplicar en la lista los elementos menores que el pivote
dup(_,[],[]):-!.
dup(Pivote,[Car|Cdr], [Car,Car|R]):-
	Pivote>Car,!,
	dup(Pivote,Cdr,R).
dup(Pivote,[Car|Cdr], [Car|R]):-
	dup(Pivote,Cdr,R).
	
	

	
