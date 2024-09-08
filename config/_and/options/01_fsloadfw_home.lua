#!/bin/lua


--- before
-- variable
local _ls_packvar_bwraphome = "${HOME}/.local/share/bwraphome/"

-- execute
if _gb_lastvar_execute then
        os.execute([[mkdir -pv "]].._ls_packvar_bwraphome.._gs_lastvar_name..[[/"]])
end


--- package
-- list
_g1_pack_listr = {
        "00_base_lvl6",
}

-- data
_g1_pack_data = {
        [[--bind "]].._ls_packvar_bwraphome.._gs_lastvar_name..[[/" "${HOME}/"]],
}

