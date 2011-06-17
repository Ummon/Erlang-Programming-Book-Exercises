-module(ex_3_3).
-compile(export_all).
-author("Greg Burri <greg.burri@gmail.com>").

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
