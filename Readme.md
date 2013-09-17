# Lagerist

lagerist is a thin wrapper around the lager logging framework (<https://github.com/basho/lager>). It adds/changes several things:

* notion of log-groups, which can be turned on/off on the fly
* notion of tags
* convinients macros
* works without parse transform

## Installation

```
git clone git@github.com:odo/lagerist.git
cd lagerist
./rebar get-deps
./rebar compile
```

## Example

Say we would like to log some user activity from our app but want to be able to turn this aspect on and off.

Let's start a node with the example configuration:

`erl -pz ebin deps/*/ebin -config config/example.config`

Now, we can start lager and turn on the log-group "user_activity" for log/debug.log

```erlang
application:start(lager).
lagerist:trace("log/debug.log", ["user_activity"]).
```

Next we specify that our current process produces messages in the group "user_activity". Also we set the user id process-wide. Everything we will log from now on will be tagged with that log-group and user id.

```erlang
lagerist:set_group("user_activity").
lagerist:set_tag({user_id, 12345}).
lagerist:log("module", 0, debug, [], "login", []).
```
(usually you would include `lagerist.hrl` and then use a macro to log: `?debug("login")`.)

`log/debug.log` will show something like:

```
2013-09-17 12:12:10.030[debug] <user_activity> {12345}  login
```
Notice the formatting of the user id as specified in the config file. This can be very helpful when searching log files.

If you want to stop logging any groups you can simply use

```erlang
lagerist:untrace().
```

If your process is not tied to one logging group and user id or if you refrain from using the process dictionary you can do:

```erlang
lagerist:log("module", 0, debug, [{log_group, "user_activity"}, {user_id, 12345}], "login", []).
?debug("login", [], [{log_group, "user_activity"}, {user_id, 12345}]).
```

## Including the header file to get the macros

In order to include `lagerist.hrl` you have to tell rebar where to find it by adding 

```{erl_opts, [{i, "deps/lagerist/include"}]}.```

to `rebar.config` .
