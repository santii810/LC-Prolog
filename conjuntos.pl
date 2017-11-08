conjunto([]).
conjunto([Car|Cdr]):- member(Car,Cdr),!,fail.
conjunto([_|Cdr]) :- conjunto(Cdr).

union([],C,C).
union([Car|Cdr],C,Union) :- member(Car,C),!,union(Cdr,C,Union).
union([Car|Cdr],C,[Car|Union]) :- union(Cdr,C,Union).


interseccion([],_,[]).
interseccion([Car|Cdr],C,[Car|Inter]) :-
	member(Car,C),!,interseccion(Cdr,C,Inter).
interseccion([_|Cdr],C,Inter) :- 
	interseccion(Cdr,C,Inter).
	
	
	
cartesiano([], _, []).
cartesiano([Car|Cdr], C, Fin) :-
	linea(Car, C, Linea),
	cartesiano(Cdr, C, R),
	append(Linea, R, Fin).

	
linea(_,[],[]).
linea(Elem,[Car|Cdr],[[Elem,Car]|Y]) :- 
	linea(Elem,Cdr,Y), !.	



