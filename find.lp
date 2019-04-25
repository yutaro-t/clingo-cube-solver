

% define possible actions

action(turn(M, N)) :- face(M), N=1..3.
action(wait).
{occurs(A, T) : action(A)} = 1 :- T = 0..h-1.


:- not holds(X, h), goal(X).

#maximize{T : occurs(wait, T)}.
#show occurs/2.

#include "algfind.lp".
