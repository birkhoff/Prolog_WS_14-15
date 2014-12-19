my_last([H|[]],H).
my_last([_|T],H):-
	my_last(T,H).
	
my_second_last([H,_|[]],H).
my_second_last([_|T],H):-
	my_second_last(T,H).
	
element_at(H,[H|_T],0).
element_at(X,[_H|T],K):-
	NewK is K-1,
	element_at(X,T,NewK).
	
%% Anzahl Elemente mit Akkumulator

elements(L,R):-
	elements(L,0,R).

elements([],K,K).
elements([_H|T],K,R):-
	NewK is K + 1,
	elements(T,NewK,R).
	
%% Ohne Akkumulator.

elements2([],0).
elements2([_H|T],R):-
	elements2(T,R2),
	R is R2 + 1.
	

%%%%

% ?- elements2([1|[2]],K)
% [1,2,3]
% K1 is K2+1, K2 is K3+1, K3 = 0. 			

%%%


%% Reverse ohne Akkumulator


rev([],[]).
rev([H|T],R):-
	rev(T,TRev),
	append(TRev,[H],R).

/*	
-? 
	rev([1,2],R):-
		rev([1|2],R):-
			rev([2],TRev1),    ----> 2)
			append(TRev1,[1]).
			
			= [2,1]

2)			rev([2|[]],TRev1):-
				rev([],[]),
				append([],[2],TRev1).

*/




%% Reverse mit Akkumulator

rev2(L,R):-
	rev(L,[],R).
	
rev([],Acc,Acc).
rev([H|T],Acc,R):-
	rev(T,[H|Acc],R).
	
	
palindrom(L):-
	rev2(L,L).

%% ausgeschrieben

palindrom2(L):-
	rev2(L,L_REVERSED),
	L = L_REVERSED.
	

compress([],[]).
compress([H,H|T1],[H|T2]):-
	!,							%% Cut ignoriert andere Mögliche Lösungen ab diesem Punkt
	compress([H|T1],[H|T2]).
compress([H|T1],[H|T2]):-
	compress(T1,T2).
	
	
	
pack(L,R):-
	rev(R2,R),
	pack(L,[],[],R2).
	
pack([],Acc,AccR,[Acc|AccR]).
	
pack([H|T],[H|Acc],AccR,R):-
	pack(T,[H,H|Acc],AccR,R).
pack([H|T],[X|Acc],AccR,R):-
	H\=X,
	pack([H|T],[],[[X|Acc]|AccR],R).
pack([H|T],[],AccR,R):-
	pack(T,[H],AccR,R).



%% insert at

insert_at(L,E,0,[E|L]).
insert_at([H|T],E,K,[H|RT]):-
	NewK is K -1,
	insert_at(T,E,NewK,RT).


%% , logisches und
%% ; logisches oder
%% . abschluss des Faktes/Predikates










	