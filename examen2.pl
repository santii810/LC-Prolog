pre(v,[]). 
pre(h(X),[X]). 
pre(n(X,I,D),L) :- 
        append([X|L1],L2,L), 
        pre(I,L1), 
        pre(D,L2). 
 
in(v,[]). 
in(h(X),[X]). 
in(n(X,I,D),L) :- 
        append(L1,[X|L2],L), 
        in(I,L1), 
        in(D,L2). 
 
post(v,[]). 
post(h(X),[X]). 
post(n(X,I,D),L) :- 
        post(I,L1), 
        post(D,L2), 
        append(L1,L2,L3), 
        append(L3,[X],L). 
 
% Ejemplo; 
%    ?- pre(A,[2,7,3,6,5,11,8,9,4]), in(A,[3,7,5,6,11,2,8,9,4]), post(A,L). 
%    A = n(2,n(7,h(3),n(6,h(5),h(11))),n(8,v,n(9,v,h(4)))), 
%    L = [3,5,11,6,7,4,9,8,2] 


preorden2(Arbol,Preorden) :- preoden_dl(Arbol,Preorden\[]).
preoden_dl(arbol(A,nil,nil),[A|X]\X):-!.
preorden_dl(arbol(A,X,nil),[A|S]\Z) :- preoden_dl(X,S\Z),!.
preoden_dl(arbol(A,nil,X),[A|S]\Z) :- preoden_dl(X,S\Z),!.
preoden_dl(arbol(A,X,Y),[A|T]\O) :- preoden_dl(X,T\Z),preoden_dl(Y,Z\O).


inorden2(Arbol,Inorden) :- inorden_dl(Arbol, Inorden-[]).
inorden_dl(arbol(A,nil,nil),[A|X]-X) :-!.

inorden_dl(arbol(A,I,nil),C-X) :- 
	inorden_dl(I,C-[A|X]).
	
inorden_dl(arbol(A,nil,D),[A|S]-X) :- 
	inorden_dl(D,S-X).
	
inorden_dl(arbol(A,I,D),C-F) :- 
	inorden_dl(I,C-[A|X]),
	inorden_dl(D,X-F).