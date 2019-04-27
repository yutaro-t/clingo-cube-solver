
% effect of actions

holds(loc(L, X1), T+1) :- occurs(turn(FACE, N), T),
                          holds(loc(L, X2), T),
                          face_loop(FACE, GROUP, Y1, X1),
                          face_loop(FACE, GROUP, Y2, X2),
                          face_loop_length(FACE, GROUP, LEN),
                          (Y1 + N) \ LEN = Y2.

holds(perm(L, (P1-D1+D2+MOD)\MOD), T+1) :- occurs(turn(FACE, N), T),
                                holds(loc(L, X1), T),
                                holds(loc(L, X2), T+1),
                                holds(perm(L, P1), T),
                                face_perm(FACE, X1, D1),
                                face_perm(FACE, X2, D2),
                                perm_mod(TYPE, MOD),
                                piece(TYPE, L).


% inertia
holds(X, T+1) :- holds(X, T), not not holds(X, T+1), T=0..h-1.

% prohibit trivial moves
:- occurs(turn(F, _), T), occurs(turn(F, _), T+1).
P1 != P2 :- occurs(turn(F1, _), T), occurs(turn(F2, _), T+1), occurs(turn(F1, _), T+2),
            pararel_face(F1, P1), pararel_face(F2, P2).
:- occurs(wait, T), not occurs(wait, T+1), T = 0..h-2.


% existance and uniqueness of value
:- #count{E : holds(loc(E,E1), T)} != 1, piece(_, E1), T=0..h.
:- #count{E : holds(loc(E1,E), T)} != 1, piece(_, E1), T=0..h.
:- #count{N : holds(perm(E,N), T)} != 1, piece(_, E), T=0..h.


% inits
holds(X, 0) :- init(X).
