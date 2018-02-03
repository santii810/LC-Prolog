:-op(100,fx,[en]).
:-op(200,fx,[incluido]).
:-op(300,yfx,[esta]).
:-op(400,xf,[que]).


X esta incluido en Y que esta incluido en Z  :- inclusion(X,Y),inclusion(Y,Z).

inclusion([],_).
inclusion([Car|Cdr],C) :- miembro(Car,C),inclusion(Cdr,C).

miembro(Elemento,[Elemento|_]):-!.
miembro(Elemento,[_|Cdr]) :- miembro(Elemento,Cdr).

