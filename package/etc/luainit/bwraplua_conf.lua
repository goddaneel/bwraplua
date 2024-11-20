#!/bin/lua

-- path
--[[ Package load path form configure. +]]
_g1_loadpack_etcpath = {
        "/_and/config/bwraplua/options/?.lua",
        "/_end/"..os.getenv("USER").."/_0_config/bwraplua/options/?.lua",
}

-- exec
--[[ OS cli command form configure. +]]
_g1_execute_cmd.s_show = [[batcat --style=default ]]
_g1_execute_cmd.s_list = [[exa --time-style=long-iso -Tlgha ]]

-- list
--[[ Load package prelist form configure. +]]
_gb_loadpack_prelist = true
_g1_loadpack_prelistr = {
        "00_pre_lvl8",
}

