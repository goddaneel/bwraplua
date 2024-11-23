#!/bin/lua

--- package
-- last
_gs_lastvar_name = "0_lvl4"

-- data
_g1_pack_data = {
        [[--die-with-parent]],
        [[--unshare-all]],
        [[--share-net]],
        [[--proc "/proc"]],
        [[--tmpfs "/_bwrap/and"]],
        [[--tmpfs "/_bwrap/own/${USER}"]],
        [[--dev-bind "/dev" "/dev"]],
        [[--ro-bind "/etc" "/etc"]],
        [[--ro-bind "/home" "/home"]],
        [[--ro-bind "/media" "/media"]],
        [[--ro-bind "/opt" "/opt"]],
        [[--ro-bind "/run" "/run"]],
        [[--ro-bind "/srv" "/srv"]],
        [[--ro-bind "/sys" "/sys"]],
        [[--ro-bind "/usr" "/usr"]],
        [[--ro-bind "/var" "/var"]],
        [[--symlink "/usr/bin" "/bin"]],
        [[--symlink "/usr/lib" "/lib"]],
        [[--symlink "/usr/lib64" "/lib64"]],
        [[--symlink "/usr/sbin" "/sbin"]],
        [[--bind "/mnt" "/mnt"]],
        [[--bind "/tmp" "/tmp"]],
        [[--bind "/var/tmp" "/var/tmp"]],
        [[--bind "/media/${USER}" "/media/${USER}"]],
        [[--bind "${HOME}" "${HOME}"]],
        [[--bind "${XDG_RUNTIME_DIR}" "${XDG_RUNTIME_DIR}"]],
}

