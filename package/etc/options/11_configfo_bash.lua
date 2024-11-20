#!/bin/lua


--- before
-- variable
local _ls_packvar_bwrapand = "/_and/data/bwrap/_and/"
local _ls_packvar_bwrapend = "/_end/${USER}/_0_data/bwrap/_end/"


--- package
-- data
_g1_pack_data = {
        [[--setenv "_Es_bwrap_name" ]].._gs_lastvar_name,
        [[--setenv "_Es_bwrap_exec" ]].._gs_lastvar_exec,
        [[--ro-bind-try "]].._ls_packvar_bwrapand..[[0_main/config/bash/" "/_and/config/bash/"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapand..[[0_main/config/bash/bashrc" "${HOME}/.bashrc"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapand.._gs_lastvar_name..[[/config/bash/" "/_and/config/bash/"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapand.._gs_lastvar_name..[[/config/bash/bashrc" "${HOME}/.bashrc"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapend..[[0_main/_0_config/bash/" "/_end/${USER}/_0_config/bash/"]],
        [[--ro-bind-try "]].._ls_packvar_bwrapend.._gs_lastvar_name..[[/_0_config/bash/" "/_end/${USER}/_0_config/bash/"]],
        [[--chdir "${HOME}"]],
}

