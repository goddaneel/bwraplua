#!/bin/lua


--- initialize
-- path
--[[ Initialize package path+]]
package.path = nil

-- conf
--[[ Initialize etc path table.+]]
_g1_loadpack_etcpath = {}
--[[ Initialize etc path variable.+]]
local _ls_loadpack_etcpath = nil


--- configure
-- require
--[[ Set main package dirs.+]]
_gs_main_dirs = _gs_main_path.."/../../"
--[[ Set package path form init path.+]]
package.path = _gs_main_dirs.."/etc/luainit/?.lua"
if package.searchpath("bwraplua_conf", package.path) then
        require("bwraplua_conf")
end

-- path
-- [[ Package load ectpath form bwraplua_conf.+]]
if (type(_g1_loadpack_etcpath) == "table") then
        for _,_ls_v1 in ipairs(_g1_loadpack_etcpath) do
                _ls_loadpack_etcpath = _ls_loadpack_etcpath.._ls_v1..";"
        end
end
--[[ Package load path form configure. +]]
if (_ls_loadpack_etcpath == nil) then
        _g1_loadpack_prepath = {
                _gs_main_path.."/../lua_option/?.lua",
        }
else
        _g1_loadpack_prepath = {
                _gs_main_path.."/../lua_option/?.lua",
                _ls_loadpack_etcpath,
        }
end

