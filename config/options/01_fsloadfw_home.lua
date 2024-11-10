#!/bin/lua


--- before
-- variable
local _ls_packvar_bwraphome = "/_end/${USER}/_0_data/bwrap/home/"

-- execute
if _gb_lastvar_execute then
        os.execute([[mkdir -pv "]].._ls_packvar_bwraphome.._gs_lastvar_name..[[/"]])
end


--- package
-- data
_g1_pack_data = {
        [[--bind "]].._ls_packvar_bwraphome.._gs_lastvar_name..[[/" "${HOME}/"]],
        [[--dir "${HOME}/_data/"]],
        [[--dir "${HOME}/_file/"]],
        [[--dir "${HOME}/_cache/"]],
}

