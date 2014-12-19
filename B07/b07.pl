%% simple DCG:

predicateS1(S):-
	ss1(S,[]).

ss1 -->  [];
		[a], ss1.
		
%% simple parameterized DCG

simple(S):-
	ss2( S, []).


ss2 --> a2(Liste_Mit_Bs), Liste_Mit_Bs.
a2(CountA) -->	[a], {CountA = [b]};
				[a], {CountA = [b|C2]}, a2(C2).


%% erweitertes Beispiel fuer parametrisierte DCG

s5 --> v5(X), verb, v5(Y), {X\=Y}.

nom(_)	--> 	[mann].
nom(nom)	--> 	[maria].
v5(X) 		--> 	art(X), nom(X).
verb 		--> 	[gruesst].

art(acc) 	--> 	[den].
art(nom) 	--> 	[die].





%%%%%%%%%%%%%%










%%%% 1


s1	-->	a,b.
a	-->	[];
		a,[a].
b 	-->	[];
		b,[b].
		
%%%% 2
		
s2	-->	[];
		[a],s2,[b].
		

%%%% 3

% aufrufen mit in der Konsole mit  ?-   s(L,[])

s	-->	np(nom), vp,ppp. 
vp 	--> v, np(acc).
np(acc)	-->	det, n.

np(nom)	-->	[maria]. 
det --> [den].
n	--> [mann].
v 	-->	[sieht].

ppp --> 	[];
	  	pp2, ppp.
pp2 -->	[im], ort;
		[mit],object.
		
ort	--> [garten].
object-->[dem,teleskop].

%%% 4


s4		-->		a(N), b(N), c(N).
a(0)	-->	 	[].
a(N)	-->		[a], {N=s(N1)}, a(N1).     % s(s(s(0)))
b(0)	--> 	[].
b(N)	-->		[b], {N=s(N1)}, b(N1).
c(0)	-->		[].
c(N)	-->		[c], {N=s(N1)}, c(N1).


% alternativ:

ss4 --> ss4([]).
ss4(ACC) --> ACC;	
			[a], { B = [b|ACC] },ss4(B), [c].


