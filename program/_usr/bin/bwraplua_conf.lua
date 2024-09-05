#!/bin/lua

-- path
--[[ Package load path form configure. +]]
_g1_loadpack_prepath = {
        "/etc/bwraplua/options/?.lua",
        "${HOME}/.config/bwraplua/options/?.lua",
}

-- exec
--[[ OS cli command form configure. +]]
_g1_execute_cmd.s_show = [[batcat --style=default ]]
_g1_execute_cmd.s_list = [[tree -C -pugshDa --dirsfirst ]]

-- list
--[[ Load package prelist form configure. +]]
_gb_loadpack_prelist = true
_g1_loadpack_prelistr = {
        "00_main_pre",
}

