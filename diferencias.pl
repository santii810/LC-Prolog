:-op(600,xfy,[\]).

/**********************INVERTIR**********************/
/* Solucion SIN diferencias de listas */
invertir([],[]).
invertir([Car|Cdr],R) :- invertir(Cdr, T), append(T,[Car],R).

/* Solucion CON diferencias de listas */
invertir2(L,R) :- invertir_dl(L,R\[]).

invertir_dl([],R\R).
invertir_dl([Car|Cdr],R\C) :- invertir_dl(Cdr, R\[Car|C]).



/******* APLANAR ***************/
aplanar([],[]).
aplanar(Atomo,[Atomo]):- atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr],X):-
	aplanar(Car,A),
	aplanar(Cdr,B),
	append(A,B,X).
	
/************ APLANAR CON DL *************/
aplanar2(X,R):- aplanar_dl(X,R\[]).

aplanar_dl([],R\R).
aplanar_dl(Atomo,[Atomo|Cdr]\Cdr):- 
	atomic(Atomo), Atomo \== [].
aplanar_dl([Car|Cdr], X\Z):-
	aplanar_dl(Car,X\Y),
	aplanar_dl(Cdr,Y\Z).





/*********** CARTESIANO *****/
cartesiano([],_,[]).
cartesiano(_,[],[]).
cartesiano([Car|Cdr],Y,R):-
	linea(Car,Y,Linea),
	cartesiano(Cdr,Y,C),
	append(Linea,C,R).
	
linea(_,[],[]).
linea(X,[Car|Cdr],[[X,Car]|R]):-
	linea(X,Cdr,R).

/**************** CARTESIANO CON DL **/
cartesiano2(X,Y,Z):- cartesiano_dl(X,Y,Z\[]).

cartesiano_dl(_,[],R\R).
cartesiano_dl([],_,R\R).
cartesiano_dl([Car|Cdr],Y,A\C):-
	linea_dl(Car,Y,A\B),
	cartesiano_dl(Cdr,Y,B\C).

linea_dl(_,[],R\R).
linea_dl(X,[Car|Cdr],[[X,Car]|L]\R ):-
	linea_dl(X,Cdr, L\R ).




/****************** QUICKSORT ************/
quicksort([],[]):-!.
quicksort([Car|Cdr],R):-
	partir(Car,Cdr,Izq,Der),
	quicksort(Izq,IzqOrd),
	quicksort(Der,DerOrd),
	append(IzqOrd,[Car|DerOrd],R).
	
partir(_,[],[],[]):-!.
partir(Pivote,[Car|Cdr],[Car|Izq],Der):-
	Car =< Pivote, !,
	partir(Pivote,Cdr,Izq,Der).
partir(Pivote,[Car|Cdr],Izq,[Car|Der]):-
	partir(Pivote,Cdr,Izq,Der).
	
/************** QUICKSORT DL ***************/
quicksort2(X,Y):- quicksort_dl(X,Y\[]).

quicksort_dl([],R\R):-!.
quicksort_dl([Car|Cdr],	X\Z	):-
	partir(Car,Cdr,Izq,Der),
	quicksort_dl(Izq,X\[Car|Y]),
	quicksort_dl(Der,Y\Z).





/**********************ROTAR***********************/
/* Solucion SIN diferencias de listas */
rotar([Car|Cdr],R) :- append(Cdr,[Car],R).

/* Solucion CON diferencias de listas */
rotar([])










