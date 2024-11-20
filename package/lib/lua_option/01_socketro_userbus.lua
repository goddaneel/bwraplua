#!/bin/lua


--- package
-- data
_g1_pack_data = {
        [[--ro-bind "${XDG_RUNTIME_DIR}/bus" "${XDG_RUNTIME_DIR}/bus"]],
        [[--setenv "DBUS_SESSION_BUS_ADDRESS" "unix:path=${XDG_RUNTIME_DIR}/bus"]],
}

