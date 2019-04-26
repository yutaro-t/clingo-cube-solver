

% default init
init(loc(E, E)) :- piece(_, E), not not init(loc(E, E)).
init(perm(E, 0)) :- piece(_, E), not not init(perm(E, 0)).
:- #count{E: init(loc(E, E1))} != 1, piece(_, E1).
:- #count{E: init(loc(E1, E))} != 1, piece(_, E1).
:- #count{N: init(perm(E, N))} != 1, piece(_, E).
