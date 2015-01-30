plus(A,B,R):-
	R is A + B.
	
fak(0,1).
fak(X,R):-
	X_MINUS is X -1,
	fak(X_MINUS,X_TEMP),
	R is X * X_TEMP.


eltern(eva,annika).
eltern(hannelore,eva).
eltern(hannelore,corinna).
eltern(eva,peter).

weiblich(eva).
weiblich(hannelore).
weiblich(corinna).
weiblich(annika).
maennlich(peter).
	
	
tante(Tante,Y):-
	eltern(Mutter,Y),
	eltern(Grossvater,Mutter),
	eltern(Grossvater,Tante),
	weiblich(Tante),
	Mutter \= Tante.
	
	
	
	
	
rev(L,RL):-
	rev(L,[],RL).
	
rev([],Acc,Acc).
rev([H|T],Acc,RL):-
	rev(T,[H|Acc],RL).
	
tail([H|T],T).



del(_X,[],[]).
del(X,[X|T],T).
del(X,[H|T1],[H|T2]):-
	H\=X,
	del(X,T1,T2).
	
	
	
%% optimieren sie das Programm mit dem Cut Operator

ist_eine_liste(X,1):-
	is_list(X).
	
ist_eine_liste(X,-1):-
	\+ is_list(X).


% Loesung:


ist_eine_liste(X,1):-
	is_list(X), !.
	
ist_eine_liste(X,-1).


% Univ
% =..
% P =.. [append, [1,2,3],[4,5],R].
% P = append([1, 2, 3], [4, 5], R).
% Prädikat =.. Liste

% Schreiben sie ein Prädikat, welches eine Liste in ein Prädikat umwandelt und
% dann per call aufruft

call_list(L):-
	P =.. L,
	call(P).



/*

?- call_list([append, [1,2,3],[4,5],R]).
R = [1, 2, 3, 4, 5].


*/
	

	
	
	
	
	
	
	
	
	