#!/bin/lua


--- package
-- last
_gs_lastvar_name = "3_pip"
_gs_lastvar_exec = "pip"

-- list
_g1_pack_listr = {
        "00_pre_lvl8",
        "01_fsloadfw_home",
        "01_socketfo_userbus",
        "01_sharesro_net",
        "01_configfo_bash",
        "01_configfo_nvim",
        "00_post_lvl8",
}

-- data
_g1_pack_data = {
        [[--ro-bind-try "${HOME}/.config/pip/" "${HOME}/.config/pip/"]],
}

