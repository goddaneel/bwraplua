#!/bin/lua

--- package
-- last
_gs_lastvar_name = "3_icewm"
_gs_lastvar_exec = "icewm"

-- list
_g1_pack_listr = {
        "00_pre_lvl8",
        "01_devicefo_dri",
        "01_socketro_pulse",
        "01_socketro_wayland",
        "11_configfo_bash",
        "11_configfo_nvim",
        "01_configro_xdg",
        "01_configro_kde",
        "01_configro_gnome",
        "01_configro_font",
        "00_post_lvl8",
}

-- data
_g1_pack_data = {
        [[--setenv "XDG_SESSION_TYPE" "x11"]],
        [[--ro-bind "/_and/data/bwrap/_and/3_icewm/config/icewm/keys" "/usr/share/icewm/keys"]],
        [[--ro-bind "/_and/data/bwrap/_and/3_icewm/config/icewm/menu" "/usr/share/icewm/menu"]],
}

