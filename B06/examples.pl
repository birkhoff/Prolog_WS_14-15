
is_list([])

is_list([H|T]):-
	is_list(T).


