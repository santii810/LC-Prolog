hombre('Socrates').
mortal(Persona) :- hombre(Persona).


% Los numeros sucesores a 0 son naturales.
natural(0).
natural(s(N)) :- natural(N). % s(N) -> sucesor(N).


% si x+y = z => (x+1)+y=(z+1).
suma(0,X,X) :- natural(X).
suma(s(X),Y,s(Z)) :- suma(X,Y,Z).


% producto
prod(0,X,0) :- natural(X).
prod(s(0),X,X).		%1*x=x
prod(s(X),Y,Z) :- prod(X,Y,W),suma(W,Y,Z).

