app([],Y,Y).
app([X|T],Y,[X|R]):-
	app(T,Y,R).
	
del(X,[X|T],T).
del(X,[Y|T],[Y|R]):-
	del(X,T,R).
	

reverse(L1,L2):-
	reverse(L1,[],L2).

reverse([],Acc,Acc).
reverse([H|T],Acc,L2):-
	reverse(T,[H|Acc],L2).
	
	
prefix(L,P):-
	append(P,_,L).

postfix(L,P):-
	append(_,P,L).

%%%%%%%%  infix
	
infix(L,I):-
	append(_,I,R),
	append(R,_,L).





%%%%%%%%%%%
	
infix2([],[]).
infix2(L,I):-
	prefix(L,I).
infix2([_H|T], I):-
	infix2(T,I).






%%%%%%%%%%%%%%% 	

infix3(_L,[]).
infix3(L,I):-
	infix3_(L,I).

infix3_(L,I):-
	infix3__(L,I).
infix3_([_|T1],I):-
	infix3_(T1,I).

infix3__([H|_],[H]).
infix3__([H|T1],[H|T2]):-
	infix3__(T1,T2).
	
	
	
	
%%% zensur



zensur([a,b]).
zensur([a,b|T]):-
	zensur(T).
	
	
ist([_A|_T]).








s(S):- 
	np(NP,np), 
	vp(VP,vp), 
	append(NP,VP,S_1),
	pp(PP),
	append(S_1,PP,S).

vp(VP,vp):- 
	v(V), 
	np(NP,vp), 
	append(V,NP,VP).
	
	
np(NP,X):- 
	det(Det), 
	n(N,X), 
	append(Det,N,NP).
	
np(NP,X):- pn(NP,X). 

pn([maria],np).
det([den]).
n([mann],vp). 
v([sieht]).

pp([]).
pp(PP):-
	q(X,womit),
	d(Y),
	append(X,Y,R),
	w(Z,womit),
	append(R,Z,Q),
	pp(P),
	append(Q,P,PP).

pp(PP):-
	q(X,wo),
	w(Y,wo),
	append(X,Y,R),
	pp(P),
	append(R,P,PP).

	
	
	
	
q([mit], womit).
q([im], wo).
d([dem]).

w([garten],wo).
w([teleskop],womit).
	


	


	
