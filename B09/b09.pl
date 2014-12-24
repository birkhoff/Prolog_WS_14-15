% u9.pl
% Prolog Grundkurs, Maschinelle Übersetzung I
% Christof Rumpf, 16.12.2010

s(L,P) --> np(L,X,Q,P), vp(L,X,Q).
vp(L,X,P) --> tv(L,X,Y,Q), np(L,Y,Q,P).
np(L,X,Q,P)--> det(L,X,R,Q,P), n(L,X,R).

tv(e,X,Y,loves(X,Y)) --> [loves].
det(e,X,R,Q,all(X,(R->Q))) --> [every].
det(e,X,R,Q,exists(X,Q+R))--> [a].
n(e,X,man(X)) --> [man].
n(e,X,woman(X)) --> [woman].


%% 1

% Jeder Mann liebt eine Frau.
% ∀x man(x) → ∃y (woman(y) ∧ loves(x,y))
% all(X,man(X) -> exists(Y,woman(Y) + loves(X,Y)))

%s(d,P) --> np(d,X,Q,P), vp(d,X,Q).
%vp(d,X,P) --> tv(d,X,Y,Q), np(d,Y,Q,P).
%np(d,X,Q,P) --> det(d,X,R,Q,P), n(d,X,R).

tv(d,X,Y, loves(X,Y)) --> [liebt].
det(d,X,R,Q,all(X,(R->Q))) --> [jeder].
det(d,X,R,Q,exists(X,Q+R))--> [eine].
n(d,X,man(X)) --> [mann].
n(d,Y,woman(Y)) --> [frau].