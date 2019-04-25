

% default init
init(loc(E, E)) :- piece(_, E), not not init(loc(E, E)).
init(edge_perm(E, 0)) :- piece(edge, E), not not init(edge_perm(E, 0)).
init(corner_perm(C, 0)) :- piece(corner, C), not not init(corner_perm(C, 0)).
:- #count{E: init(loc(E, E1))} != 1, piece(_, E1).
:- #count{E: init(loc(E1, E))} != 1, piece(_, E1).
:- #count{N: init(edge_perm(E, N))} != 1, piece(edge, E).
:- #count{N: init(corner_perm(C, N))} != 1, piece(corner, C).
