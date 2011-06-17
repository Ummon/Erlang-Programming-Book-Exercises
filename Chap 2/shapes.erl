-module(shapes).
-export([area/1]).
-author("Greg Burri <greg.burri@gmail.com>").

% Ex. 2-2, page 44.

area({square, Side}) ->
   Side * Side;
area({circle, Radius}) ->
   math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
   S = (A + B + C) / 2,
   math:sqrt(S * (S - A) * (S - B) * (S - C));
area(_Other) -> % '_Other' renamed from 'Other'.
   {error, invalid_object}.

