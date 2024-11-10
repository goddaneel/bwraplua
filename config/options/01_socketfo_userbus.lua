#!/bin/lua


--- package
-- data
_g1_pack_data = {
        [[--ro-bind "/_bwrap/own/${USER}/dbusproxy/bus" "${XDG_RUNTIME_DIR}/bus"]],
        [[--setenv "DBUS_SESSION_BUS_ADDRESS" "unix:path=${XDG_RUNTIME_DIR}/bus"]],
}

