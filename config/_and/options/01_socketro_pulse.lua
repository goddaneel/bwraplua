#!/bin/lua


--- package
-- list
_g1_pack_listr = {
        "00_base_lvl6",
}

-- data
_g1_pack_data = {
        [[--ro-bind-try "/run/user/$(id -u)/pulse/" "/run/user/$(id -u)/pulse/"]],
        [[--ro-bind-try "${XDG_RUNTIME_DIR}/pulse/" "${XDG_RUNTIME_DIR}/pulse/"]],
}

