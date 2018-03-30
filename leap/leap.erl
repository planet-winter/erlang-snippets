-module(leap). 
-export([leap/1]). 

leap(Year) -> 
  if
  Year rem 4 == 0 ->
    if Year rem 100 == 0 ->
      if Year rem 400 == 0 ->
        io:fwrite("leap year!"),
      true
      end,
    true
    end;
  true ->
    io:fwrite("bÄaaaaa")
  end.