%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(tcp_echo_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).
-export([test_connections/1]).

%% API.

start(_Type, _Args) ->
    Opts = [{backlog, 1}, {max_connections, 1}],
	{ok, _} = ranch:start_listener(tcp_echo, 1,
		ranch_tcp, [{port, 5555}] ++ Opts, echo_protocol, []),
	{ok, _} = ranch:start_listener(tcp_echo2, 100,
		ranch_tcp, [{port, 5556}] ++ Opts, echo_protocol, []),
	tcp_echo_sup:start_link().

stop(_State) ->
	ok.

test_connections(Port) ->
    [erlang:display(gen_tcp:connect("localhost", Port, [])) || _ <- lists:seq(1, 100)],
    ok.
