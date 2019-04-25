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


edge(1..12).
corner(13..20).
face(u; r).


% effect of actions

%   mid-progress
%   u move
holds_mid(edge_loc(E, 1), T, U+1) :- occurs(turn(u, N), T),
                                     holds_mid(edge_loc(E, 4), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 2), T, U+1) :- occurs(turn(u, N), T),
                                     holds_mid(edge_loc(E, 1), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 3), T, U+1) :- occurs(turn(u, N), T),
                                     holds_mid(edge_loc(E, 2), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 4), T, U+1) :- occurs(turn(u, N), T),
                                     holds_mid(edge_loc(E, 3), T, U),
                                     U = 0..N-1.
holds_mid(corner_loc(C, 13), T, U+1) :- occurs(turn(u, N), T),
                                        holds_mid(corner_loc(C, 16), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 14), T, U+1) :- occurs(turn(u, N), T),
                                        holds_mid(corner_loc(C, 13), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 15), T, U+1) :- occurs(turn(u, N), T),
                                        holds_mid(corner_loc(C, 14), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 16), T, U+1) :- occurs(turn(u, N), T),
                                        holds_mid(corner_loc(C, 15), T, U),
                                        U = 0..N-1.

% r move
holds_mid(edge_loc(E, 2), T, U+1) :- occurs(turn(r, N), T),
                                     holds_mid(edge_loc(E, 6), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 6), T, U+1) :- occurs(turn(r, N), T),
                                     holds_mid(edge_loc(E, 10), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 10), T, U+1) :- occurs(turn(r, N), T),
                                     holds_mid(edge_loc(E, 7), T, U),
                                     U = 0..N-1.
holds_mid(edge_loc(E, 7), T, U+1) :- occurs(turn(r, N), T),
                                     holds_mid(edge_loc(E, 2), T, U),
                                     U = 0..N-1.
holds_mid(corner_loc(C, 14), T, U+1) :- occurs(turn(r, N), T),
                                        holds_mid(corner_loc(C, 15), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 15), T, U+1) :- occurs(turn(r, N), T),
                                        holds_mid(corner_loc(C, 18), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 18), T, U+1) :- occurs(turn(r, N), T),
                                        holds_mid(corner_loc(C, 19), T, U),
                                        U = 0..N-1.
holds_mid(corner_loc(C, 19), T, U+1) :- occurs(turn(r, N), T),
                                        holds_mid(corner_loc(C, 14), T, U),
                                        U = 0..N-1.
holds_mid(corner_perm(C, (P+1)\3), T, U+1) :- occurs(turn(r, N), T),
                                       holds_mid(corner_loc(C, 15), T, U),
                                       holds_mid(corner_perm(C, P), T, U),
                                       U = 0..N-1.
holds_mid(corner_perm(C, (P+2)\3), T, U+1) :- occurs(turn(r, N), T),
                                       holds_mid(corner_loc(C, 18), T, U),
                                       holds_mid(corner_perm(C, P), T, U),
                                       U = 0..N-1.
holds_mid(corner_perm(C, (P+1)\3), T, U+1) :- occurs(turn(r, N), T),
                                       holds_mid(corner_loc(C, 19), T, U),
                                       holds_mid(corner_perm(C, P), T, U),
                                       U = 0..N-1.
holds_mid(corner_perm(C, (P+2)\3), T, U+1) :- occurs(turn(r, N), T),
                                       holds_mid(corner_loc(C, 14), T, U),
                                       holds_mid(corner_perm(C, P), T, U),
                                       U = 0..N-1.

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
:- #count{E : holds(edge_loc(E,E1), T)} != 1, edge(E1), T=0..h.
:- #count{E : holds(edge_loc(E1,E), T)} != 1, edge(E1), T=0..h.
:- #count{N : holds(edge_perm(E,N), T)} != 1, edge(E), T=0..h.
:- #count{C : holds(corner_loc(C,C1), T)} != 1, corner(C1), T=0..h.
:- #count{C : holds(corner_loc(C1,C), T)} != 1, corner(C1), T=0..h.
:- #count{N : holds(corner_perm(C,N), T)} != 1, corner(C), T=0..h.


% inits
holds(X, 0) :- init(X).
