-module(parselog).
-export([start/0]).


open_file(File) ->
    {ok, Fhandle} = file:open(File, [read]),
    Fhandle.


close_file(Fhandle) ->
    ok = file:close(Fhandle).


read_lines(Fhandle) ->
    case file:read_line(Fhandle) of
        eof -> [];
        {ok, Line} -> [ string:strip( Line, right, $\n) | read_lines(Fhandle) ]
    end.

parse_line(Data) ->
    {match, User} = re:run(Data,"^(?<User>[^:]+):",[global,{capture,[1],list}]),
    %% Split = re:split(Data, ":", [{return, list}] ),
    %% Split.
    User.

start() ->
    Logfile = "/etc/passwd",
    Fhandle = open_file(Logfile),
    Data = read_lines(Fhandle),
    Fields = [parse_line(X) || X <- Data],
    close_file(Fhandle),
    Fields.


