unif(S,[H,T]):-
	S =.. [H|T].

enthaelt(X,[X|_T]).

enthaelt(X, [_H|T]):-
	enthaelt(X, T).
	

% erstes Element einer Liste löschen:

delete_first([_H|T], T):- !.		%% ! CUT  eliminates further choicepoints

% 	Ausgabe:
%
%	?- delete_first([a,b,c,d,e], L).
%	L = [b, c, d, e].


% letztes Element einer Liste löschen:

delete_last([H|[_E]], [H]):- !.

delete_last([H|T1], [H|T2]):-
	delete_last(T1, T2).

	
% 	Ausgabe:
%
%	?- delete_last([a,b,c,d,e], L).
%	L = [a, b, c, d].


% n-tes Element löschen:

delete_n(N, [_H|T], T):-
	N =< 1,
	!.

delete_n(N, [H|T1], [H|T2]):-
	N2 is N-1,
	delete_n(N2, T1, T2).

% 	Ausgabe:
%
%	?- delete_n( 3, [a,b,c,d,e], L).
%	L = [a, b, d, e].

%	?- delete_n( 4, [a,b,c,d,e], L).
%	L = [a, b, c, e].




















%2

card3min([_,_,_|_T]).

%3

eins_mit_drei([X,_,X|_T]).

%4

eins_mit_drei_und_zwei_mit_zwei([X,Y,_|_T1], [_,Y,X | _T2]).

% 5

list([]).

list([_H|T]):-
	list(T).
	
% 6

ein_gleiches_element([], _L2):- false.
	
ein_gleiches_element([H|_T], L2):-
	member(H, L2), !.

ein_gleiches_element( [_H|T], L2 ):-
	ein_gleiches_element( T, L2).

%% Alternativ:

e_g_2(L1,L2):-
	member(X,L1),
	member(X,L2).


% 7
	
delete(H1,[H1|T1],T1).
	
delete(X,[H1|T1],[H1|T2]):-
	delete(X, T1, T2).