#!/bin/lua


--- before
-- variable

-- execute
if _gb_lastvar_execute then
        os.execute([[mkdir -pv "${XDG_RUNTIME_DIR}/tao"]])
end


--- package
-- last
_gs_lastvar_name = "3_clash-nyanpasu"
_gs_lastvar_exec = "clash-nyanpasu"

-- list
_g1_pack_listr = {
        "00_pre_lvl8",
        "01_fsloadfw_home",
        "01_devicefo_dri",
        "01_socketro_wayland",
        "01_socketro_pulse",
        "01_sharesro_net",
        "01_configfo_bash",
        "01_configfo_nvim",
        "01_configro_xdg",
        "01_configro_kde",
        "01_configro_gnome",
        "01_configro_font",
        "00_post_lvl8",
}

-- data
_g1_pack_data = {
        [[--bind "${XDG_RUNTIME_DIR}/tao" "${XDG_RUNTIME_DIR}/tao"]],
}

