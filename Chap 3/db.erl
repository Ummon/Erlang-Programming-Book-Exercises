-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2, test/0]).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 3-4. Page 83.

new() -> [].

destroy(_Db) -> ok.

% Will not prevent adding the same key twice ore more.
write(Key, Element, Db) ->
   [{Key, Element} | Db].

delete(_, []) ->
   [];   
delete(Key, [{Key, _} | Tail]) ->
   Tail;
delete(Key, [Element | Tail]) ->
   [Element | delete(Key, Tail)].
   
read(_, []) ->
   {error, instance};
read(Key, [{Key, Element} | _]) ->
   {ok, Element};
read(Key, [_ | Tail]) ->
   read(Key, Tail).
   
match(_, []) ->
   [];
match(Element, [{Key, Element} | Tail]) ->
   [ Key | match(Element, Tail) ];
match(Element, [_ | Tail]) ->
   match(Element, Tail).
   