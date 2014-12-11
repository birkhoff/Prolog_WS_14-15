% u8.pl
% Prolog Grundkurs, Parametrisierte DCGs
% Christof Rumpf, 09.12.2010






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%           1   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% a^n b^m c^n d^m

ss       -->     sa(N), sb(M), sc(N), sd(M).

sa(0)    -->     [].
sa(i(I)) -->     [a], sa(I).

sb(0)    -->     [].
sb(i(I)) -->     [b], sb(I).

sc(0)    -->     [].
sc(i(I)) -->     [c], sc(I).

sd(0)    -->     [].
sd(i(I)) -->     [d], sd(I).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





% kontextfreie Sprache a^n b^n

s1 --> [].
s1 --> [a], s1, [b].

% reguläre Sprache a^* b^*

s2 --> [].
s2 --> [a], s2.
s2 --> [b], b.
b --> [].
b --> [b], b.

% kontextsentive Sprache a^n b^n c^n

s3 --> a(I), b(I), c(I).
a(i) --> [].
a(i(I)) --> [a], a(I).
b(i) --> [].
b(i(I)) --> [b], b(I).
c(i) --> [].
c(i(I)) --> [c], c(I).

% DCG mit Baum als Struktur

s1(s(NP,VP)) --> np1(NP,Num), vp1(VP,Num).
vp1(vp(V,NP),Num) --> v1(V,Num), np1(NP,_).
v1(v(klaut), sg) --> [klaut].
v1(v(klauen), pl) --> [klauen].
np1(np(paul), sg) --> [paul].
np1(np(bananen),pl) --> [bananen].

% DCG mit Baum als Liste
s2([s,NP,VP]) --> np2(NP,Num), vp2(VP,Num).
vp2([vp,V,NP],Num) --> v2(V,Num), np2(NP,_).
v2([v,[klaut]], sg) --> [klaut].
v2([v,[klauen]], pl) --> [klauen].
np2([np,[paul]], sg) --> [paul].
np2([np,[bananen]],pl) --> [bananen].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% test/1, parse/1, generate/1, genlist/2, generateall/1, generateall/2, print_phrase/1, file_output/2.
% test(1) test(2)
% parse1([paul,klaut,bananen]).
% generate(6).
% genlist(6,L).
% generateall(6).  oder  generateall(7).
% generateall(4,7).
% print_phrase([du, hast, sächsischen, dialekt, der, boss, nicht, er, hat,sechs,ischen]).
% file_output('ausgabe.txt',generateall(4,7)).


% Parsen mit Baum als Struktur

parse1(Sentence):-
	s1(Tree,Sentence,[]),
	pp1(Tree).

% Parsen mit Baum als Liste

parse2(Sentence):-
	s2(Tree,Sentence,[]),
	pp2(Tree).

% Pretty-Printer für Struktur-Bäume

pp1(T):- pp1(T,0).

pp1(Tree,N):-
	Tree =.. [H|T],
	tab(N), write(H), nl,
	N1 is N+3,
	ppl1(T,N1).

ppl1([],_).
ppl1([H|T],N):-
	pp1(H,N),
	ppl1(T,N).
	
% Pretty-Printer für Listen-Bäume

pp2(T):- pp2(T,0).

pp2([H|T],N):-
	tab(N), write(H), nl,
	N1 is N+3,
	ppl2(T,N1).

ppl2([],_).
ppl2([H|T],N):-
	pp2(H,N),
	ppl2(T,N).
	
% Parsen von Beispielsätzen

test1(N):-
	ex1(N,S), write(S), nl,
	s(S,[]).
	
ex1(1,[maria,sieht,den,mann]).
ex1(2,[maria,sieht,dem,mann]).

% Parsen mit Meta-Variablen (variablen Goals)

test2(N):- ex2(N,G), write(G), nl, call(G).

ex2(1,s([maria,sieht,den,mann],[])).
ex2(2,pp([im,park],[])).

% Generierung von Templates für Listen definiter Länge

genlist(0,[]).
genlist(N,[_|T]):- 
	N > 0, M is N-1, genlist(M,T).

% Generierung von Sätzen definiter Länge

generate(N):- genlist(N,S), parse(S).

% Generierung mit Fail-Loop

generateall(N):-
	genlist(N,S), s(S,[]), write(S), nl,
	fail.
generateall(_).

% Generierung mit Längen-Intervall

generateall(Max,Max):- generateall(Max).
generateall(N,Max):-
	N < Max, M is N+1,
	generateall(N),
	generateall(M,Max).

% Drucken von Phrasen

print_phrase([]):- nl.
print_phrase([Word|Words]):-
	tab(1),write(Word),
	print_phrase(Words).
	
% Parsen mit Phrasendrucker
parse(S):- s(S,[]), print_phrase(S).

% Datei-Output für ein Goal	
file_output(File,Goal):-
	tell(File),
	(call(Goal) ; true),
	told.

% Grammatik mit PP-Attachment und
% Kasus-Konguenz bzw. -Zuweisung
/*
s --> np(nom), vp.
vp --> v(Cas), np(Cas), pps.
np(Cas) --> det(Cas), n(Cas), pps.
np(Cas) --> pn(Cas), pps.
pp --> p(Cas), np(Cas).
pp --> [im], n(dat), pps.
pps --> [].
pps --> pp, pps.
pn(nom) --> [maria].
det(acc) --> [den].
det(dat) --> [dem].
n(acc) --> [mann].
n(dat) --> [park].
n(dat) --> [teleskop].
v(acc) --> [sieht].
p(dat) --> [mit].
*/


s(s(NP,VP)) --> np(NP,nom), vp(VP).
vp(vp(V,NP,PPS)) --> v(V,Cas), np(NP,Cas), pps(PPS).
np(np(DET,N,PPS), Cas) --> det(DET,Cas), n(N,Cas), pps(PPS).
np(np(PN,PPS),Cas) --> pn(PN,Cas), pps(PPS).
pp(pp(P,NP)) --> p(P,Cas), np(NP,Cas).
pp(pp(im,N,PPS)) --> [im], n(N,dat), pps(PPS).
pps("") --> [].
pps(pps(PP,PPS)) --> pp(PP), pps(PPS).
pn(maria,nom) --> [maria].
det(den,acc) --> [den].
det(dem,dat) --> [dem].
n(mann,acc) --> [mann].
n(park,dat) --> [park].
n(teleskop,dat) --> [teleskop].
v(sieht,acc) --> [sieht].
p(mit,dat) --> [mit].





































