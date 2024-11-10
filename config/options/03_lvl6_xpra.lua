#!/bin/lua


--- package
-- last
_gs_lastvar_name = "3_xpra"
_gs_lastvar_exec = "xpra"

-- list
_g1_pack_listr = {
        "00_pre_lvl8",
        "01_devicefo_dri",
        "01_configfo_bash",
        "01_configfo_nvim",
        "01_configro_xdg",
        "01_configro_kde",
        "01_configro_gnome",
        "01_configro_font",
        "00_post_lvl6",
}

-- data
_g1_pack_data = {
        [[--ro-bind "/_and/data/bwrap/_and/3_xpra/config/X11/Xsession.d/20x11-common_process-args" "/etc/X11/Xsession.d/20x11-common_process-args"]],
        [[--ro-bind "/run" "/run"]],
        [[--bind "/tmp" "/tmp"]],
        [[--bind "${XDG_RUNTIME_DIR}" "${XDG_RUNTIME_DIR}"]],
}

