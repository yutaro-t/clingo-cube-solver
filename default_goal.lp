

% default goal
goal(loc(E, E)) :- piece(E), not not goal(loc(E, E)).
goal(edge_perm(E, 0)) :- edge(E), not not goal(edge_perm(E, 0)).
goal(corner_perm(C, 0)) :- corner(C), not not goal(corner_perm(C, 0)).
:- #count{E: goal(loc(E, E1))} != 1, piece(E1).
:- #count{E: goal(loc(E1, E))} != 1, piece(E1).
:- #count{N: goal(edge_perm(E, N))} != 1, edge(E).
:- #count{N: goal(corner_perm(C, N))} != 1, corner(C).
