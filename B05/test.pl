del(X,[X|T],T).
del(X,[Y|T],[Y|R]):-
	del(X,T,R).
	

%3,[1,2,3,4,5], Gibt es noch nicht
%3,[1|[2,3,4,5]],  [2,3,4,5] 3=1? nicht der Fall!
%3,[1|[2,3,4,5]],  [1|R] 
%	also rufen wir del(3,[2,3,4,5],R)
%del(3,[2|[3,4,5]],R) (R Gibt es noch nicht)
%del(3,[2|[3,4,5]],[2|R2])
%	also rufen wir del(3,[3,4,5],R2)

%del(3,[3|[4,5]],[4,5]) (R2 ist [4,5])


app([],L2,L2).
app([H|T],L2,[H|R]):-
	app(T,L2,R).
	
	
	
	
	
rvs(L,R):-
	rvs2(L,[],R).

rvs2([],FertigerAcc,FertigerAcc).
rvs2([H|T],Acc,R):-
	rvs2(T,[H|Acc],R).


%% Foo kehrt L1 und L2 um und konkataniert sie

foo(L1,L2,R):-
	foo_2(L1,L2,[],[],R).

foo_2([],[],Acc1,Acc2,R):-
	app(Acc1,Acc2,R).
%% Fall: L1 und L2 werden abgearbeitet

foo_2([H1|T1],[H2|T2],Acc1,Acc2,R):-
	foo_2(T1,T2,[H1|Acc1],[H2|Acc2],R).
%% Fall: L1 bereits abgearbeitet

foo_2([],[H2|T2],Acc1,Acc2,R):-
	foo_2([],T2,Acc1,[H2|Acc2],R).
%% Fall: L2 bereits abgearbeitet

foo_2([H1|T1],[],Acc1,Acc2,R):-
	foo_2(T1,[],[H1|Acc1],Acc2,R).
	

%%% [1,2,3,4]  Acc der ist herade leer []
%%% Schritt1
%%% [1|[2,3,4]] [1|[]]
%%% Schritt2
%%% [2|[3,4]] [2|[1]]
%%% Schritt3
%%% [3|[4]] [3|[2|[1]]]
%%% Schritt4
%%% [4|[]] [4|[3|[2|[1]]]]	
%%% []   [4,3,2,1]





