
% Vorlesung 27.11


fakul(N,R):-
	fakul(N,1,R).

fakul(0,Acc,Acc).

fakul(N,Acc,R):-
	NewAcc is N*Acc,
	NewN is N-1,
	fakul(NewN,NewAcc,R).


















































faku(N,R):-
	faku(N,1,R).

faku(0,Acc,Acc).

faku(N,Acc,R):-
	New_Acc is Acc * N,
	New_N is N-1,
	faku(New_N,New_Acc,R).