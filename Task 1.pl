% ============================================================
%  ARTI 303 - Lab 5  |  Rules in Prolog
% ============================================================

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, homer).
parent(abraham, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% =====================
%  The Rules 
% =====================

% Father and mother
father(F, X) :- parent(F, X), male(F).
mother(M, X) :- parent(M, X), female(M).

% Son and daughter
son(X, P) :- parent(P, X), male(X).
daughter(X, P) :- parent(P, X), female(X).

% Siblings
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
sister(X, Y) :- sibling(X, Y), female(X).
brother(X, Y) :- sibling(X, Y), male(X).

% Grandfather and grandmother
grandfather(G, X) :- parent(G, P), parent(P, X), male(G).
grandmother(G, X) :- parent(G, P), parent(P, X), female(G).

% Aunt and uncle
aunt(A, X) :- parent(P, X), sister(A, P).
uncle(U, X) :- parent(P, X), brother(U, P).

% Cousin
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% Ancestor
ancestor(A, X) :- parent(A, X).
ancestor(A, X) :- parent(A, P), ancestor(P, X).

% =====================
%  The Queries 
% =====================
% Father and mother
% =====================
% 1 ?- father(F, homer).
% F = abraham .

% 2 ?- father(F, patty).
% F = clancy .

% 3 ?- mother(M, homer).
% M = mona.

% 4 ?- mother(M, marge).
% M = jackie.

% =====================
% Son and daughter
% =====================
% 5 ?- son(herb, P).
% P = abraham.

% 6 ?- son(bart, P).
% P = homer ;
% P = marge.

% 7 ?- daughter(marge, P).
% P = clancy ;
% P = jackie.

% 8 ?- daughter(ling, P).
% P = selma.

% =====================
% Brother and sister
% =====================
% 9 ?- brother(homer, herb).
% true .

% 10 ?- brother(bart, lisa).
% true .

% 11 ?- sister(marge, patty).
% true.

% 12 ?- sister(lisa, bart).
% true .

% =====================
% Grandfather
% =====================
% 13 ?- grandfather(abraham, bart).
% true .

% 14 ?- grandfather(abraham, lisa).
% true .

% =====================
% Aunt and uncle
% =====================
% 15 ?- aunt(A, bart).
% A = patty ;
% A = selma .

% 16 ?- aunt(A, ling).
% A = marge ;
% A = patty .

% 17 ?- uncle(U, bart).
% U = herb .

% 18 ?- uncle(herb, lisa).
% true .

% =====================
% Cousin and ancestor
% =====================
% 19 ?- cousin(ling, bart).
% true .

% 20 ?- cousin(maggie, lisa).
% false.

% 21 ?- ancestor(abraham, maggie).
% true .

% 22 ?- ancestor(jackie, ling).
% true .

% =====================