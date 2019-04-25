
holds_mid_print(edge_loc(E1, E2), T, U) :- holds_mid(edge_loc(E1, E2), T, U), E1 != E2.
holds_mid_print(corner_loc(E1, E2), T, U) :- holds_mid(corner_loc(E1, E2), T, U), E1 != E2.
holds_mid_print(edge_perm(E1, N), T, U) :- holds_mid(edge_perm(E1, N), T, U), N != 0.
holds_mid_print(corner_perm(E1, N), T, U) :- holds_mid(corner_perm(E1, N), T, U), N != 0.
holds_print(edge_loc(E1, E2), T) :- holds(edge_loc(E1, E2), T), E1 != E2.
holds_print(corner_loc(E1, E2), T) :- holds(corner_loc(E1, E2), T), E1 != E2.
holds_print(edge_perm(E1, N), T) :- holds(edge_perm(E1, N), T), N != 0.
holds_print(corner_perm(E1, N), T) :- holds(corner_perm(E1, N), T), N != 0.


#show holds_print/2.
#show holds_mid_print/3.
