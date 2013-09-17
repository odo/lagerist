-define(DEFAULT_SEVERITY, info).

-define(log(Msg),             lagerist:log(?MODULE_STRING, ?LINE, ?DEFAULT_SEVERITY, [],   Msg, [])).
-define(log(Msg, Args),       lagerist:log(?MODULE_STRING, ?LINE, ?DEFAULT_SEVERITY, [],   Msg, Args)).
-define(log(Msg, Args, Tags), lagerist:log(?MODULE_STRING, ?LINE, ?DEFAULT_SEVERITY, Tags, Msg, Args)).

-define(debug(Msg),             lagerist:log(?MODULE_STRING, ?LINE, debug, [],   Msg, [])).
-define(debug(Msg, Args),       lagerist:log(?MODULE_STRING, ?LINE, debug, [],   Msg, Args)).
-define(debug(Msg, Args, Tags), lagerist:log(?MODULE_STRING, ?LINE, debug, Tags, Msg, Args)).

-define(info(Msg),             lagerist:log(?MODULE_STRING, ?LINE, info, [],   Msg, [])).
-define(info(Msg, Args),       lagerist:log(?MODULE_STRING, ?LINE, info, [],   Msg, Args)).
-define(info(Msg, Args, Tags), lagerist:log(?MODULE_STRING, ?LINE, info, Tags, Msg, Args)).

-define(warn(Msg),             lagerist:log(?MODULE_STRING, ?LINE, error, [],   Msg, [])).
-define(warn(Msg, Args),       lagerist:log(?MODULE_STRING, ?LINE, error, [],   Msg, Args)).
-define(warn(Msg, Args, Tags), lagerist:log(?MODULE_STRING, ?LINE, error, Tags, Msg, Args)).

-define(error(Msg),             lagerist:log(?MODULE_STRING, ?LINE, error, [],   Msg, [])).
-define(error(Msg, Args),       lagerist:log(?MODULE_STRING, ?LINE, error, [],   Msg, Args)).
-define(error(Msg, Args, Tags), lagerist:log(?MODULE_STRING, ?LINE, error, Tags, Msg, Args)).

