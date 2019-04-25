

% default goal
goal(loc(E, E)) :- piece(_, E), not not goal(loc(E, E)).
goal(edge_perm(E, 0)) :- piece(edge, E), not not goal(edge_perm(E, 0)).
goal(corner_perm(C, 0)) :- piece(corner, C), not not goal(corner_perm(C, 0)).
:- #count{E: goal(loc(E, E1))} != 1, piece(_, E1).
:- #count{E: goal(loc(E1, E))} != 1, piece(_, E1).
:- #count{N: goal(edge_perm(E, N))} != 1, piece(edge, E).
:- #count{N: goal(corner_perm(C, N))} != 1, piece(corner, C).
