

% default init
init(loc(E, E)) :- piece(E), not not init(loc(E, E)).
init(edge_perm(E, 0)) :- edge(E), not not init(edge_perm(E, 0)).
init(corner_perm(C, 0)) :- corner(C), not not init(corner_perm(C, 0)).
:- #count{E: init(loc(E, E1))} != 1, piece(E1).
:- #count{E: init(loc(E1, E))} != 1, piece(E1).
:- #count{N: init(edge_perm(E, N))} != 1, edge(E).
:- #count{N: init(corner_perm(C, N))} != 1, corner(C).
