sabrina([H|_T],H).	


anna([X,_|[]],X).
anna([_H|T],X):-
	anna(T,X).
	
	
s1 --> [bjoern], s2.
s2 --> [wird], s3.
s3 --> [sehr], s4.
s3 --> [sehr], s3.
s4 --> [verpruegelt].


to_dl(L,(DL,Ende)):-
	append(L,Ende,DL).
	         
% (Liste,EndeDerListe) => ([1,2|Ende],Ende)

from_dl((L,[]),L).   % [1,2,3|X] => [1,2,3] = [1,2,3|[]]

%  

dl_append((L1,E1),(L2,E2),(R,NeuEnde)):-
	E1=L2,
	R = L1,
	NeuEnde = E2.
	

length1([],0).
length1([_H|T],N):-
	length1(T,N1),
	N is N1+1.

jay_z(L):-
	length(L,4),
	\+ member(bitch,L).
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	