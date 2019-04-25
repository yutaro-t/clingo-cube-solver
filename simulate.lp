final(X) :- holds(X, h).

final_print(edge_loc(E1, E2)) :- final(edge_loc(E1, E2)), E1 != E2.
final_print(edge_perm(E1, N)) :- final(edge_perm(E1, N)), N != 0.
final_print(corner_loc(E1, E2)) :- final(corner_loc(E1, E2)), E1 != E2.
final_print(corner_perm(E1, N)) :- final(corner_perm(E1, N)), N != 0.
#show final_print/1.

#inlcude "algfind.lp".
