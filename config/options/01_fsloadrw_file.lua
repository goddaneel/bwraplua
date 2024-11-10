#!/bin/lua


--- before
--
-- variable
local _ls_packvar_bwrapendl = "/_end/${USER}/_0_file/"

-- execute
if _gb_lastvar_execute then
        os.execute([[mkdir -pv "]].._ls_packvar_bwrapendl.._gs_lastvar_exec..[[/"]])
end


--- package
-- data
_g1_pack_data = {
        [[--bind "]].._ls_packvar_bwrapendl.._gs_lastvar_exec..[[/" "]].._ls_packvar_bwrapendl.._gs_lastvar_exec..[[/"]],
}

