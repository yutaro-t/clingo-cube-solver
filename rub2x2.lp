%       |*****|
%       |*1*2*|
%       |*****|
%       |*4*3*|
%       |*****|
% |*****|*****|*****|*****|
% |*1*4*|*4*3*|*3*2*|*2*1*|
% |*****|*****|*****|*****|
% |*X*7*|*7*6*|*6*5*|*5*X*|
% |*****|*****|*****|*****|
%       |*****|
%       |*7*6*|
%       |*****|
%       |*X*5*|
%       |*****|




piece_type(corner).
piece(corner, 1..7).
% Turnable face
face(u; r; f).

pararel_face(u, 0; r, 1; f, 2).

face_loop(u, 0, 0, 1 ; u, 0, 1, 4 ; u, 0, 2, 3 ; u, 0, 3, 2 ).
face_loop(r, 0, 0, 3 ; r, 0, 1, 6 ; r, 0, 2, 5 ; r, 0, 3, 2 ).
face_loop(f, 0, 0, 4 ; f, 0, 1, 7 ; f, 0, 2, 6 ; f, 0, 3, 3 ).


face_loop_length(F, I, 4) :- face_loop(F, I, _, _).


face_perm(r, 3, 0; r, 6, 1; r, 5, 0; r, 2, 1).
face_perm(f, 4, 0; f, 7 ,1; f, 6 ,0; f, 3 ,1).

perm_mod(corner, 3).

#const max_turn_size=3.
