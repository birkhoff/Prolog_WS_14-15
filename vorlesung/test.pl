s(i,[a]) -->  [a].
s(i(I),[a|A]) -->  [a], s(I,A).

test(N):-
	s(N,S,_,[]),
	tell('valerie.txt'),
	print(S),
	told.