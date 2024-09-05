#!/bin/lua


--- package
-- list
_g1_pack_listr = {
        "00_base_lvl6",
}

-- data
_g1_pack_data = {
        [[--ro-bind-try "/run/user/$(id -u)/${WAYLAND_DISPLAY}" "/run/user/$(id -u)/${WAYLAND_DISPLAY}"]],
        [[--ro-bind-try "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}" "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"]],
        [[--unsetenv "GTK_IM_MODULE"]],
        [[--unsetenv "QT_IM_MODULE"]],
        [[--unsetenv "SDL_IM_MODULE"]],
}

