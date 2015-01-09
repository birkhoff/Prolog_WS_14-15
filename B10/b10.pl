s(P)     --> np(X,Q,P), vp(X,Q).
s(P)	 --> np(X,Q,R), vp(X,Q,R,P).

vp(X,P)  --> tv(X,Y,Q), np(Y,Q,P).
vp(X,VP)--> tv(X,VP).

vp(X,V,R,P)  --> tv(X,Y,V), np(Y,R,P).

np(X,Q,P)--> det(X,R,Q,P), n(X,R).
np(X,P,P) --> pn(X).

np(X,Ext,NP)-->
     det(X,Rel,Ext,NP),
     n(X,N),
     rel(X,N,Rel).
rel(_,P,P)--> [].
rel(X,N,(N+VP))--> [that], vp(X,VP).

tv(X,lives(X))			--> [lives].
tv(X,Y,loves(X,Y))      --> [loves].
det(X,R,Q,all(X,R->Q))  --> [every].
det(X,R,Q,exists(X,Q+R))--> [a].
n(X,man(X))             --> [man].
n(X,woman(X))           --> [woman].

pn(john) --> [john].	


genlist(0,[]).
  genlist(N,[_|T]):-
     N > 0, M is N-1, genlist(M,T).
  generate(N):- genlist(N,S), parse(S).


generateall(N):-
     genlist(N,S), s(S,[]), write(S), nl,
     fail.
generateall(_).


generateall(Max,Max):- 	generateall(Max).
generateall( N ,Max):-  N < Max, M is N+1,
    					generateall(N),
    					generateall(M,Max).