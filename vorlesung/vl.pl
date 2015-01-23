a([],[]).
a([X|[]],X):-!.
a([_X|T],Y):-
	a(T,Y).

b([],[]).	
b([X|_],X).




schauspieler(schwarzenegger).
schauspieler(sinatra).
schauspieler(norris).
schauspieler(beyonce).

singer(sinatra).
singer(beyonce).

bodybuilder(schwarzenegger).


multitalent(X):-
	schauspieler(X),
	(
		singer(X);
		bodybuilder(X)
	).
	
member([X|_T],X).

member([_H|T],X):-
	member(T,X).
	
max_verschenkt_muesli(M):-
	member(M,rosinen).
	


rev(L,R):-
	rev(L,[],R).
	
rev([],Acc,Acc).
rev([E|T],Acc,R):-
	rev(T,[E|Acc],R).

s --> [batman].
s --> [na], s.



appdl((A,B),(B,C),(A,C)).
	
list_to_diff(L,(DL,T)):-
	append(L,T,DL).









