-module(readpasswd).
-export([start/0]).


open_file(Passwdfile) ->
    {ok, Fhandle} = file:open(Passwdfile, [read]),
    Fhandle.


close_file(Fhandle) ->
    ok = file:close(Fhandle).


read_lines(Fhandle) ->
    case file:read_line(Fhandle) of
        eof -> [];
        {ok, Line} -> [ string:strip( Line, right, $\n) | read_lines(Fhandle) ]
    end.

parse_line(Data) ->
    Split = re:split(Data, ":", [{return, list}] ),
    Split.


start() ->
    Passwdfile = "/etc/passwd",
    Fhandle = open_file(Passwdfile),
    Data = read_lines(Fhandle),
    Fields = [parse_line(X) || X <- Data],
    close_file(Fhandle),
    Fields.
