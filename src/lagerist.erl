-module(lagerist).
-include("lagerist.hrl").

-compile ([export_all]).

%% ================== logging ==================
% the actual logging
% in contrast to the lager implementation
% additional tags do not overwrite the ones set
% on the process level
log(Module, Line, Level, Metadata, Format, Args) ->
    NewMetadata = [{module, Module}, {line, Line}] ++ Metadata ++ lager:md(),
    lager:log(Level, NewMetadata, Format, Args).

%% ================== tracing ==================
trace(File, Groups) ->
    trace(File, Groups, []).

trace(_, [], []) ->
    untrace();
trace(File, Groups, Tags) ->
    untrace(),
    Trace = fun(Group) ->
            lager:trace_file(File, [{log_group, Group}] ++ Tags, debug)
    end,
    [Trace(Group)||Group<-Groups].

untrace() ->
    lager:clear_all_traces().

%% ================== helpers ==================

% helpers to set tags for a process
set_group(Name) ->
    set_tag({log_group, Name}).

set_tag(Tag = {_, _}) ->
    set_tags([Tag]).

set_tags(Tags) when is_list(Tags) ->
    TagsOld = lager:md(),
    TagsClean = lists:foldl(fun({K, _}, Ts) -> proplists:delete(K, Ts) end, TagsOld, Tags),
    lager:md(lists:usort(Tags ++ TagsClean)).

