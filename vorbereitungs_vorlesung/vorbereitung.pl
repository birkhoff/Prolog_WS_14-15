
% was machen die folgenden Praedikate?

a(X,Y,Z):-
	Z is X + Y.
	
b([X, _ |[]],X).
b([_H|T],R):-
	b(T,R).
	
	
c(X,Y,X):- 
	X < Y.
c(X,Y,Y):- 
	X >=Y.






















% tausche erstes und letztes Element einer Liste





swapp([Erste|T],[Letzte|R]):-
	reverse(T,[Letzte|RT]),
	reverse([Erste|RT],R).












swapi([Erstes|Tail],[Letztes|R]):-
	reverse(Tail,[Letztes|T_Reversed]),
	L1 = [Erstes|T_Reversed],
	reverse(L1,R).
	

% Jay Z : Wahr wenn Liste von Problemen 
% enthaelt von 99 Elementen aber biatch darf nicht Element sein

jayz(L):-
	length(L,X),
	X = 3,
	\+ member(biatch,L).











jay_z(L):-
	length(L,99),
	\+ member(biatch, L).
	




% Definite Clause Grammars

% Schreiben sie eine REGULAERE Grammatik 
% fuer die Sprache trol ol^n ya

%% ss([tol,ol,ya],[])


ss --> 	[trol], sa.
sa --> 	[ol], sc;
 		[ol], sa.
sc --> 	[ya].

















%%% optimieren sie das folgende Programm mit dem Cut Operator
%%% sparen sie so viele Zeilen wie moeglich ein



f(L,Z):-
	is_list(L),
	length(L,X),
	X =< 0,
	Z = zero.

f(L,Z):-
	is_list(L),
	length(L,X),
	X > 0,
	Z = not_zero.

	
%% optimiert
	
f2(L,Z):-
	is_list(L),
	length(L,X),
	X =< 0, !,
	Z = zero.

f2(L,Z):-
	is_list(L),
	Z = not_zero.
	
	
	
	
	
	
	
	
	
	










%%% append dl









% ([a,b,c|T],T) 
% ([d,e|T2],T2)
% T = [d,e|T2]
% ([a,b,c,d,e|T2], T3)

append_d_l((A,B),(B,C),(A,C)).
	





















%%% Unif und call
%%% Schreiben sie ein Praedikat welches eine List in ein 
%%% Praedikat umwandelt und dieses aufruft


call_list(L):-
	P=..L,
	call(P).


%%


% foo(a,b)=..[FUNC|Args], NewArgs=[c|Args], P=..[FUNC|NewArgs].

% ein Praedikat welches ein X immer vor alle anderen Argumente setzt
% und aufruft: Bsp f_a([member,[1,2,3]]) called member(X,[1,2,3])

f_a([Func|Args],X):-
	NewArgs = [X|Args],
	NewP =..[Func|NewArgs],
	call(NewP).

	
% p(a,b):-
%	p(a,0,b).

% p(a,b):-
%    p(a,[],b).

% aufsummieren der Werte einer Liste 	


% [1,2,3,4] 1+2+3+4

sum_up(L,X):-
	sum_up(L,0,X).

sum_up([],Acc,Acc).
sum_up([H|T],Acc,R):-
	NewAcc is Acc + H,
	sum_up(T,NewAcc,R).
	
	
% sum_down([1,2,3],R) R = 99 - 1 -2 -3
% von 99 runterzaehlen

sum_down(L,X):-
	sum_down(L,99,X).

sum_down([],Acc,Acc).
	
sum_down([H|T],Acc,X):-
	NewAcc is Acc - H,
	sum_down(T,NewAcc,X).



















