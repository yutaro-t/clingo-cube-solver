

% default goal
goal(edge_loc(E, E)) :- edge(E), not not goal(edge_loc(E, E)).
goal(edge_perm(E, 0)) :- edge(E), not not goal(edge_perm(E, 0)).
goal(corner_loc(C, C)) :- corner(C),  not not goal(corner_loc(C, C)).
goal(corner_perm(C, 0)) :- corner(C), not not goal(corner_perm(C, 0)).
:- #count{E: goal(edge_loc(E, E1))} != 1, edge(E1).
:- #count{E: goal(edge_loc(E1, E))} != 1, edge(E1).
:- #count{N: goal(edge_perm(E, N))} != 1, edge(E).
:- #count{C: goal(corner_loc(C, C1))} != 1, corner(C1).
:- #count{C: goal(corner_loc(C1, C))} != 1, corner(C1).
:- #count{N: goal(corner_perm(C, N))} != 1, corner(C).
