-module(ex_3_2).
-compile(export_all).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 3-2. Page 83.

create(N) -> lists:reverse(reverse_create(N)).

reverse_create(N) when N < 1 -> throw("The given number must be positive");
reverse_create(1) -> [1];
reverse_create(N) -> [N | reverse_create(N-1)].
