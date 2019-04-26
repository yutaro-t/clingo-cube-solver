
holds_mid_print(loc(E1, E2), T, U) :- holds_mid(loc(E1, E2), T, U), E1 != E2.
holds_mid_print(perm(E1, N), T, U) :- holds_mid(perm(E1, N), T, U), N != 0.
holds_print(loc(E1, E2), T) :- holds(loc(E1, E2), T), E1 != E2.
holds_print(perm(E1, N), T) :- holds(perm(E1, N), T), N != 0.


#show holds_print/2.
% #show holds_mid_print/3.
