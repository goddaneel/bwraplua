#!/bin/lua


--- package
-- data
_g1_pack_data = {
        [[--ro-bind "/tmp/.X11-unix/X${DISPLAY##*:}" "/tmp/.X11-unix/X${DISPLAY##*:}"]],
        [[--ro-bind "${XAUTHORITY}" "${XAUTHORITY}"]],
        [[--setenv "DISPLAY" "${DISPLAY}"]],
        [[--setenv "XAUTHHORITY" "${XAUTHHORITY}"]],
        [[--setenv "GTK_IM_MODULE" "${GTK_IM_MODULE}"]],
        [[--setenv "QT_IM_MODULE" "${QT_IM_MODULE}"]],
        [[--setenv "SDL_IM_MODULE" "${SDL_IM_MODULE}"]],
}

