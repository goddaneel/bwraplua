#!/bin/lua

--- package
-- last
_gs_lastvar_name = "0_lvl8"

-- data
_g1_pack_data = {
        [[--unshare-all]],
        [[--proc "/proc"]],
        [[--dev "/dev"]],
        [[--tmpfs "/tmp"]],
        [[--tmpfs "${HOME}"]],
        [[--tmpfs "${XDG_RUNTIME_DIR}"]],
        [[--tmpfs "/_end/${USER}"]],
        [[--tmpfs "/_bwrap/and"]],
        [[--tmpfs "/_bwrap/own/${USER}"]],
        [[--ro-bind "/etc" "/etc"]],
        [[--ro-bind "/opt" "/opt"]],
        [[--ro-bind "/srv" "/srv"]],
        [[--ro-bind "/usr/bin" "/usr/bin"]],
        [[--ro-bind "/usr/include" "/usr/include"]],
        [[--ro-bind "/usr/lib" "/usr/lib"]],
        [[--ro-bind "/usr/lib64" "/usr/lib64"]],
        [[--ro-bind "/usr/libexec" "/usr/libexec"]],
        [[--ro-bind "/usr/share" "/usr/share"]],
        [[--ro-bind "/usr/src" "/usr/src"]],
        [[--symlink "/usr/bin" "/bin"]],
        [[--symlink "/usr/lib" "/lib"]],
        [[--symlink "/usr/lib64" "/lib64"]],
}

