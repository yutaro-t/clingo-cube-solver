

% default goal
goal(loc(E, E)) :- piece(_, E), not not goal(loc(E, E)).
goal(perm(E, 0)) :- piece(_, E), not not goal(perm(E, 0)).
:- #count{E: goal(loc(E, E1))} != 1, piece(_, E1).
:- #count{E: goal(loc(E1, E))} != 1, piece(_, E1).
:- #count{N: goal(perm(E, N))} != 1, piece(_, E).
