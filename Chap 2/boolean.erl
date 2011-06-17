-module(boolean).
-export([b_not/1, b_and/2, b_or/2, b_nand/2, test/0]).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 2-3, page 44.

b_not(true) -> false;
b_not(false) -> true.

b_and(true, true) -> true;
b_and(_, _) -> false.

b_or(false, false) -> false;
b_or(_, _) -> true.

b_nand(true, true) -> false;
b_nand(_, _) -> true.

test() ->
   true = b_not(false),
   false = b_and(false, true),
   true = b_and(b_not(b_and(true, false)), true),
   ok.
