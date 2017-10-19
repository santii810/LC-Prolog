uno_toxico_otro_no(violeta,azul).      /* pista 1 */
uno_toxico_otro_no(rojo,amarillo).     /* pista 2 */
uno_toxico_otro_no(azul,naranja).      /* pista 3 */

uno_no_toxico(violeta,amarillo).       /* pista 4 */
uno_no_toxico(rojo,naranja).           /* pista 5 */
uno_no_toxico(verde,azul).             /* pista 6 */

no_toxico(rojo).
no_toxico(X) :- (uno_no_toxico(X,Y);uno_no_toxico(Y,X)), toxico(Y).
toxico(X) :- (uno_toxico_otro_no(X,Y);uno_toxico_otro_no(Y,X)), no_toxico(Y).

resolver(L) :- findall(X,toxico(X),L).