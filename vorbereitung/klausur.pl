%%% Schreiben sie Append

%% swi prolog

% append([1],[2], [1,2]) 

% 1) app([2|[]],[1,2,3],[2|R])
% 2) app([], [1,2,3],R) => R = [1,2,3]
% 3) zurück app([2|[]],[1,2,3],[2|[1,2,3]])

app([],X,X).
app([H|T],X,[H|R]):-
	app(T,X,R).

	
	
%% Tante nachprogrammieren

eltern(eva,annika).
eltern(hannelore,eva).
eltern(hannelore,corinna).
eltern(eva,peter).

weiblich(eva).
weiblich(hannelore).
weiblich(corinna).
weiblich(annika).
maennlich(peter).

% mutter(X, annika) ?

mutter(X,Y):-
	eltern(X,Y),
	weiblich(X).


% schwester(X,Y)

schwester(X,Y):-
	weiblich(X),
	eltern(Z,Y),
	eltern(Z,X),
	X \= Y.

% tante(X,annika)

tante(X,Y):-
	schwester(X,Z),
	mutter(Z,Y).


% reverse([1,2,3], [3,2,1])

rev(X,Y):-
	rev(X,[],Y).

rev([], Acc,Acc).
rev([H|T],Acc,Y):-
	rev(T, [H|Acc],Y).
	
	
% Rest einer Liste?

rest([_H|T],T).


% del(X,Y,Z)     del([1,2,3], 2, [1,3])

del(X,Y,Z):-
	del(X,Y,[],Z).

del([],_Y,Acc,Acc).

del([Y|T],Y,Acc,Z):-
	del(T,Y,Acc,Z).

del([X|T],Y,Acc,Z):-
	X \= Y,
	del(T,Y,[X|Acc],Z).
	
del2([X|R],X,R).
del2([X|T],Z,[X|R]):-
	del2(T,Z,R).
	



	




















