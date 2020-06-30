%
% dan.pl
% manontanto
%
q:-
  sequential(1, 16, X0),
  deletes(X0, [15, 14], X1),
  g_assign(counter, 1),  % for gprolog
%  global_set(counter,1),  % for B-Prolog
  !,
  combination(4, X1,[A0, B0, C0, D0]),
  A0+B0+C0+D0 =:= 34,
  deletes(X1, [A0, B0, C0, D0], Lx),
  combination(4, Lx, [E0, F0, G0, H0]),
  E0+F0+G0+H0 =:= 34,
  deletes(Lx, [E0, F0, G0, H0], Lxx),
  combination(4, Lxx, [I0, J0, K0, L0]),
  I0+J0+K0+L0 =:= 34,

  permutation([A0,B0,C0,D0],[A,B,C,D]),
  permutation([E0,F0,G0,H0],[E,F,G,H]),
  permutation([I0,J0,K0,L0],[I,J,K,L]),
  (N, O) = (15,14),
  select(M, [4,3,2,1],_),
  P is 5 - M,

  check([A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]),

  nl,
  g_read(counter, OldCnt),  % for gprolog
%  global_get(counter,OldCnt), % for B-Proaclog
  print(OldCnt),nl, NewCnt is OldCnt + 1,
  print([A,B,C,D]), nl, print([E,F,G,H]), nl,
  print([I,J,K,L]), nl, print([M,N,O,P]), nl,
  g_assign(counter, NewCnt), % for gprolog
%  global_set(counter, NewCnt), % for B-Prolog
  fail.
%-----------------------------------------
check([A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P]):-
  A+E+I+M =:= 34,
  B+F+J+N =:= 34,
  C+G+K+O =:= 34,
  D+H+L+P =:= 34,
  A+F+K+P =:= 34,
  D+G+J+M =:= 34,
  A+B+E+F =:= 34,
  C+D+G+H =:= 34,
  I+J+M+N =:= 34,
  K+L+O+P =:= 34,
  A+D+M+P =:= 34,
  F+G+J+K =:= 34.

deletes(X, [], X).
deletes(L, [H|Ls], X) :-
  delete(L, H, X1),
  deletes(X1, Ls, X).

combination(0, _, []).
combination(N, [X | Xs], [X | Zs]) :-
  N > 0, N1 is N - 1, combination(N1, Xs, Zs).
combination(N, [_ | Xs], Zs) :- N > 0, combination(N, Xs, Zs).

sequential(I, N, []):- I > N.
sequential(I, N, [I|L1]):-
  I =< N, I1 is I + 1,
  sequential(I1, N, L1).

