% u6.pl
% Prolog Grundkurs, Verschachtelte Listen
% Christof Rumpf, 18.11.2010

% deleteall(Term,Liste1,Liste2)


delete(_,[],[]).

delete(X,[X|T1],T2).
% fuer delteall:	delete(X,T1,T2).

delete(X,[H|R],[H|T]):-
	X \= H,
	delete(X,R,T).




deleteall(_,[],[]).
deleteall(X,[X|T1],L):-
	deleteall(X,T1,L).
deleteall(X,[H|T1],[H|T2]):-
	X \= H,
	deleteall(X,T1,T2).

% makeset(Liste1,Liste2)

makeset([],[]).
makeset([H|T1],[H|T2]):-
	deleteall(H,T1,L),
	makeset(L,T2).
	
%flatten(VerschachtelteListe, FlacheListe)


flatten([],[]).

% Wer zerlegen das erste Argument in Head und Tail

flatten([H|T],FL):-
	flatten(H,FH),
	flatten(T,FT),
	append(FH,FT,FL).
	
% Bis es sich nicht mehr in einen Head und Tail zerlegen laesst 
% und geben dieses Argument in einer Liste zurueck

flatten(X,[X]):-
	X \= [], X \= [_|_].
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% append bitte verstehen!

append([],L,L).
append([H|T1],L,[H|T2]):- 
	append(T1,L,T2).
	
	

%flatten2(VerschachtelteListe, FlacheListe) mit Stack


% Aufruf an flatten/3 mit dem leeren Stack als zweites Argument.

flatten2(VL,FL):-
	flatten2(VL,[],FL).

% Erstes Argument und Stack wurden 'verflacht'

flatten2([],[],[]).

% Erstes Argument 'verflacht' Stack jedoch noch nicht. 
% Wir nehmen das erste Argument des Stacks und 'verflachen' es ebenfalls

flatten2([],[H|Acc],FL):-
	flatten2(H,Acc,FL).

% Erstes Argument noch nicht verflacht:
% Der Head des ersten Argumentes ist eine Liste, also legen
% wir den Tail auf unserem Stack und 'verflachen' den Head

flatten2([H|T],Acc,FL):-
	is_list(H),
	flatten2(H,[T|Acc],FL).
	
	
% Erstes Argument noch nicht verflacht:
% Der Head des ersten Argumentes ist keine Liste
% Also muss dieser nicht weiter 'verflacht' werden sondern
% kann direkt vorne in unsere Rueckgabeliste eingefuegt werden

% Nun 'verflachen' wir den Tail des ersten Arguments und geben dies
% als Tail des dritten Argumentes als Rueckgabewert zurueck

flatten2([H|T1],Acc,[H|T2]):-
	\+ is_list(H),
	flatten2(T1,Acc,T2).
	
is_list([]).
is_list([_|_]).

%pprint(BaumAlsStruktur)
% s(np(det(jeder),n(mann)),vp(v(liebt),np(det(eine),n(frau))))

pprint(Term):- pprint(Term,0).
pprint(Term,N):-
	Term =.. [F|Args],
	tab(N), write(F), nl,
	N1 is N+3,
	pprintl(Args,N1).
	
pprintl([H|T],N):-
	pprint(H,N),
	pprintl(T,N).
pprintl([],_).

%append_dl(DL1, DL2, DL3)

append_dl((A,B),(B,C),(A,C)).




%% 1

member2(X,L):-
	flatten(L,FL),
	member(X,FL).
	




%% pprint


%%% 2
	
	
% [s, [np, [det, [jeder]], [n, [mann]]],    [vp, [v, [liebt]],[np, [det, [eine]], [n, [frau]]]]]

pprint2(Term):- pprint2(Term,0).
pprint2([F|Args],N):-
	%Term =.. [F|Args],
	tab(N), write(F), nl,
	N1 is N+3,
	pprintl2(Args,N1).
pprintl2([H|T],N):-
	pprint2(H,N),
	pprintl2(T,N).
pprintl2([],_).



%% 3

stree2ltree(Term, [F|T2]):-
	Term =.. [F|Args],
	s2l(Args,T2).
	
s2l([],[]).
s2l([Term|T], [L|T2]):-
	stree2ltree(Term,L),
	s2l(T,T2).
	
	
%%% 4

l2dl(L,(DL,X)):-
	append(L,X,DL).


%% 5

element(E,[E|_T]).
element(E1,[E2|_T]):-
	set_identity(E1,E2).
element(E1,[_E2|T]):-
	element(E1,T).
	
	
%% 6

subset([], _SET).

subset([H|T], SET):-
	element(H,SET),
	subset(T,SET).
	
%% 7

set_identity(A, B):-
	subset(A,B),
	subset(B,A).













