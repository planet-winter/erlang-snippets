-module(accumulate).
-export([accu/2,start/0]).


accu([H|T],F) -> [F(H)|accu(T),F];
accu([],_) -> [].

start() ->
  L=[1,2,3,4,5].
  F=fun(X) -> X*X end.
  accu(L,F).
      