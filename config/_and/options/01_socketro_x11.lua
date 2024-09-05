#!/bin/lua


--- package
-- list
_g1_pack_listr = {
        "00_base_lvl6",
}

-- data
_g1_pack_data = {
        [[--ro-bind-try "/tmp/.X11-unix/X${DISPLAY##*:}" "/tmp/.X11-unix/X${DISPLAY##*:}"]],
        [[--ro-bind-try "${XAUTHORITY}" "${XAUTHORITY}"]],
        [[--setenv "GTK_IM_MODULE" "${GTK_IM_MODULE}"]],
        [[--setenv "QT_IM_MODULE" "${QT_IM_MODULE}"]],
        [[--setenv "SDL_IM_MODULE" "${SDL_IM_MODULE}"]],
}

