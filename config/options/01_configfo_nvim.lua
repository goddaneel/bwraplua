#!/bin/lua


--- before
-- variable
local _ls_packvar_bwrapand = "/_and/data/bwrap/_and/"


--- package
-- data
_g1_pack_data = {
        [[--ro-bind "/_and/config/nvim/" "${HOME}/.config/nvim/"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapand..[[0_main/config/nvim/" "${HOME}/.config/nvim/"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapand.._gs_lastvar_name..[[/config/nvim/" "${HOME}/.config/nvim/"]],
        [[--tmpfs "${HOME}/.local/share/nvim/"]],
        [[--tmpfs "${HOME}/.local/state/nvim/"]],
        [[--tmpfs "${HOME}/.cache/nvim/"]],
        [[--setenv "XDG_CACHE_HOME" "${HOME}/.cache"]],
}

