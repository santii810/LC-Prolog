invertir([],[]).
invertir([Car|Cdr],R) :- invertir(Cdr,T),concatenar(T,[Car],R).

miembro(Car,[Car|_]).
miembro(X,[_|Cdr]) :- miembro(X,Cdr).

concatenar([],X,X).
concatenar([Car|Cdr],L,[Car|T]):- concatenar(Cdr,L,T).

aplanar([],[]).
aplanar(Atomo,[Atomo]) :- atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr],R) :- aplanar(Car, CarA),
						aplanar(Cdr,CdrA),
						concatenar(CarA,CdrA,R).
						
						
primero([Car|_],Car).
segundo([_,X|_],X).

ultimo([X],X).
ultimo([_|Cdr],X) :- ultimo(Cdr,X).

penultimo([X,_],X).
penultimo([_|Cdr],X) :- penultimo(Cdr,X).

#incluida(L1,L2) true si L1 está incluida en L2
incluido(X,Y) :- miembro(X,Y).
incluido([Car,Cdr],L) :- miembro(Car,L),incluido(Cdr,L).

iguales(L1,L2) :- L1=L2.

 