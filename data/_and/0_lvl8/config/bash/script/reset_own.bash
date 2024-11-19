#!/bin/bash


## config
echo -e "\n \033[4;34m ## config \033[0m"

# kwriteconfig
echo -e "\n \033[4;34m # kwriteconfig \033[0m"
#       #
batcat "${HOME}/.config/kioslaverc"
rm -fv "${HOME}/.config/kioslaverc"

# gsettings
echo -e "\n \033[4;34m # gsettings \033[0m"
#       #
gsettings reset-recursively org.gnome.system.proxy
gsettings list-recursively org.gnome.system.proxy


#       #
echo -e "\n \033[4;34m \033[0m"
#       #

