
member_all(X,L):-
	flatten(L,L2),
	member(X,L2).
	
	
l2dl(L,(DL,E)):-
	append(L,E,DL).


%	[1,2,3] => ([1,2,3|Ende],Ende)


%5

element(X, [X|_T]).
element(X,[H|_T]):-
	set_identity(X,H).

element(X,[H|T]):-
	X\=H,
	element(X,T).
	
% 6
% [1,2,3] subset von [1,2,3]

subset([],_X).
subset([H|T],X):-
	element(H,X),
	subset(T,X).
	
set_identity(X,Y):-
	subset(X,Y),
	subset(Y,X).
	




