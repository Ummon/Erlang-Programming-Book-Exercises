-module(ex_3_1).
-compile(export_all).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 3-1. Page 82.

sum(N) when N < 1 -> throw("The given number must be positive");
sum(1) -> 1;
sum(N) -> N + sum(N-1).

sum(N, M) when N > M -> throw("First argument must be lesser or equal to the second");
sum(N, N) -> N;
sum(N, M) -> N + sum(N+1, M).
