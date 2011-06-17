-module(ex_3).
-compile(export_all).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 3-1. Page 82.

sum(N) when N < 1 -> throw("The given number must be positive");
sum(1) -> 1;
sum(N) -> N + sum(N-1).

sum(N, M) when N > M -> throw("First argument must be lesser or equal to the second");
sum(N, N) -> N;
sum(N, M) -> N + sum(N+1, M).


% Ex. 3-2. Page 83.

create(N) -> lists:reverse(reverse_create(N)).

reverse_create(N) when N < 1 -> throw("The given number must be positive");
reverse_create(1) -> [1];
reverse_create(N) -> [N | reverse_create(N-1)].


% Ex. 3-3. Page 83.

% Non-tail recursive optimized versions.
print_n_first_int(0) ->
   ok;
print_n_first_int(N) ->
   print_n_first_int(N-1),
   io:format("Number: ~p~n", [N]).
   
print_n_first_even_int(0) ->
   ok;
print_n_first_even_int(N) when N rem 2 =:= 0 ->
   print_n_first_even_int(N-1),
   io:format("Number: ~p~n", [N]);
print_n_first_even_int(N) ->
   print_n_first_even_int(N-1).
   

% Tail recursive optimized versions.
print_n_first_int2(N) ->
   print_n_first_int_acc(N, 1).
print_n_first_int_acc(N, Acc) when Acc > N ->
   ok;
print_n_first_int_acc(N, Acc) ->
   io:format("Number: ~p~n", [Acc]),
   print_n_first_int_acc(N, Acc + 1).

print_n_first_even_int2(N) ->
   print_n_first_even_int_acc(N, 1).
print_n_first_even_int_acc(N, Acc) when Acc > N ->
   ok;
print_n_first_even_int_acc(N, Acc) when Acc rem 2 =:= 0 ->
   io:format("Number: ~p~n", [Acc]),
   print_n_first_even_int_acc(N, Acc + 1);
print_n_first_even_int_acc(N, Acc) ->
   print_n_first_even_int_acc(N, Acc + 1).
