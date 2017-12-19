:-op(600,xfy,[-]).

frase(Arbol,Frase) :- frase_dl(Arbol,Frase-[]).

/Facunda es una gran cocinera/
/*Cuida mucho a su familia */
/*Un dia fue tan famosa como su nieto */

frase_dl(f(SN,SV),P0-P2) :- sn(SN,Num,P0-P1),sv(SV,Num,P1-P2).

/*Es fantastica y nunca se enfada */
frase_dl(f(f(SN,SV),Conj,f(SN2,SV2)),P0-P5) :- sn(SN,Num,P0-P1),sv(SV,Num,P1-P2),conj(Conj,P2-P3),sn(SN2,Num,P3-P4),sv(SV2,Num,P4-P5).


/*Facunda es una gran cocinera */
sn(sn(N),Num,P0-P1) :- n(N,Num,Gen,P0-P1).
sv(sv(V,CD),Num,P0-P2) :- v(V,Num,P0-P1),cd(CD,P1-P2).
cd(cd(Det,Adj,N),P0-P3) :- det(Det,Num,Gen,P0-P1),adj(Adj,Num,Gen,P1-P2),n(N,Num,Gen,P2-P3).

/Es fantastica y nunca se enfada/
sn(sn(nil),_,P0-P0).
sv(sv(V,Adj),Num,P0-P2) :- v(V,Num,P0-P1),adj(Adj,Num,Gen,P1-P2).
sv(sv(Adv,Pron,V),Num,P0-P3) :- adv(Adv,P0-P1),pron(Pron,Num,Gen,P1-P2),v(V,Num,P2-P3).

/*Cuida mucho a su familia */
sv(sv(V,CCC,CD),Num,P0-P3) :- v(V,Num,P0-P1),ccc(CCC,P1-P2),cd(CD,P2-P3).
ccc(ccc(Adv),P0-P1) :- adv(Adv,P0-P1).
cd(cd(Prep,Det,N),P0-P3) :- prep(Prep,P0-P1),det(Det,Num,Gen,P1-P2),n(N,Num,Gen,P2-P3).

/Un dia fue tan famosa como su nieto/
sn(sn(Det,N),Num,P0-P2) :- det(Det,Num,Gen,P0-P1),n(N,Num,Gen,P1-P2).
sv(sv(V,CD),Num,P0-P2) :- v(V,Num,P0-P1),cd(CD,P1-P2).
cd(cd(Adv,Adj,Mod),P0-P3) :- adv(Adv,P0-P1),adj(Adj,Num,Gen,P1-P2),mod(Mod,P2-P3).
mod(mod(Adv,Det,N),P0-P3):- adv(Adv,P0-P1),det(Det,Num,Gen,P1-P2),n(N,Num,Gen,P2-P3).





/*Facunda es una gran cocinera */
n('Facunda',,,['Facunda'|X]-X).
v(es,sing,[es|X]-X).
det(una,sing,fem,[una|X]-X).
adj(gran,sing,_,[gran|X]-X).
n(cocinera,sing,fem,[cocinera|X]-X).

/*Es fantastica y nunca se enfada */
v('Es',sing,['Es'|X]-X).
adj(fantastica,sing,fem,[fantastica|X]-X).
conj(y,[y|X]-X).
adv(nunca,[nunca|X]-X).
pron(se,,,[se|X]-X).
v(enfada,sing,[enfada|X]-X).

/*Cuida mucho a su familia */

v('Cuida',sing,['Cuida'|X]-X).
adv(mucho,[mucho|X]-X).
prep(a,[a|X]-X).
det(su,sing,_,[su|X]-X).
n(familia,sing,_,[familia|X]-X).

/*Un dia fue tan famosa como su nieto */

det('Un',sing,masc,['Un'|X]-X).
n(dia,sing,masc,[dia|X]-X).
v(fue,sing,[fue|X]-X).
adv(tan,[tan|X]-X).
adj(famosa,sing,_,[famosa|X]-X).
adv(como,[como|X]-X).
det(su,sing,_,[su|X]-X).
n(nieto,sing,masc,[nieto|X]-X).
n(nieta,sing,fem,[nieta|X]-X).