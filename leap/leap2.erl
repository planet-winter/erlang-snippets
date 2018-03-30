-module(leap).
-export([leap2/1]).

leap2(Year) ->
    {true, true, true} = { Year rem 4 == 0, Year = rem 100 == 0,Year = rem 400 == 0}.
