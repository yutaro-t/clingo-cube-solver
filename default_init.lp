

% default init
init(edge_loc(E, E)) :- edge(E), not not init(edge_loc(E, E)).
init(edge_perm(E, 0)) :- edge(E), not not init(edge_perm(E, 0)).
init(corner_loc(C, C)) :- corner(C),  not not init(corner_loc(C, C)).
init(corner_perm(C, 0)) :- corner(C), not not init(corner_perm(C, 0)).
:- #count{E: init(edge_loc(E, E1))} != 1, edge(E1).
:- #count{E: init(edge_loc(E1, E))} != 1, edge(E1).
:- #count{N: init(edge_perm(E, N))} != 1, edge(E).
:- #count{C: init(corner_loc(C, C1))} != 1, corner(C1).
:- #count{C: init(corner_loc(C1, C))} != 1, corner(C1).
:- #count{N: init(corner_perm(C, N))} != 1, corner(C).
