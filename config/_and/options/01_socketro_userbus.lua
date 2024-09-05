#!/bin/lua


--- package
-- list
_g1_pack_listr = {
        "00_base_lvl6",
}

-- data
_g1_pack_data = {
        [[--ro-bind-try "/run/user/$(id -u)/bus" "/run/user/$(id -u)/bus"]],
        [[--ro-bind-try "${XDG_RUNTIME_DIR}/bus" "${XDG_RUNTIME_DIR}/bus"]],
}

