-module (step0_repl).
-export ([main/1]).

-define (PROMT, "user> ").

-spec read(string()) -> string().
read(Input) ->
	Input.

-spec eval(string()) -> string().
eval(Code) ->
	Code.

-spec print(string()) -> string().
print(Result) ->
	Result.

-spec rep(string()) -> string().
rep(Input) ->
	Code = read(Input),
	Result = eval(Code),
	print(Result).

-spec main([string()]) -> no_return().
main(_) ->
	case io:get_line(standard_io, ?PROMT) of
		eof ->
			io:format("~nBye.~n"),
			ok;
		{error, Reason} ->
			io:format("Error while reading input: ~p", [Reason]),
			halt(-1);
		Input ->
			io:format("~s~n", [rep(string:strip(Input, both, $\n))]),
			main([])
	end.