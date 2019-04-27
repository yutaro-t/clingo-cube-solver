final(X) :- holds(X, h).

final_print(loc(E1, E2)) :- final(loc(E1, E2)), E1 != E2.
final_print(perm(E1, N)) :- final(perm(E1, N)), N != 0.
#show final_print/1.

#include "algfind.lp".
