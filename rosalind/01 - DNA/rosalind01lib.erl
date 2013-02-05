-module(rosalind01lib).
-export([countDNAString/1, countDNAString/2, main/1]).

countDNAString(String) ->
    countDNAString(String, {0,0,0,0}).

countDNAString(<<"">>, Counts) ->
    Counts;
    
countDNAString(<<"A",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount+1, Ccount, Gcount, Tcount});
    
countDNAString(<<"C",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount, Ccount+1, Gcount, Tcount});
    
countDNAString(<<"G",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount, Ccount, Gcount+1, Tcount});
    
countDNAString(<<"T",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount, Ccount, Gcount, Tcount+1});

countDNAString(<<"\r",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount, Ccount, Gcount, Tcount});

countDNAString(<<"\n",Rest/binary>>, {Acount, Ccount, Gcount, Tcount}) ->
    countDNAString(Rest, {Acount, Ccount, Gcount, Tcount}).
    
main([FileName]) ->
    {ok, Bin} = file:read_file(FileName),
    {Acount, Ccount, Gcount, Tcount} = countDNAString(Bin),
    io:format("~w ~w ~w ~w~n", [Acount, Ccount, Gcount, Tcount]).