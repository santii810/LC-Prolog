mujer(clara).
mujer(luisa).
mujer(marisa).
mujer(nelida).

ocupacion(disenadora).
ocupacion(florista).
ocupacion(jardinera).
ocupacion(directora).

no_es(clara,florista).    /* pista 1 */
no_es(clara,jardinera).   /* pista 1 */
no_es(luisa,florista).    /* pista 2 */
no_es(luisa,directora).   /* pista 3 */
no_es(maria,directora).   /* pista 3 */
no_es(nelida,jardinera).  /* pista 4 */
no_es(nelida,disenadora). /* pista 4 */

diferentes(A,B,C,D) :- not(A == B),
                       not(A == C),
                       not(A == D),
                       not(B == C),
                       not(B == D),
                       not(C == D).

resolver([[M1,O1],[M2,O2],[M3,O3],[M4,O4]]) :- mujer(M1),mujer(M2),
                                             mujer(M3),mujer(M4),
					     ocupacion(O1),
					     ocupacion(O2),
					     ocupacion(O3),
					     ocupacion(O4),
					     diferentes(M1,M2,M3,M4),
     					     diferentes(O1,O2,O3,O4),
					     not(no_es(M1,O1)),
					     not(no_es(M2,O2)),
					     not(no_es(M3,O3)),
					     not(no_es(M4,O4)).	












