:-op(600,xfy,[\]).

/**********************INVERTIR**********************/
/* Solucion SIN diferencias de listas */
invertir([],[]).
invertir([Car|Cdr],R) :- invertir(Cdr, T), append(T,[Car],R).

/* Solucion CON diferencias de listas */
invertir2(L,R) :- invertir_dl(L,R\[]).

invertir_dl([],R\R).
invertir_dl([Car|Cdr],R\C) :- invertir_dl(Cdr, R\[Car|C]).


/********************APLANAR***********************/
/* Solucion SIN diferencias de listas */
aplanar([],[]).
aplanar(Atomo,[Atomo]):-atomic(Atomo), Atomo \== [].
aplanar([Car|Cdr], R):-aplanar(Car,CarA),
                       aplanar(Cdr,CdrA),
                       append(CarA,CdrA,R).

/* Solucion CON diferencias de listas */
aplanar2(Lista,Resultado) :- aplanar_dl(Lista,Resultado\[]).

aplanar_dl([],Lista\Lista) :- !.
aplanar_dl(Atomo,[Atomo|Cdr]\Cdr) :- atomic(Atomo),
                                     Atomo \== [].
aplanar_dl([Car|Cdr],Cabeza\Dif) :- aplanar_dl(Car,Cabeza\Dif_car),
                                    aplanar_dl(Cdr,Dif_car\Dif).

/********************CARTESIANO********************/
/* Solucion SIN diferencias de listas */
linea(_,[],[]) :- !.
linea(E,[Car|Cdr],[[E,Car]|Resto]) :- linea(E,Cdr,Resto).

cartesiano([],_,[]) :- !.
cartesiano([Car|Cdr],C,Resultado) :- linea(Car,C,Linea),
                                     cartesiano(Cdr,C,Resto),
                                     append(Linea,Resto,Resultado).

/* Solucion CON diferencias de listas */
linea_dl(_,[],L\L) :- !.
linea_dl(E,[Car|Cdr],[[E,Car]|Linea]\Resto) :-
	linea_dl(E,Cdr,Linea\Resto).

cartesiano2(C1,C2,Cartesiano) :- cartesiano_dl(C1,C2,Cartesiano\[]).

cartesiano_dl([],_,X\X) :- !.
cartesiano_dl([Car|Cdr],C,Linea\Z) :- linea_dl(Car,C,Linea\Resto),
                                      cartesiano_dl(Cdr,C,Resto\Z).

/*********************QUICKSORT********************/
/* Solucion SIN diferencias de listas */
partir(_,[],[],[]) :- !.
partir(Pivote,[Car|Cdr],[Car|Izq],Der) :- Car =< Pivote,!,
                                          partir(Pivote,Cdr,Izq,Der).
partir(Pivote,[Car|Cdr],Izq,[Car|Der]) :- partir(Pivote,Cdr,Izq,Der).

quicksort([],[]) :- !.
quicksort([Car|Cdr],R) :- partir(Car,Cdr,Izq,Der),
                          quicksort(Izq,Izq_ordenada),
                          quicksort(Der,Der_ordenada),
                          append(Izq_ordenada,[Car|Der_ordenada],R).

/* Solucion CON diferencias de listas */
quicksort2(L,R) :- quicksort_dl(L,R\[]).

quicksort_dl([],L\L) :- !.
quicksort_dl([Car|Cdr],R\T) :- partir(Car,Cdr,Izq,Der),
                               quicksort_dl(Izq,R\[Car|S]),
                               quicksort_dl(Der,S\T).

/***********************L2DL***********************/
/* l2dl([1,2,3],X) */
l2dl([],L\L).
l2dl([Car|Cdr],[Car|Cdr1]\Cdr2) :- l2dl(Cdr,Cdr1\Cdr2).

/* dl2l([1,2,3|[]]\[],X) */
dl2l(L\L,[]).
dl2l([Car|Cdr1]\Cdr2,[Car|Cdr]) :- dl2l(Cdr1\Cdr2,Cdr).


/**********************ROTAR***********************/
/* Solucion SIN diferencias de listas */
rotar([Car|Cdr],R) :- append(Cdr,[Car],R).

/* Solucion CON diferencias de listas */
rotar2(L,R) :- l2dl(L,DL), rotar_dl(DL,R\[]).

rotar_dl(L\L,L\L) :- !.
rotar_dl([Car|Cdr]\[Car|A],Cdr\A).


/**********************PREFIJO**********************/
/* prefijo(ho,hola). La respuesta es true */
/* Solucion SIN diferencias de listas */
prefijo(Pre,Cad) :- name(Pre,PreCod), name(Cad,CadCod),
                    append(PreCod,_,CadCod).

/* Solucion CON diferencias de listas */
/* a ver si veis cual es el problema */
appendl(X\Y,Y\Z,X\Z).

pre(Pre,Cad) :- name(Pre,PreCod), name(Cad,CadCod), 
                l2dl(PreCod,DPreCod),
                l2dl(CadCod,DCadCod),
                appendl(DPreCod,_,DCadCod).

pre2(Pre,Cad) :- name(Pre,PreCod), name(Cad,CadCod), 
                 l2dl(PreCod,DPreCod\X),
                 l2dl(CadCod,DPreCod\Y).


/****************METER PREFIJO**********************/
/* meter_pre(ho,la,X). La respuesta es X=hola */
/* version SIN diferencias de listas */
meter_pre(Pre,Cad,R) :- name(Pre,PreCod), name(Cad,CadCod),
                        append(PreCod,CadCod,RCod),
                        name(R,RCod).

/* versiones CON diferencias de listas */
meter_pre2(Pre,Cad,R) :- name(Pre,PreCod), name(Cad,CadCod),
                         l2dl(PreCod,DRCod\DCadCod),
                         l2dl(CadCod,DCadCod\[]),
                         name(R,DRCod).

meter_pre3(Pre,Cad,R) :- name(Pre,PreCod), name(Cad,CadCod),
                         l2dl(PreCod,DRCod\CadCod),
                         name(R,DRCod).


/*****************METER SUFIJO**********************/
/* meter_suf(la,ho,X). La respuesta es X=hola */
/* version SIN diferencias de listas */
meter_suf(Suf,Cad,R) :- name(Suf,SufCode), name(Cad,CadCode),
                        append(CadCode,SufCode,RCode),
                        name(R,RCode).

/* versiones CON diferencias de listas */
meter_suf2(Suf,Cad,R) :- name(Suf,SufCod), name(Cad,CadCod),
                         l2dl(CadCod,DRCod\DSufCod),
                         l2dl(SufCod,DSufCod\[]),
                         name(R,DRCod).

meter_suf3(Suf,Cad,R) :- name(Suf,SufCod), name(Cad,CadCod),
                         l2dl(CadCod,DRCod\SufCod),
                         name(R,DRCod).
