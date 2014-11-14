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
	

prefix([],_L).
prefix([H|T],[H|T2]):-
	prefix(T,T2).

	
postfix(X,L):-
	reverse(L,L2),
	prefix(X,L2).





%%%% Loesung von Herrn Rumpf

infix(L1,L2):- 
	prefix(L3,L2), 
	postfix(L1,L3).



%%%%%%%%%%% Alternative Loesung
	
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



%%% 5

% a



s(S):- 
	np(NP,np), 
	vp(VP,vp), 
	append(NP,VP,S).

vp(VP,vp):- 
	v(V), 
	np(NP,vp), 
	append(V,NP,VP).
	
	
np(NP,vp):- 
	det(Det), 
	n(N,vp), 
	append(Det,N,NP).	


np(NP,X):- pn(NP,X). 

pn([maria],np).
det([den]).
n([mann],vp). 
v([sieht]).



/*
%  b)


s(S):- 
	np(NP,np), 
	vp(VP,vp), 
	append(NP,VP,S).

vp(VP,vp):- 
	v(V), 
	np(NP,vp), 
	append(V,NP,VP1),
	pp(PP),
	append(VP1,PP,VP).		%% PP's an vp haengen
	
	
np(NP,vp):- 
	det(Det), 
	n(N,vp), 
	append(Det,N,NP1),
	pp(PP),
	append(NP1,PP,NP).			%% PP's an np haengen


np(NP,X):- pn(NP,X). 

pn([maria],np).
det([den]).
n([mann],vp). 
v([sieht]).


pp(PP):-
	pp1(PP).

pp(PP):-
	pp(PP1),
	pp1(PP2),
	append(PP1,PP2,PP).


pp1([]).

pp1(PP):-
	q(X,wo),
	w(Y,wo),
	append(X,Y,PP).


pp1(PP):-
	q(X,womit),
	d(Y),
	append(X,Y,R),
	w(Z,womit),
	append(R,Z,PP).
	


	
q([mit], womit).
q([im], wo).
d([dem]).

w([park],wo).
w([teleskop],womit).

*/
	


	