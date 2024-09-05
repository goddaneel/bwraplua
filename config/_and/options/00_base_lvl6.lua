#!/bin/lua


--- package
-- data
_g1_pack_data = {
        [[--die-with-parent]],
        [[--unshare-all]],
        [[--ro-bind "/" "/"]],
        [[--dev "/dev/"]],
        [[--proc "/proc/"]],
        [[--tmpfs "/home/"]],
        [[--tmpfs "/media/"]],
        [[--tmpfs "/mnt/"]],
        [[--tmpfs "/run/"]],
        [[--tmpfs "/swap/"]],
        [[--tmpfs "/sys/"]],
        [[--tmpfs "/tmp/"]],
        [[--tmpfs "/var/"]],
        [[--tmpfs "/usr/local/"]],
        [[--tmpfs "${HOME}/"]],
        [[--tmpfs "/timeshift"]],
}

