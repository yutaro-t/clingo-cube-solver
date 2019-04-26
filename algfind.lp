%
%
%             |************|
%             |*13** 1**14*|
%             |************|
%             |* 4** U** 2*|
%             |************|
%             |*16** 3**15*|
%             |************|
% ************|************|************|************
% *13** 4**16*|*16** 3**15*|*15** 2**14*|*14** 1**13*
% ************|************|************|************
% * 8** L** 5*|* 5** F** 6*|* 6** R** 7*|* 7** B** 8*
% ************|************|************|************
% *20**12**17*|*17** 9**18*|*18**10**19*|*19**11**20*
% ************|************|************|************
%             |************|
%             |*17** 9**18*|
%             |************|
%             |*12** D**10*|
%             |************|
%             |*20**11**19*|
%             |************|


piece_type(edge; corner).
piece(edge, 1..12; corner, 13..20).
% edge(1..12).
% corner(13..20).
% piece(X) :- edge(X).
% piece(X) :- corner(X).
face(u; r).

face_loop(u, 0, 0, 1; u, 0, 1, 2; u, 0, 2, 3; u, 0, 3, 4).
face_loop(u, 1, 0, 13; u, 1, 1, 14; u, 1, 2, 15; u, 1, 3, 16).
face_loop(r, 0, 0, 2; r, 0, 1, 6; r, 0, 2, 10; r, 0, 3, 7).
face_loop(r, 1, 0, 14; r, 1, 1, 15; r, 1, 2, 18; r, 1, 3, 19).
face_loop_length(u, 0, 4; u, 1, 4; r, 0, 4; r, 1, 4).

face_perm(r, 15, 1; r, 18, 2; r, 19, 1; r, 14, 2).
perm_mod(edge, 2; corner, 3).
% effect of actions

%   mid-progress


holds_mid(loc(E, X1), T, U+1) :- occurs(turn(F, N), T),
                                holds_mid(loc(E, X2), T, U),
                                U = 0..N-1,
                                face_loop(F, Z, Y1, X1),
                                face_loop(F, Z, Y2, X2),
                                face_loop_length(F, Z, L),
                                (Y1 + 1) \ L = Y2.

holds_mid(perm(C, (P+D)\MOD), T, U+1) :- occurs(turn(F, N), T),
                                    holds_mid(loc(C, X), T, U),
                                    holds_mid(perm(C, P), T, U),
                                    U = 0..N-1,
                                    face_perm(F, X, D),
                                    perm_mod(TYPE, MOD),
                                    piece(TYPE, C).


%
% holds_mid(corner_perm(C, (P+1)\3), T, U+1) :- occurs(turn(r, N), T),
%                                        holds_mid(loc(C, 15), T, U),
%                                        holds_mid(corner_perm(C, P), T, U),
%                                        U = 0..N-1.
% holds_mid(corner_perm(C, (P+2)\3), T, U+1) :- occurs(turn(r, N), T),
%                                        holds_mid(loc(C, 18), T, U),
%                                        holds_mid(corner_perm(C, P), T, U),
%                                        U = 0..N-1.
% holds_mid(corner_perm(C, (P+1)\3), T, U+1) :- occurs(turn(r, N), T),
%                                        holds_mid(loc(C, 19), T, U),
%                                        holds_mid(corner_perm(C, P), T, U),
%                                        U = 0..N-1.
% holds_mid(corner_perm(C, (P+2)\3), T, U+1) :- occurs(turn(r, N), T),
%                                        holds_mid(loc(C, 14), T, U),
%                                        holds_mid(corner_perm(C, P), T, U),
%                                        U = 0..N-1.

% connect mid-progress
holds(X, T+1) :- holds_mid(X, T, N),
                 occurs(turn(_, N), T).
holds_mid(X, T, 0) :- holds(X, T), T < h.

% inertia
holds(X, T+1) :- holds(X, T), not not holds(X, T+1), T=0..h-1.
holds_mid(X, T, U+1) :- holds_mid(X, T, U), not not holds_mid(X, T, U+1), occurs(turn(_, N), T), U=0..N-1, T=0..h.

% prohibit trivial moves
:- occurs(turn(F, _), T), occurs(turn(F, _), T+1).
:- occurs(wait, T), not occurs(wait, T+1), T = 0..h-2.


% existance and uniqueness of value
:- #count{E : holds(loc(E,E1), T)} != 1, piece(_, E1), T=0..h.
:- #count{E : holds(loc(E1,E), T)} != 1, piece(_, E1), T=0..h.
:- #count{N : holds(perm(E,N), T)} != 1, piece(_, E), T=0..h.


% inits
holds(X, 0) :- init(X).
