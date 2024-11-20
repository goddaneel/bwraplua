#!/bin/lua


--- configure
-- main
--[[ Pick up main program realpath. +]]
local _ls_main_name = debug.getinfo(1, "S").short_src
local _ls_popen_l1 = io.popen([[dirname "$(realpath -e ]].._ls_main_name..[[)"]])
local _ls_popen_l1_read = _ls_popen_l1:read("*a")
local _ls_main_path = string.sub(_ls_popen_l1_read, 1, -2)
local _ls_popen_l1_close = _ls_popen_l1:close()

-- path
--[[ Initialize package path. +]]
package.path = nil
--[[ Set package path form main path. +]]
local _ls_main_packpath = _ls_main_path.."/?.lua"
--[[ Package load path (candidate). +]]
if os.getenv("XDG_CONFIG_HOME") then
        _g1_loadpack_prepath = {
                os.getenv("XDG_CONFIG_HOME").."/bwraplua/options/?.lua",
        }
else
        _g1_loadpack_prepath = {
                os.getenv("HOME").."/.config/bwraplua/options/?.lua",
        }
end

-- load
--[[ Load package prelist (candidate). +]]
_g1_loadpack_prelistr = {}
_g1_loadpack_prelistu = {}
_g1_loadpack_prelisti = {}
_gb_loadpack_prelist = false

-- exec
--[[ OS cli command (candidate), for "os.execute". +]]
_g1_execute_cmd = {}
_g1_execute_cmd.s_show = [[cat ]]
_g1_execute_cmd.s_list = [[ls -lhA --color=auto ]]
--[[ Whether to print output or not (candidate). +]]
_gb_printout_mode = true

-- last
--[[ Name and id of bwrap and exec (candidate). +]]
_gs_lastvar_name = "null"
_gs_lastvar_exec = "null"
--[[ Whether to execute bwrap or not (candidate). +]]
_gb_execute_mode = false

-- config
--[[ Require and cover configure form main program path. +]]
package.path = _ls_main_packpath
if package.searchpath("bwraplua_init", _ls_main_packpath) then
        require("bwraplua_init")
end


--- default
-- path
--[[ Package load path, add to package path. +]]
local _ls_loadpack_fullpath = ""
local _l1_loadpack_prepath = _g1_loadpack_prepath
--[[ Package load fullpath form default or configure. +]]
for _,_ls_v1 in ipairs(_l1_loadpack_prepath) do
        _ls_loadpack_fullpath = _ls_loadpack_fullpath.._ls_v1..";"
end
package.path = _ls_loadpack_fullpath

-- load
--[[ Load package list (initialize). +]]
local _l1_loadpack_arglistr = {}
local _l1_loadpack_arglistu = {}
local _l1_loadpack_arglisti = {}
local _lb_loadpack_arglist = true
--[[ Load package prelist. +]]
local _l1_loadpack_prelistr = _g1_loadpack_prelistr
local _l1_loadpack_prelistu = _g1_loadpack_prelistu
local _l1_loadpack_prelisti = _g1_loadpack_prelisti
local _lb_loadpack_prelist = _gb_loadpack_prelist
--[[ Load package prelist. +]]
local _ls_preload_data = ""
local _ls_argload_data = ""
--[[ Load package loop list (initialize). +]]
local _l1_loadpack_listr = {
        "bwraplua_init",
}
local _l1_loadpack_listi = {
        "bwraplua_init",
}
local _l1_loadpack_listu = {
        false,
}
--[[ Load package loop pairs level (initialize). +]]
local _ln_packloop_list = 0
local _ls_packloop_list = "  -"

-- exec
--[[ OS cli command, for "os.execute". +]]
local _l1_execute_cmd = _g1_execute_cmd
--[[ Whether to print output or not. +]]
local _lb_printout_mode = _gb_printout_mode

-- last
--[[ Last arguments initialize. +]]
local _ls_load_options = ""
local _ls_args_options = ""
local _ls_args_command = ""
--[[ Name and id of bwrap and exec. +]]
local _ls_argsvar_name = nil
local _ls_argsvar_exec = nil
--[[ Whether to enter extened mode. +]]
local _lb_extargs_mode = false
--[[ Whether to execute bwrap or not. +]]
local _lb_execute_mode = _gb_execute_mode

-- loop
--[[ Loop status initialize. +]]
local _l1_loop_status = {}
_l1_loop_status.b_mode = false
_l1_loop_status.s_args = nil


--- main
-- argument
--[[ Main arguments. +]]
local _l1_argument = {...}

-- loopargs
--[[ Pairs arguments, judge whether to print output or not. +]]
for _ln_i1,_ls_v1 in ipairs(_l1_argument) do
        if (_ls_v1 == ",v,") then
                --[[ Print full output. +]]
                _lb_printout_mode = true
        elseif (_ls_v1 == ",q,") then
                --[[ Print quiet output. +]]
                _lb_printout_mode = false
        elseif (_ls_v1 == ",,m") then
                --[[ Stop mode. +]]
                break
        elseif (_ls_v1 == ",,e") then
                --[[ Extened mode. +]]
                break
        end
end
--[[ Whether to print title or not. +]]
if _lb_printout_mode then
        --[[ Print blank line. +]]
        print()
        print(string.format([[%s #LOOPARGS# %s]], "\x1b[4;34m", "\x1b[0m"))
end
--[[ {LOOP} Main arguments pairs loop. +]]
for _ln_i1,_ls_v1 in ipairs(_l1_argument) do
        if _lb_printout_mode then
                print([[  ]].._ln_i1,string.format([[%s]].._ls_v1..[[%s]], "\x1b[32m", "\x1b[0m"))
        end
        --[[ {IF} Status and mode matching. +]]
        if (_ls_v1 == ",,h") then
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",,l") then
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",,p") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",,n") then
                --[[ Null mode, minimum match argument will not be used. +]]
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",,m") then
                --[[ Stop mode, maximum match argument will not be used. +]]
                break
        elseif (_ls_v1 == ",,e") then
                --[[ Extened mode, pause argument pattern matching. +]]
                _l1_loop_status.b_mode = true
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",re") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",op") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",co") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",na") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",ex") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",r") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",u") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",i") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",o") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",c") then
                _l1_loop_status.b_mode = false
                _l1_loop_status.s_args = _ls_v1
        elseif (_ls_v1 == ",y,") then
                --[[ Last execute yes. +]]
                _l1_loop_status.b_mode = false
                _lb_execute_mode = true
        elseif (_ls_v1 == ",n,") then
                --[[ Last execute no. +]]
                _l1_loop_status.b_mode = false
                _lb_execute_mode = false
        elseif (_ls_v1 == ",r,") then
                --[[ Load prelist yes. +]]
                _l1_loop_status.b_mode = false
                _lb_loadpack_prelist = true
        elseif (_ls_v1 == ",c,") then
                --[[ Load prelist no. +]]
                _l1_loop_status.b_mode = false
                _lb_loadpack_prelist = false
                --[[ Exclude extra status options. +]]
        elseif (_ls_v1 == ",v,") then
                _l1_loop_status.b_mode = false
        elseif (_ls_v1 == ",q,") then
                _l1_loop_status.b_mode = false
        else
                --[[ Mode reset, start processing. +]]
                _l1_loop_status.b_mode = true
        end
        --[[ {IF} Override when extened mode is enabled. +]]
        if _lb_extargs_mode then
                _l1_loop_status.s_args = ",c"
                _l1_loop_status.b_mode = true
        end
        --[[ {IF} Arguments and status processing. +]]
        if (_l1_loop_status.s_args == ",,h") then
                print()
                print(string.format([[%s HELP %s]], "\x1b[3;34m", "\x1b[0m"))
                --[[ Print main program and configure, as help. +]]
                os.execute(_l1_execute_cmd.s_show.._ls_main_path..[[/bwraplua.lua]])
                print()
                os.execute(_l1_execute_cmd.s_show.._ls_main_path..[[/bwraplua_init.lua]])
                os.exit()
        elseif (_l1_loop_status.s_args == ",,l") then
                print()
                print(string.format([[%s LIST %s]], "\x1b[3;34m", "\x1b[0m"))
                --[[ Print all package, as list. +]]
                for _,_ls_v1 in ipairs(_l1_loadpack_prepath) do
                        print()
                        os.execute(_l1_execute_cmd.s_list..[["$(dirname ]].._ls_v1..[[)"]])
                        print()
                end
                os.exit()
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",,p") then
                print()
                print(string.format([[%s LOAD %s]], "\x1b[3;34m", "\x1b[0m"))
                --[[ Print realpath of selected load package. +]]
                local _ls_pack_realpath = package.searchpath(_ls_v1, _ls_loadpack_fullpath)
                --[[ Print selected load package. +]]
                if _ls_pack_realpath then
                        os.exit(os.execute(_l1_execute_cmd.s_show.._ls_pack_realpath))
                else
                        print()
                        print(string.format([[%s ERROR: "]].._ls_v1..[[" Not Found. %s]], "\x1b[31m", "\x1b[0m"))
                        os.exit(1)
                end
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",,e") then
                --[[ Start extened mode. +]]
                _lb_extargs_mode = true
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",re") then
                --[[ Reset options table form load package. +]]
                _l1_loadpack_arglistr = {}
                _l1_loadpack_arglistu = {}
                _l1_loadpack_arglisti = {}
                _l1_loadpack_arglistr[(#_l1_loadpack_arglistr + 1)] = _ls_v1
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",op") then
                --[[ Reset options table form main argument. +]]
                _ls_args_options = ""
                _ls_args_options = _ls_args_options.._ls_v1.." "
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",co") then
                --[[ Reset command table form main argument. +]]
                _ls_args_command = ""
                _ls_args_command = _ls_args_command.._ls_v1.." "
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",na") then
                --[[ Set a variable, as name of bwrap. +]]
                _ls_argsvar_name = _ls_v1
                --[[ Reset argument type, only once. +]]
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",ex") then
                --[[ Set a variable, as execid of command. +]]
                _ls_argsvar_exec = _ls_v1
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",r") then
                --[[ Change options table form load package. +]]
                _l1_loadpack_arglistr[(#_l1_loadpack_arglistr + 1)] = _ls_v1
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",u") then
                --[[ Change options table form load package. +]]
                _l1_loadpack_arglistu[(#_l1_loadpack_arglistu + 1)] = _ls_v1
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",i") then
                --[[ Change options iftable form load package. +]]
                _l1_loadpack_arglisti[(#_l1_loadpack_arglisti + 1)] = _ls_v1
                _l1_loop_status.s_args = nil
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",o") then
                --[[ Change options table form main argument. +]]
                _ls_args_options = _ls_args_options.._ls_v1.." "
        elseif _l1_loop_status.b_mode and (_l1_loop_status.s_args == ",c") then
                --[[ Change command table form main argument. +]]
                _ls_args_command = _ls_args_command.._ls_v1.." "
        end
end

-- looppack
if _lb_printout_mode then
        print()
        print(string.format([[%s #LOOPPACK# %s]], "\x1b[4;34m", "\x1b[0m"))
end
--[[ Load prelist or not, set load list. +]]
if _lb_loadpack_prelist then
        _l1_loadpack_listr = _l1_loadpack_prelistr
        _l1_loadpack_listi = _l1_loadpack_prelisti
        --[[ Unnecessary load list form config. +]]
        for _ln_i1,_ls_v1 in ipairs(_l1_loadpack_prelistr) do
                for _,_ls_v2 in ipairs(_l1_loadpack_prelistu) do
                        if (_ls_v1 == _ls_v2) then
                                _l1_loadpack_listu[(_ln_i1)] = true
                        end
                end
        end
end
--[[ {LOOP} Main loadpack list pairs loop. +]]
while (#_l1_loadpack_listr > 0) do
        --[[ Reset loop list and data of package. +]]
        local _l1_packfull_listr = {}
        local _l1_packfull_listu = {}
        local _ls_packfull_data = ""
        --[[ Load package loop pairs level (reverse). +]]
        _ln_packloop_list = (_ln_packloop_list + 1)
        --[[ Layer loop of package list and data. +]]
        for _ln_i1,_ls_v1 in ipairs(_l1_loadpack_listr) do
                --[[ Reset package's list and data. +]]
                _g1_pack_listr = {}
                _g1_pack_listu = {}
                _g1_pack_data = {}
                --[[ Package's full realpath. +]]
                local _ls_pack_realpath = package.searchpath(_ls_v1, _ls_loadpack_fullpath)
                --[[ Package's load necessity. +]]
                local _lb_pack_realpath = _l1_loadpack_listu[(_ln_i1)]
                --[[ If package is ignored, change mode. +]]
                for _,_ls_v2 in ipairs(_l1_loadpack_listi) do
                        if (_ls_v1 == _ls_v2) then
                                _ls_pack_realpath = false
                                _lb_pack_realpath = true
                                break
                        end
                end
                if _lb_printout_mode then
                        print(_ls_packloop_list.._ln_packloop_list,_ls_v1,_ls_pack_realpath)
                end
                --[[ Cover variable form argument. +]]
                if _ls_argsvar_name then
                        _gs_lastvar_name = _ls_argsvar_name
                end
                if _ls_argsvar_exec then
                        _gs_lastvar_exec = _ls_argsvar_exec
                end
                _gb_lastvar_execute = _lb_execute_mode
                --[[ Save and reset lastvar form pack. +]]
                local _ls_packfull_name = _gs_lastvar_name
                local _ls_packfull_exec = _gs_lastvar_exec
                --[[ If pack exist or not ignore, load pack. +]]
                if _ls_pack_realpath then
                        require(_ls_v1)
                elseif _lb_pack_realpath then
                else
                        print()
                        print(string.format([[%s ERROR: "]].._ls_v1..[[" Not Found. %s]], "\x1b[31m", "\x1b[0m"))
                        os.exit(1)
                end
                --[[ Pick up data form package, and add to medium table. +]]
                for _,_ls_v2 in ipairs(_g1_pack_data) do
                        if _lb_printout_mode then
                                print([[]],string.format([[%s]].._ls_v2..[[%s]], "\x1b[32m", "\x1b[0m"))
                        end
                        _ls_packfull_data = _ls_packfull_data.._ls_v2.." "
                end
                --[[ If level > 1, reset lastvar form save. +]]
                if (_ln_packloop_list > 1) then
                        _gs_lastvar_name = _ls_packfull_name 
                        _gs_lastvar_exec = _ls_packfull_exec 
                end
                --[[ Pick up list form package, and add to new packlist. +]]
                for _,_ls_v2 in ipairs(_g1_pack_listr) do
                        _l1_packfull_listr[(#_l1_packfull_listr + 1)] = _ls_v2
                        _l1_packfull_listu[(#_l1_packfull_listr)] = false
                        --[[ Pick up unnecessary list form package, and add to new packlist. +]]
                        for _,_ls_v3 in ipairs(_g1_pack_listu) do
                                if (_ls_v2 == _ls_v3) then
                                        _l1_packfull_listu[(#_l1_packfull_listr)] = true
                                        break
                                end
                        end
                end
        end
        --[[ Pick up list form medium variable, and add to load options variable. +]]
        if _lb_loadpack_arglist then
                _ls_preload_data = _ls_packfull_data.._ls_preload_data
        else
                _ls_argload_data = _ls_packfull_data.._ls_argload_data
        end
        --[[ Create new package list form package. +]]
        _l1_loadpack_listr = _l1_packfull_listr
        _l1_loadpack_listu = _l1_packfull_listu
        --[[ If prelist is finish, start load arglist, only once. +]]
        if not (#_l1_loadpack_listr > 0) and _lb_loadpack_arglist then
                _lb_loadpack_arglist = false
                _l1_loadpack_listr = _l1_loadpack_arglistr
                _l1_loadpack_listi = _l1_loadpack_arglisti
                --[[ Unnecessary load list form argument. +]]
                for _ln_i1,_ls_v1 in ipairs(_l1_loadpack_arglistr) do
                        for _,_ls_v2 in ipairs(_l1_loadpack_arglistu) do
                                if (_ls_v1 == _ls_v2) then
                                        _l1_loadpack_listu[(_ln_i1)] = true
                                end
                        end
                end
                --[[ Load package arg loop pairs level. +]]
                _ln_packloop_list = 0
                _ls_packloop_list = "  +"
        end
end

-- lastargs
if _lb_printout_mode then
        print()
        print(string.format([[%s #LASTARGS# %s]], "\x1b[4;34m", "\x1b[0m"))
end
--[[ Split joint last options variable form load options variable. +]]
_ls_load_options = _ls_preload_data.._ls_argload_data
--[[ Print last options and command (list format). +]]
if _lb_printout_mode then
        print("  preload_data")
        print([[]],string.format([[%s]].._ls_preload_data..[[%s]], "\x1b[36m", "\x1b[0m"))
        print("  argload_data")
        print([[]],string.format([[%s]].._ls_argload_data..[[%s]], "\x1b[36m", "\x1b[0m"))
        print("  args_options")
        print([[]],string.format([[%s]].._ls_args_options..[[%s]], "\x1b[36m", "\x1b[0m"))
        print("  args_command")
        print([[]],string.format([[%s]].._ls_args_command..[[%s]], "\x1b[36m", "\x1b[0m"))
end
--[[ Concatenate last options and command. +]]
local _ls_lastargs_opt = _ls_load_options.._ls_args_options
local _ls_lastargs_cmd = _ls_args_command

-- check
--[[ Check up options and command. If they are invalid, output error. +]]
if (_ls_lastargs_opt == "") or (_ls_lastargs_cmd == "") then
        print()
        print(string.format([[%s ERROR: Invalid Option. %s]], "\x1b[31m", "\x1b[0m"))
        os.exit(1)
end

-- excute
if _lb_printout_mode then
        print()
        print(string.format([[%s #EXECUTE# %s]], "\x1b[4;34m", "\x1b[0m"))
        --[[ Print last name, execid, options and command. +]]
        print([[]],string.format([[%s]].._gs_lastvar_name..[[:]].._gs_lastvar_exec..[[%s]], "\x1b[1;36m", "\x1b[0m"))
        print([[  bwrap]],string.format([[%s]].._ls_lastargs_opt.._ls_lastargs_cmd..[[%s]], "\x1b[3;36m", "\x1b[0m"))
        print()
end
--[[ Whether to execute bwrap or not. If it's no , output warning. +]]
if not _lb_execute_mode then
        print()
        print(string.format([[%s WARNING: Not Executed. %s]], "\x1b[33m", "\x1b[0m"))
        os.exit(1)
end

-- running
--[[ Last execute start, main program. +]]
print(string.format([[%s #START# %s]], "\x1b[1;4;5;34m", "\x1b[0m"))
print()
--[[ Last execute running, main program. +]]
os.execute([[bwrap ]].._ls_lastargs_opt.._ls_lastargs_cmd)
--[[ Last execute stop, main program. +]]
print()
print(string.format([[%s #STOP# %s]], "\x1b[1;4;5;34m", "\x1b[0m"))

