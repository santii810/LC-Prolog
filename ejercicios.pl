invertir([],[]).
invertir([Car|Cdr],R):-
	invertir(Cdr,T),
	append(T,[Car],R).

miembro(X,[X|_]).
miembro(X,[_,Cdr]):- miembro(X,Cdr).

concatenar([],X,X).
concatenar([Car|Cdr],X,[Car|R]):- 
	concatenar(Cdr,X,R).

intercalar([],X,X).
intercalar(X,[],X).
intercalar([CarX|CdrX],[CarY|CdrY],[CarX,CarY|T] ):-
	intercalar(CdrX,CdrY, T).

aplanar([],[]).
aplanar(Atomo,[Atomo]) :- 
	atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr],R):-
	aplanar(Car,CarAplanado),
	aplanar(Cdr,CdrAplanado),
	concatenar(CarAplanado,CdrAplanado,R).

	
interseccion([],_,[]).
interseccion([Car|Cdr],C,[Car|Inter]):-
	member(Car,C),!,
	interseccion(Cdr,C,Inter).
interseccion([_|Cdr],C,Inter):-
	interseccion(Cdr,C,Inter).

union([],X,X).
union([Car|Cdr],C, R     ) :-
	member(Car,C),!,
	union(Cdr,C,R).
union([Car|Cdr],C,[Car|R]):-
	union(Cdr,C,R).


cartesiano([],_,[]).
cartesiano([Car|Cdr],X, R):-
	linea(Car,X,A),
	cartesiano(Cdr,X,B),
	append(A,B,R).
	

	
linea(_,[],[]).
linea(X,[Car|Cdr], [[X,Car]|R]):-
		linea(X,Cdr,R).




